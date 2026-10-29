#import "String";

LIVE_OUTPUT :: true;

DECLARATIONS_TO_OMIT :: string.[
];

DECLARATIONS_TO_RENAME :: [2] string.[
    .[ "byte", "u8" ],
    .[ "int8", "s8" ],
    .[ "uint8", "u8" ],
    .[ "int16", "s16" ],
    .[ "uint16", "u16" ],
    .[ "int32", "s32" ],
    .[ "uint32", "u32" ],
    .[ "uint32x2", "u32x2" ],
    .[ "uint32x3", "u32x3" ],
    .[ "int64", "s64" ],
    .[ "uint64", "u64" ],
    .[ "uintptr", "u64" ],
];

#run build();
build :: () {
    set_build_options_dc(.{do_output=false});
    options := get_build_options();
    args := options.compile_time_command_line;

    if !build_no_graphics_api("Debug") {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !build_no_graphics_api("Release") {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

build_no_graphics_api :: (build_type: string) -> bool {
    print("\n------------- building libraries -------------\n\n");

    assert(build_type == "Debug" || build_type == "Release");

    BUILD_PATH := "NoGraphicsAPI/build";
    make_directory_if_it_does_not_exist(BUILD_PATH, true);
    absolute_build_path := get_absolute_path(BUILD_PATH);

    INSTALL_PATH := ifx OS == .LINUX then "linux" else ifx OS == .WINDOWS then "windows" else ifx OS == .MACOS then "macos" else "";
    if INSTALL_PATH == "" assert(false, "OS not supported yet");
    INSTALL_PATH = path_join(INSTALL_PATH, build_type);
    make_directory_if_it_does_not_exist(INSTALL_PATH, true);
    absolute_install_path := get_absolute_path(INSTALL_PATH);

    print("NoGraphicsAPI build path %, install path: %\n", absolute_build_path, absolute_install_path);

    print("Configuring NoGraphicsAPI build (% mode)...\n", build_type);
    #if OS == .LINUX {
        config_command: [..] string;
        array_add(*config_command,
            "cmake",
            "--fresh",
            "-B", absolute_build_path,
            tprint("-DCMAKE_BUILD_TYPE=%", build_type),
        );
        run_or_exit(config_command, working_directory = get_absolute_path("NoGraphicsAPI"));
    } else #if OS == .WINDOWS {
        config_command: [..] string;
        array_add(*config_command, "cmake", "--preset", "msvc");
        run_or_exit(config_command, working_directory = get_absolute_path("NoGraphicsAPI"));
    } else #if OS == .MACOS {
        config_command: [..] string;
        array_add(*config_command,
            "cmake",
            "--fresh",
            "-B", absolute_build_path,
            tprint("-DCMAKE_BUILD_TYPE=%", build_type),
            "-DCMAKE_OSX_SYSROOT=macosx",
        );
        run_or_exit(config_command, working_directory = get_absolute_path("NoGraphicsAPI"));
    }
    print("Done configuring NoGraphicsAPI.\n");


    print("Building NoGraphicsAPI (% mode)...\n", build_type);
    #if OS == .LINUX || OS == .MACOS {
        build_command: [..] string;
        array_add(*build_command, "cmake", "--build", absolute_build_path);
        run_or_exit(build_command, working_directory = get_absolute_path("NoGraphicsAPI"));
    } else #if OS == .WINDOWS {
        build_command: [..] string;
        array_add(*build_command, "cmake", "--build", "--preset", tprint("msvc-%", to_lower_copy(build_type)));
        run_or_exit(build_command, working_directory = get_absolute_path("NoGraphicsAPI"));
    }
    print("Done building NoGraphicsAPI.\n");

    print("Installing NoGraphicsAPI (% mode)...\n", build_type);
    #if OS == .LINUX || OS == .MACOS {
        install_command: [..] string;
        array_add(*install_command, "cmake", "--install", absolute_build_path, "--config", build_type, "--prefix", absolute_install_path);
        run_or_exit(install_command, working_directory = get_absolute_path("NoGraphicsAPI"));

        // clean up cmake dirs, we don't need them
        LIB_DIR := ifx OS == .LINUX then "lib64" else "lib";
        result := run_command("rm", "-vrf", tprint("%/%/cmake", INSTALL_PATH, LIB_DIR), capture_and_return_output = false, print_captured_output = LIVE_OUTPUT);
        assert(result.exit_code == 0);
    } else #if OS == .WINDOWS {
        source_dir_prefixes :: string.["NoGraphicsAPI/build-msvc", "NoGraphicsAPI/build-msvc/utility"];
        for source_dir_prefixes {
            src := tprint("%/%", it, build_type);
            dest := tprint("windows/%", build_type);
            // print("install windows libraries from % to %\n", src, dest);
            ok := copy_directory(src, dest,);
            assert(ok, "Unable to install windows libraries from % to %", src, dest);
        }
    }

    print("Done installing NoGraphicsAPI.\n");

    return true;
}

generate_bindings :: () -> bool {
    print("\n------------- generating bindings -------------\n\n");
    opts: Generate_Bindings_Options;

    opts.footer = FOOTER;
    opts.generate_library_declarations = false;
    opts.generate_compile_time_struct_checks = false;

    // It shouldn't matter if we use Debug or Release libs and headers for generating bindings from
    // since the binding interface (structs, functions, etc) are identical in either case
    build_type := "Release";

    platform: string;
    #if OS == .LINUX {
        platform = "linux";
        array_add(*opts.library_search_paths, path_join(get_absolute_path(platform), build_type, "lib64"));
        array_add(*opts.libraries, Library.{filename="libvulkan"});

        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPI"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_allocators"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_textures"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_uploads"});
    } else #if OS == .WINDOWS {
        platform = "windows";
        array_add(*opts.library_search_paths, path_join(get_absolute_path(platform), build_type));
        array_add(*opts.libraries, Library.{filename="NoGraphicsAPI"});
        array_add(*opts.libraries, Library.{filename="NoGraphicsAPIUtility_allocators"});
        array_add(*opts.libraries, Library.{filename="NoGraphicsAPIUtility_textures"});
        array_add(*opts.libraries, Library.{filename="NoGraphicsAPIUtility_uploads"});
    } else #if OS == .MACOS {
        //
        // IMPORTANT NOTE: 
        //
        // In order for the static library symbols to resolve, you need to modify jai's Bindings_Generator/module.jai.
        // Update Bindings_Generator/module.jai's behavior for static libraries in the `os_load_library` function,
        // replacing `os_get_symbol_names_from_file_fixed_and_cached` with `os_get_symbol_names_from_file`.  
        // In jai beta 2-030, that's line 8773. Thanks to @vik in discord for this fix.
        //
        platform = "macos";
        array_add(*opts.library_search_paths, path_join(get_absolute_path(platform), build_type, "lib"));
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPI"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_allocators"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_textures"});
        array_add(*opts.libraries, Library.{filename="libNoGraphicsAPIUtility_uploads"});

        // This fixes "NoGraphicsAPI/span.hpp:6:10: fatal error: 'initializer_list' file not found"
        array_add(*opts.include_paths, find_first_clang_cpp_include_path());
        array_add(*opts.system_types_to_include, "initializer_list");
    } else {
        #assert(false, "OS not supported");
    }

    main_lib_include_dir := path_join("NoGraphicsAPI", "include");
    utility_libs_include_dir := path_join("NoGraphicsAPI", "utility", "include");
    array_add(*opts.include_paths, main_lib_include_dir, utility_libs_include_dir);
    array_add(*opts.source_files, path_join(main_lib_include_dir, "NoGraphicsAPI", "NoGraphicsAPI.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "bump_allocator.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "delete_queue.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "fixed_function.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "heap_allocator.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "texture_allocator.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "texture_upload.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "bump_allocator.hpp"));
    // array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "math.hpp"));
    array_add(*opts.source_files, path_join(utility_libs_include_dir, "NoGraphicsAPIUtility", "upload_queue.hpp"));

    array_add(*opts.extra_clang_arguments, "-x", "c++", "-std=c++20");
    #if OS == .LINUX || OS == .MACOS{
        array_add(*opts.extra_clang_arguments, "-fPIC");
    }

    // get rid of the extra namespace, as jai lets the clients dictate what namespace they want
    array_add(*opts.flatten_namespaces, "gpu");

    opts.log_stripped_declarations = true;
    // NOTE: intentionally excluded Strip_Flags.SYMBOLS_WITH_UNKNOWN_FOREIGN_LIBS since that's how we can tell what the
    // actual symbol name is when looking at the generated bindings jai file
    opts.strip_flags = Strip_Flags.SYMBOLS_WITH_UNKNOWN_FOREIGN_LIBS | Strip_Flags.FUNCTIONS_WITH_VALIST;
    opts.visitor = visitor;

    output_filename: string;
    #if OS == .LINUX {
        output_filename = "linux/linux.jai";
    } else #if OS == .WINDOWS {
        output_filename = "windows/windows.jai";
        // WIN32_LEAN_AND_MEAN is a preprocessor macro you define before including <windows.h> that excludes rarely-used
        // Windows headers (e.g. winsock, crypto, dde) from windows.h, speeding up compilation and reducing namespace
        // pollution. You can still include those headers explicitly if needed.
        array_add(*opts.extra_clang_arguments, "-DWIN32_LEAN_AND_MEAN");
    } else if OS == .MACOS {
        output_filename = "macos/macos.jai";
    } else {
        assert(false, "TODO: need to add platform support");
    }

    return generate_bindings(opts, output_filename);
}

#scope_file

#import "Compiler";
#import "Bindings_Generator";
#import "File";
#import "File_Utilities";
#import "Basic";
#import "Process";

run_or_exit :: (command: [] string, working_directory: string) {
    // Enable this to see the commands being executed.
    print("Executing command \"%\" in directory \"%\"\n", join(..command, separator = " "), working_directory);

    result, output_string, error_string := run_command(..command, working_directory = working_directory, capture_and_return_output = true, print_captured_output = LIVE_OUTPUT);
    defer {
        free(output_string);
        free(error_string);
    }
    if result.exit_code != 0 {
        log_error("Could not run command \"%\" in directory \"%\". Exit code: %\nError:\n%", get_quoted_command_string(command), working_directory, result.exit_code, error_string);
        exit(1);
    }
}

visitor :: ( decl: *Declaration, parent_decl: *Declaration ) -> Declaration_Visit_Result {
    if array_find(DECLARATIONS_TO_OMIT, decl.name) {
        log("omitting blacklisted declaration: %", decl.name);
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }

    if decl.type && decl.type.type_of_enum != null {
        for decl.type.type_of_enum.enumerates {
            // log("enum renaming % -> %", it.output_name, to_snake_case_upper( it.output_name ));
            it.output_name = to_snake_case_upper( it.output_name );
        }
    }

    if parent_decl && parent_decl.name == "Entry" && decl.type && decl.name == "callback" {
        // By default, the binding generator will produce an invalid default value for callback (shown below).
        // Let's get rid of that.
        //
        //   Entry :: struct {
        //       retire_value: u64;
        //       callback:     FixedFunction(128) = 128;
        //   }

        decl.expression = null;
    }

    if parent_decl && parent_decl.name == "HeapAllocator" && decl.type && decl.name == "maximum_size" {
        // generator doesn't handle the following bit of c++ well, so we just correct the value
        //
        //    static constexpr uint64 alignment = 16;
        //    static constexpr uint64 maximum_size = uint64{0xffffffffu} * alignment;

        literal := New(Literal);
        literal.literal_kind = .UNSIGNED_INTEGER;
        literal.raw_value = tprint("%", 0xffffffff * 16);
        decl.expression = literal;
        decl.foreign_name = "";
    }

    for d: DECLARATIONS_TO_RENAME {
        original_name := d[0];
        updated_name := d[1];
        if original_name == decl.name {
            decl.output_name = updated_name;
            // decl.decl_flags = .OMIT_FROM_OUTPUT;
            // log("renamed % -> %", decl.name, decl.output_name);
        }
    }

    return .RECURSE;
}

to_snake_case_upper :: ( value: string ) -> string {
    is_upper := true;
    for value {
        if !((it >= #char "A" && it <= #char "Z") || it == #char "_" || (it >= #char "0" && it <= #char "9")) {
            is_upper = false;
            break;
        }
    }
    if is_upper then return value;

    builder: String_Builder;
    for value {
        if it >= #char "A" && it <= #char "Z" {
            if it_index > 0 {
                append( *builder, "_" );
            }
            append( *builder, it );
        } else {
            append( *builder, to_upper( it ) );
        }
    }
    // NOTE: builder_to_string uses context.allocator
    result := builder_to_string( *builder );
    return result;
}

// this is such a hack
find_first_clang_cpp_include_path :: () -> string {
    // here's the relevant portion of the clang command's output that we're looking for from my system. We want
    // to return something like: /opt/homebrew/Cellar/llvm/23.1.3_2/bin/../include/c++/v1
    //
    //   #include <...> search starts here:
    //    /opt/homebrew/Cellar/llvm/23.1.3_2/bin/../include/c++/v1
    //    /opt/homebrew/Cellar/llvm/23.1.3_2/lib/clang/23/include
    //    /Library/Developer/CommandLineTools/SDKs/MacOSX27.sdk/usr/include
    //    /Library/Developer/CommandLineTools/SDKs/MacOSX27.sdk/System/Library/Frameworks (framework directory)
    //    /Library/Developer/CommandLineTools/SDKs/MacOSX27.sdk/System/Library/SubFrameworks (framework directory)
    //   End of search list.
    //

    process_result, output_string, error_string := run_command(..split("clang++ -E -x c++ -v /dev/null", " "), capture_and_return_output = true, print_captured_output = false);
    assert(process_result.exit_code == 0);

    lines := split(error_string, "\n");
    include_dir: string;
    for lines {
        if it == "#include <...> search starts here:" && it_index + 1 < lines.count {
            include_dir = trim(lines[it_index + 1]);
            break;
        }
    }
    assert(include_dir.count > 0);

    return include_dir;
}

// clang-format off
#if OS == .LINUX {
FOOTER :: #string EOF
#if DEBUG {
    libnographicsapi :: #library,no_dll "Debug/lib64/libNoGraphicsAPI";
    libnographicsapiutility_uploads :: #library,no_dll "Debug/lib64/libNoGraphicsAPIUtility_uploads";
    libnographicsapiutility_allocators :: #library,no_dll "Debug/lib64/libNoGraphicsAPIUtility_allocators";
    libnographicsapiutility_textures :: #library,no_dll "Debug/lib64/libNoGraphicsAPIUtility_textures";
} else {
    libnographicsapi :: #library,no_dll "Release/lib64/libNoGraphicsAPI";
    libnographicsapiutility_uploads :: #library,no_dll "Release/lib64/libNoGraphicsAPIUtility_uploads";
    libnographicsapiutility_allocators :: #library,no_dll "Release/lib64/libNoGraphicsAPIUtility_allocators";
    libnographicsapiutility_textures :: #library,no_dll "Release/lib64/libNoGraphicsAPIUtility_textures";
}
libcxx :: #library,system,link_always "stdc++";
libvulkan :: #library,system,link_always "vulkan";
EOF
} else #if OS == .WINDOWS {
FOOTER :: #string EOF
#if DEBUG {
    nographicsapi :: #library,no_dll "Debug/NoGraphicsAPI";
    nographicsapiutility_uploads :: #library,no_dll "Debug/NoGraphicsAPIUtility_uploads";
    nographicsapiutility_allocators :: #library,no_dll "Debug/NoGraphicsAPIUtility_allocators";
    nographicsapiutility_textures :: #library,no_dll "Debug/NoGraphicsAPIUtility_textures";
} else {
    nographicsapi :: #library,no_dll "Release/NoGraphicsAPI";
    nographicsapiutility_uploads :: #library,no_dll "Release/NoGraphicsAPIUtility_uploads";
    nographicsapiutility_allocators :: #library,no_dll "Release/NoGraphicsAPIUtility_allocators";
    nographicsapiutility_textures :: #library,no_dll "Release/NoGraphicsAPIUtility_textures";
}
EOF
} else #if OS == .MACOS {
FOOTER :: #string EOF
#if DEBUG {
    libnographicsapi :: #library,no_dll "Debug/lib/libNoGraphicsAPI";
    libnographicsapiutility_uploads :: #library,no_dll "Debug/lib/libNoGraphicsAPIUtility_uploads";
    libnographicsapiutility_allocators :: #library,no_dll "Debug/lib/libNoGraphicsAPIUtility_allocators";
    libnographicsapiutility_textures :: #library,no_dll "Debug/lib/libNoGraphicsAPIUtility_textures";
} else {
    libnographicsapi :: #library,no_dll "Release/lib/libNoGraphicsAPI";
    libnographicsapiutility_uploads :: #library,no_dll "Release/lib/libNoGraphicsAPIUtility_uploads";
    libnographicsapiutility_allocators :: #library,no_dll "Release/lib/libNoGraphicsAPIUtility_allocators";
    libnographicsapiutility_textures :: #library,no_dll "Release/lib/libNoGraphicsAPIUtility_textures";
}
libcxx :: #library,system,link_always "libc++";
EOF
} else {
    assert(false, "TODO: need to add platform support");
}
// clang-format on
