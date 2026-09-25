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
    build_options.output_executable_name = "triangle"; // Unpathed, does not include extension such as ".exe".
    build_options.output_path = get_working_directory();
    build_options.output_type = .EXECUTABLE;

    // We must set the build options before adding any source.
    // The compiler disallows this afterward, because it would result
    // in inconsistent compilation.
    set_build_options(build_options, workspace);

    autorun := false;
    command_line_opts := get_build_options();
    for command_line_opts.compile_time_command_line {
        if it == {
            case "-run"; autorun = true;
        }
    }

    // To tell the compiler to give us messages, we need to call compiler_begin_intercept
    // before we add any code to the target workspace.
    compiler_begin_intercept(workspace);

    #if OS == .LINUX {
        add_build_file("triangle_linux_x11.jai", workspace);
    } else #if OS == .WINDOWS {
        add_build_file("triangle_windows.jai", workspace);
    } else {
        assert(false, "Unsupported OS");
    }

    // listen in on compiler messages
    while true {
        message := compiler_wait_for_message();
        if message.kind == {
            case .ERROR; assert(false, "Error during compiler message handling");

            case .COMPLETE;
                break;
        }
    }

    compiler_end_intercept(workspace);

    if autorun {
        // The VK_LAYER_LUNARG_monitor utility layer displays the real-time frame rate in frames-per-second in the
        // application's title bar. It is only compatible with the Win32 and XCB windowing systems and will not display
        // the frame rate on other platforms.
        #if OS == .LINUX {
            POSIX :: #import "POSIX";
            POSIX.setenv("VK_INSTANCE_LAYERS", "VK_LAYER_LUNARG_monitor", 0);
        } else #if OS == .WINDOWS {
            SetEnvironmentVariableA("VK_INSTANCE_LAYERS", "VK_LAYER_LUNARG_monitor");
        } else {
            assert(false, "Unsupported OS");
        }

        run_build_result_of_workspace(workspace);
    }
}

init_options :: (workspace: Workspace, optimization_type: Optimization_Type) -> Build_Options {
    build_options := get_build_options(workspace);

    // ensures -quiet flag is included in our workspace, etc.
    copy_commonly_propagated_fields(get_build_options(), *build_options);

    set_optimization(*build_options, optimization_type);

    build_options.backend = .X64;
    build_options.arithmetic_overflow_check = .FATAL;

    #if OS == .LINUX {
        // linking against stdc++ for new/delete as those are transitive deps of NoGraphicsAPI
        // TODO: It'd be nice if we could update the library to enable custom allocators
        build_options.additional_linker_arguments = .["-lvulkan", "-lstdc++"];
    } else #if OS == .WINDOWS {
        vk_sdk_path := getVulkanSDKPath();
        // print("Vulkan SDK path: \"%\"\n", vk_sdk_path);
        build_options.additional_linker_arguments = .[tprint("/libpath:\"%/Lib\"", vk_sdk_path), "vulkan-1.lib"];
    } else {
        assert(false, "Unsupported OS");
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

#import "Basic";
#import "Compiler";
#import "String";
#if OS == .WINDOWS {
    #import "Windows";
}
#import "Metaprogram_Plugins";
#import "Autorun";
