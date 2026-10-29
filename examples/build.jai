// debug subprocess execution
PRINT_RUN_CMD_OUTPUT :: false;

#run,stallable build();
build :: () {
    optimization_type: Optimization_Type = Optimization_Type.DEBUG;

    // The goal of this program is actually to compile another program;
    // none of the code in this file is intended to end up in an executable
    // of any kind. So, we tell the compiler not to make an executable for us.
    // This sets Build_Options.output_type to NO_OUTPUT, so plain 'jai build.jai'
    // commands will no-op succeed
    set_build_options_dc(.{do_output = false}); // _dc stands for "during compile"

    workspace := compiler_create_workspace("Main");
    assert(workspace != 0, "Workspace creation failed for main");

    build_options := init_options(workspace, optimization_type);
    build_options.output_path = ".";
    build_options.output_type = .EXECUTABLE;

    #if OS == .MACOS {
        // Silence lld-macos warnings about target min in versions
        build_options.minimum_os_version = { major = 26, minor = 0 };
    }

    autorun := false;
    command_line_opts := get_build_options();
    src_file: string;
    for command_line_opts.compile_time_command_line {
        if it == {
            case "-run"; autorun = true;

            case "-triangle"; 
                build_options.output_executable_name = "triangle"; // Unpathed, does not include extension such as ".exe".
                src_file = "triangle.jai";

            case "-cube"; 
                build_options.output_executable_name = "cube"; // Unpathed, does not include extension such as ".exe".
                src_file = "cube.jai";
        }
    }
    assert(src_file.count > 0, "You must provide specify an example, e.g., append either -triangle or -cube");

    // We must set the build options before adding any source.
    // The compiler disallows this afterward, because it would result
    // in inconsistent compilation.
    set_build_options(build_options, workspace);

    // To tell the compiler to give us messages, we need to call compiler_begin_intercept
    // before we add any code to the target workspace.
    compiler_begin_intercept(workspace);

    add_build_file(src_file, workspace);

    slang_builder: String_Builder;
    append(*slang_builder, "//\n// NOTE: This file was auto-generated, do not modify by hand\n//\n\n");
    append(*slang_builder, "#include <NoGraphicsAPIUtility/shader_types.h>\n");
    append(*slang_builder, "#include <NoGraphicsAPI/shader.slang>\n\n");

    // listen in on compiler messages
    while true {
        message := compiler_wait_for_message();
        if message.kind == {
            case .ERROR; assert(false, "Error during compiler message handling");

            case .TYPECHECKED;
                // @ShaderShared and associated code was copied (with permission) from https://github.com/wrapperup/cool-engine-jai/blob/ae7d0122c8d66ff41f274cab366ca98370f00c16/build.jai
                // thanks to vivian (https://github.com/wrapperup)
                typechecked := cast(*Message_Typechecked) message;
                for typechecked_struct: typechecked.structs {
                    struct_t := typechecked_struct.expression;
                    if has_note(struct_t.notes, "ShaderShared") {
                        struct_to_slang_struct(*slang_builder, struct_t);
                    }
                }

            case .COMPLETE;
                // The compiler sends us this message when compilation is finished.
                complete := cast(*Message_Complete) message;

                if complete.error_code == .NONE {
                    write_entire_file(tprint("generated_%.slang", build_options.output_executable_name), *slang_builder);
                }
                break;
        }
    }

    compiler_end_intercept(workspace);

    build_shaders(build_options.output_executable_name);

    if autorun {
        // The VK_LAYER_LUNARG_monitor utility layer displays the real-time frame rate in frames-per-second in the
        // application's title bar. It is only compatible with the Win32 and XCB windowing systems and will not display
        // the frame rate on other platforms.
        #if OS == .LINUX {
            POSIX :: #import "POSIX";
            POSIX.setenv("VK_INSTANCE_LAYERS", "VK_LAYER_LUNARG_monitor", 0);
        } else #if OS == .WINDOWS {
            SetEnvironmentVariableA("VK_INSTANCE_LAYERS", "VK_LAYER_LUNARG_monitor");
        }

        run_build_result_of_workspace(workspace);
    }
}

build_shaders :: (shader_filename_without_ext: string) {
    SHADER_NAMING :: struct {
        ext_name: string;
        stage_name: string;
        entry_point: string;
    };

    shaders :: SHADER_NAMING.[
        .{"frag", "fragment", "fragmentMain"},
        .{"vert", "vertex", "vertexMain"},
    ];

    for shaders {
        using it;

        process_result: Process_Result;

        #if OS == .LINUX || OS == .WINDOWS {
            cmd := tprint("slangc %.slang -target spirv -profile spirv_1_5 -emit-spirv-directly -fvk-use-entrypoint-name -entry % -stage % -fvk-use-c-layout -matrix-layout-row-major -I . -I ../NoGraphicsAPI/include -I ../NoGraphicsAPI/utility/include -capability spvDescriptorHeapEXT -o %.%.spv -Wall -Wextra -Wpedantic -warnings-as-errors all", shader_filename_without_ext, entry_point, stage_name, shader_filename_without_ext, ext_name);
            #if OS != .LINUX && OS != .WINDOWS {
                // TODO linux/windows having issues with this on 2026-10-28
                common_slang_args = tprint("% -validate-ir-detailed", common_slang_args);
            }
            run_cmd(cmd);

            cmd = tprint("spirv-val --target-env vulkan1.4 --scalar-block-layout %.%.spv", shader_filename_without_ext, ext_name);
            run_cmd(cmd);
        } else #if OS == .MACOS {
            cmd := tprint("slangc %.slang -entry % -stage % -fvk-use-c-layout -matrix-layout-row-major -I . -I ../NoGraphicsAPI/include -I ../NoGraphicsAPI/utility/include -target metal -DNOGRAPHICSAPI_METAL -o %.%.metal -validate-ir-detailed -Wall -Wextra -Wpedantic -warnings-as-errors all", shader_filename_without_ext, entry_point, stage_name, shader_filename_without_ext, ext_name);
            run_cmd(cmd);

            cmd = tprint("xcrun -sdk macosx metal -std=metal4.0 -c %.%.metal -o %.%.air", shader_filename_without_ext, ext_name, shader_filename_without_ext, ext_name);
            run_cmd(cmd);

            cmd = tprint("xcrun -sdk macosx metallib %.%.air -o %.%.metallib", shader_filename_without_ext, ext_name, shader_filename_without_ext, ext_name);
            run_cmd(cmd);
        } else { 
            assert(false, "Unsupported OS");
        }
    }
}

init_options :: (workspace: Workspace, optimization_type: Optimization_Type) -> Build_Options {
    build_options := get_build_options(workspace);

    // ensures -quiet flag is included in our workspace, etc.
    copy_commonly_propagated_fields(get_build_options(), *build_options);

    set_optimization(*build_options, optimization_type);

    build_options.arithmetic_overflow_check = .FATAL;

    #if OS == .WINDOWS {
        vk_sdk_path := getVulkanSDKPath();
        // print("Vulkan SDK path: \"%\"\n", vk_sdk_path);
        add_linker_args(*build_options, .[tprint("/libpath:\"%/Lib\"", vk_sdk_path), "vulkan-1.lib"]);
    }

    return build_options;
}

#if OS == .WINDOWS {
    getVulkanSDKPath :: () -> string {
        path := to_string(getenv("VULKAN_SDK"));
        if !path {
            path = to_string(getenv("VK_SDK_PATH"));
            if !path {
                compiler_report("Neither VULKAN_SDK nor VK_SDK_PATH environment variables were found. Install Vulkan SDK first.");
            }
        }

        for 0 .. path.count - 1 {
            if path[it] == #char "\\" {
                path[it] = #char "/";
            }
        }

        return path;
    }
}

add_linker_args :: (build_options: *Build_Options, args: [] string) {
    additional_linker_arguments: [..] string;
    additional_linker_arguments.allocator = temp;

    array_add(*additional_linker_arguments, ..build_options.additional_linker_arguments);
    array_add(*additional_linker_arguments, ..args);

    build_options.additional_linker_arguments = additional_linker_arguments;
}


has_note :: (notes: [] *Code_Note, note: string) -> bool {
    for notes  if it.text == note  return true;
    return false;
}

Type_Mapping :: struct {
    from: string;
    to:   string;
}

BANNED_TYPES :: Type_Mapping.[
    // .{ "ImageId", "Raw ImageId is not allowed, must be mapped with a note. Eg: @Image2D<f32>" },
    // .{ "SamplerId", "Raw SamplerId is not allowed, it must be mapped with a note. Eg: @Sampler or @SamplerComparison" },
];

TYPE_MAPPING_TABLE :: Type_Mapping.[
    .{ "float",   "float" },
    .{ "float32", "float" },
    .{ "float64", "double" },
    .{ "Vector2", "float2" },
    .{ "Vector3", "float3" },
    .{ "Vector4", "float4" },
    .{ "Matrix4", "float4x4" },
    .{ "Quaternion", "quaternion" },

    .{"u8",  "uint8_t" },
    .{"s8",  "int8_t" },
    .{"u16", "uint16_t" },
    .{"s16", "int16_t" },
    .{"u32", "uint32_t" },
    .{"s32", "int32_t" },
    .{"u64", "uint64_t" },
    .{"s64", "int64_t" },
    .{"int", "int64_t" },
];

RENAMABLE_TYPES :: Type_Mapping.[
    // .{ "ImageId",   "Image2D" },
    // .{ "SamplerId", "Sampler" },
];

map_type_to_slang_mappings :: (type: string) -> string {
    for TYPE_MAPPING_TABLE {
        if type == it.from {
            return it.to;
        }
    }

    return strip_gpu_name(type);
}

struct_to_slang_struct :: (builder: *String_Builder, struct_t: *Code_Struct) -> bool {
    info := struct_t.defined_type;

    if struct_t.modify_directives.count != 0 {
        compiler_report("No modifiers allowed on this struct.", loc = make_location(struct_t));
    }
    if struct_t.textual_flags != 0 {
        compiler_report("No struct modifier directives allowed.", loc = make_location(struct_t));
    }

    print_to_builder(builder, "struct % {\n", strip_gpu_name(info.(*Type_Info_Struct).name));
    for node: struct_t.block.statements {
        if node.kind != .DECLARATION {
            compiler_report("No struct modifier directives allowed.", loc = make_location(node));
        }

        decl := node.(*Code_Declaration);

        slang_string := parse_into_slang_member(decl, 1);
        print_to_builder(builder, slang_string);
    }
    print_to_builder(builder, "}\n\n");

    return true;
}

strip_gpu_name :: (s: string) -> string {
    if starts_with(s, "GPU_") {
        stripped := s;
        stripped.data += 4;
        stripped.count -= 4;

        return stripped;
    } else if starts_with(s, "GPU") {
        stripped := s;
        stripped.data += 3;
        stripped.count -= 3;

        return stripped;
    } else {
        return s;
    }
}

recurse_type_instantiation_to_string :: (inst: *Code_Type_Instantiation) -> type_name: string, array_str: string {
    name_builder: String_Builder;
    array_builder: String_Builder;

    // Handle array.
    if inst.array_element_type {
        if inst.array_dimension == null {
            compiler_report("Only fixed-size arrays are allowed.", loc = make_location(inst));
        }

        dimensions := inst.array_dimension.(*Code_Literal);

        good_array_value := 
        dimensions.value_type == .NUMBER && 
        !(dimensions.value_flags & .FLOAT) && 
        !(dimensions.value_flags & .MINUS_SIGN);

        if !good_array_value {
            compiler_report("Only positive integers are allowed.", loc = make_location(dimensions));
        }

        inner_type_name, inner_array_string := 
        recurse_type_instantiation_to_string(inst.array_element_type);

        print_to_builder(*array_builder, "%[%]",inner_array_string, dimensions.values._u64);

        return inner_type_name, builder_to_string(*array_builder);
    }

    if inst.must_implement != null {
        compiler_report("Interfaces are not allowed.", make_location(inst));
    }

    expr: *Code_Node;
    pointer: string;
    if inst.pointer_to != null {
        expr = inst.pointer_to.type_valued_expression;
        pointer = "*";
    } else {
        expr = inst.type_valued_expression;
    }

    assert(expr != null);

    if expr.kind == {
        case .IDENT;
            ident := expr.(*Code_Ident);

            return tprint("%%", map_type_to_slang_mappings(ident.name), pointer), "";

        case .PROCEDURE_CALL; // Struct polymorph
            call := expr.(*Code_Procedure_Call);

            if call.procedure_expression.kind != .IDENT {
                compiler_report("Member type must be an identifier.", make_location(call.procedure_expression));
            }
            ident := call.procedure_expression.(*Code_Ident);

            print_to_builder(*name_builder, "%<", map_type_to_slang_mappings(ident.name));

            for * arg: call.arguments_unsorted {
                if arg.expression.kind != .IDENT {
                    compiler_report(tprint("Polymorph member must be an ident. It was %", arg.expression.kind), make_location(arg.expression));
                }

                if it_index != call.arguments_unsorted.count-1 {
                    print_to_builder(*name_builder, ",");
                }

                print_to_builder(*name_builder, map_type_to_slang_mappings(arg.expression.(*Code_Ident).name));
            }

            print_to_builder(*name_builder, ">");

            return builder_to_string(*name_builder), "";

        case;
            compiler_report(tprint("Unsupported type expression on shader struct %", expr), make_location(expr));
    } 

    return "", "";
}

check_banned_type :: (type_string: string, node: *Code_Node) {
    for BANNED_TYPES {
        if it.from == type_string {
            compiler_report(it.to, loc = make_location(node));
        }
    }
}

parse_into_slang_member :: (decl: *Code_Declaration, indent: s64) -> member_string: string {
    builder: String_Builder;

    for 0..indent-1 {
        print_to_builder(*builder, "    ");
    }

    if decl.type_inst == null {
        compiler_report("There is no type instantiation. This shouldn't happen.", make_location(decl));
    }

    type_string, array_string := recurse_type_instantiation_to_string(decl.type_inst);

    if decl.notes.count == 1 {
        type_string = decl.notes[0].text;
    }

    check_banned_type(type_string, decl);

    print_to_builder(*builder, "% ", type_string);
    print_to_builder(*builder, decl.name);
    print_to_builder(*builder, array_string);
    print_to_builder(*builder, ";\n");

    return builder_to_string(*builder);
}

run_cmd :: (cmd: string) -> process_result: Process_Result {
    if PRINT_RUN_CMD_OUTPUT  print("running: %\n", cmd);
    process_result, output_string, error_string, timeout_reached := run_command(..split(cmd, " "), capture_and_return_output = true, print_captured_output = PRINT_RUN_CMD_OUTPUT);
    assert(process_result.exit_code == 0, "Subprocess failed!\n  cmd: %\n  stdout: %\n  stderr: %\n\n", cmd, output_string, error_string);
    return process_result;
}

#import "Basic";
#import "Compiler";
#import "String";
#if OS == .WINDOWS {
    #import "Windows";
}
#import "Metaprogram_Plugins";
#import "Autorun";
#import "Process";
#import "Compiler";
#import "File";
