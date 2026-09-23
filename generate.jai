#import "String";

LIVE_OUTPUT :: true;
DECLARATIONS_TO_OMIT :: string.[];

DECLARATIONS_TO_RENAME :: [2] string.[
    .[ "byte", "u8" ],
    .[ "int8", "s8" ],
    .[ "uint8", "u8" ],
    .[ "int16", "s16" ],
    .[ "uint16", "u16" ],
    .[ "int32", "s32" ],
    .[ "uint32", "u32" ],
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
    assert(build_type == "Debug" || build_type == "Release");

    BUILD_PATH := "NoGraphicsAPI/build";
    make_directory_if_it_does_not_exist(BUILD_PATH, true);
    absolute_build_path := get_absolute_path(BUILD_PATH);

    INSTALL_PATH := ifx OS == .LINUX then "linux" else "";
    if INSTALL_PATH == "" assert(false, "OS not supported yet");
    INSTALL_PATH = path_join(INSTALL_PATH, build_type);
    make_directory_if_it_does_not_exist(INSTALL_PATH, true);
    absolute_install_path := get_absolute_path(INSTALL_PATH);

    print("NoGraphicsAPI build path %, install path: %\n", absolute_build_path, absolute_install_path);

    {
        print("Configuring NoGraphicsAPI build (% mode)...\n", build_type);
        config_command: [..] string;
        array_add(*config_command,
            "cmake",
            "--fresh",
            "-B", absolute_build_path,
            tprint("-DCMAKE_BUILD_TYPE=%", build_type),
        );
        run_or_exit(config_command, working_directory = get_absolute_path("NoGraphicsAPI"));
        print("Done configuring NoGraphicsAPI.\n");
    }

    {
        print("Building NoGraphicsAPI (% mode)...\n", build_type);
        build_command: [..] string;
        array_add(*build_command, "cmake", "--build", absolute_build_path);
        run_or_exit(build_command, working_directory = get_absolute_path("NoGraphicsAPI"));
        print("Done building NoGraphicsAPI.\n");
    }

    {
        print("Installing NoGraphicsAPI (% mode)...\n", build_type);
        // cmake --install build --prefix ./install/debug
        install_command: [..] string;
        array_add(*install_command, "cmake", "--install", absolute_build_path, "--prefix", absolute_install_path);
        run_or_exit(install_command, working_directory = get_absolute_path("NoGraphicsAPI"));
        print("Done installing NoGraphicsAPI.\n");
    }

    return true;
}

generate_bindings :: () -> bool {
    opts: Generate_Bindings_Options;

    opts.footer = FOOTER;
    opts.generate_library_declarations = false;
    opts.generate_compile_time_struct_checks = false;

    // It shouldn't matter if we use Debug or Release libs and headers for generating bindings from
    // since the binding interface (structs, functions, etc) are identical in either case
    build_type := "Release";
    array_add(*opts.library_search_paths, path_join(get_absolute_path("linux"), build_type, "lib64"));
    array_add(*opts.libraries, Library.{filename="libNoGraphicsAPI"});
    array_add(*opts.libraries, Library.{filename="libvulkan"});
    array_add(*opts.include_paths, path_join(get_absolute_path("linux"), build_type, "include"));
    array_add(*opts.source_files, path_join("linux", build_type, "include", "NoGraphicsAPI", "NoGraphicsAPI.hpp"));
    array_add(*opts.extra_clang_arguments, "-x", "c++", "-std=c++20");

    opts.log_stripped_declarations = true;
    opts.strip_flags = Strip_Flags.CONSTRUCTORS | Strip_Flags.DESTRUCTORS | Strip_Flags.INLINED_FUNCTIONS | Strip_Flags.FUNCTIONS_WITH_VALIST;
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
    if !parent_decl && array_find( DECLARATIONS_TO_OMIT, decl.name ) {
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

    for d: DECLARATIONS_TO_RENAME {
        original_name := d[0];
        updated_name := d[1];
        if original_name == decl.name {
            decl.output_name = updated_name;
            // decl.decl_flags = .OMIT_FROM_OUTPUT;
            log("renamed % -> %", decl.name, decl.output_name);
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

// clang-format off
#if OS == .LINUX {
FOOTER :: #string EOF
#if DEBUG {
    libnographicsapi :: #library,no_dll "Debug/lib64/libNoGraphicsAPI";
} else {
    libnographicsapi :: #library,no_dll "Release/lib64/libNoGraphicsAPI";
}
EOF
} else {
    assert(false, "TODO: need to add platform support");
}
// clang-format on
