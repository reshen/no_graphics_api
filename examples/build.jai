#run,stallable build();
build :: () {
    optimization_type: Optimization_Type = Optimization_Type.VERY_DEBUG;

    // The goal of this program is actually to compile another program;
    // none of the code in this file is intended to end up in an executable
    // of any kind. So, we tell the compiler not to make an executable for us.
    // This sets Build_Options.output_type to NO_OUTPUT, so plain 'jai build.jai'
    // commands will no-op succeed
    set_build_options_dc(.{do_output = false}); // _dc stands for "during compile"

    main_workspace, main_build_options := init_main_build(optimization_type);

    compile(main_workspace, main_build_options);
}

init_main_build :: (optimization_type: Optimization_Type) -> Workspace, Build_Options {
    main_workspace := compiler_create_workspace("Main");
    assert(main_workspace != 0, "Workspace creation failed for main");

    build_options := init_options(main_workspace, optimization_type);
    build_options.output_executable_name = "triangle"; // Unpathed, does not include extension such as ".exe".
    build_options.output_type = .EXECUTABLE;

    return main_workspace, build_options;
}

compile :: (workspace: Workspace, build_options: Build_Options, plugins_to_create: [] Plugin_To_Create = .[]) {
    plugins: [..]*Metaprogram_Plugin;
    success := init_plugins(plugins_to_create, *plugins, workspace);
    assert(success, "A plugin init() failed. Exiting");

    // We must set the build options before adding any source.
    // The compiler disallows this afterward, because it would result
    // in inconsistent compilation.
    set_build_options(build_options, workspace);

    intercept_flags: Intercept_Flags;
    for plugins if it.before_intercept it.before_intercept(it, *intercept_flags);

    for plugins if it.add_source it.add_source(it);
    add_build_file("triangle.jai", workspace);

    for plugins if it.finish it.finish(it);
    for plugins if it.shutdown it.shutdown(it);
}

init_options :: (workspace: Workspace, optimization_type: Optimization_Type) -> Build_Options {
    build_options := get_build_options(workspace);

    // ensures -quiet flag is included in our workspace, etc.
    copy_commonly_propagated_fields(get_build_options(), *build_options);

    set_optimization(*build_options, optimization_type);

    build_options.backend = .X64;
    build_options.arithmetic_overflow_check = .FATAL;

    // linking against stdc++ for new/delete as those are transitive deps of NoGraphicsAPI
    // TODO: It'd be nice if we could update the library to enable custom allocators
    build_options.additional_linker_arguments = .["-lvulkan", "-lstdc++"];

    import_paths: [..] string;
    array_add(*import_paths, ..build_options.import_path);
    array_add(*import_paths, "modules");
    build_options.import_path = import_paths;

    return build_options;
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
#import "Metaprogram_Plugins";
