// This example works on windows, macos, and linux (x11)
WIDTH :: 640;
HEIGHT :: 480;

DEFAULT_MSAA :: 1;
COLOR_FORMAT :: Format.BGRA8_SRGB;

main :: () {
    defer assert_no_memory_leaks();

    platform_window, device_desc := create_window_and_device("triangle");

    device_init: DeviceInit = create_device(*device_desc);
    assert(device_init.error == .NONE, "err: %", device_init.error);
    device: *Device = device_init.device;
    assert(device != null);
    defer destroy_device(device);
    print("created gpu device, name: %\n", to_string(get_device_caps(device).device_name));

    vertex_shader_file :: #run add_shader_file_platform_ext("triangle.vert");
    fragment_shader_file :: #run add_shader_file_platform_ext("triangle.frag");

    ok: bool;
    vertex_spirv: ByteSpan;
    vertex_spirv, ok = read_entire_file(vertex_shader_file);
    defer free(vertex_spirv.data);
    assert(ok);

    fragment_spirv: ByteSpan;
    fragment_spirv, ok = read_entire_file(fragment_shader_file);
    defer free(fragment_spirv.data);
    assert(ok);

    triangle_pso: *PSO = create_graphics_pso(device, GraphicsPSODesc.{
        vertex = ShaderStage.{
            code = vertex_spirv,
            entry_point = "vertexMain",
        },
        fragment = ShaderStage.{
            code = fragment_spirv,
            entry_point = "fragmentMain",
        },
        color_targets = to_span(ColorTargetDesc.{ format = COLOR_FORMAT }),
    });
    assert(triangle_pso != null);
    defer destroy_pso(triangle_pso);

    latest_completion := TimelinePoint.{ semaphore = create_timeline_semaphore(device) };
    defer destroy_timeline_semaphore(latest_completion.semaphore);

    command_pools: []*CommandPool = .[create_command_pool(device), create_command_pool(device)];
    defer {
        for command_pools {
            destroy_command_pool(it);
        }
    }

    quit:= false;
    while !quit {
        quit = quit_event_received(platform_window);

        if (latest_completion.value >= 2) {
            wait_timeline(.{
                semaphore = latest_completion.semaphore,
                value = latest_completion.value - 1
            });
        }

        command_pool: *CommandPool = command_pools[latest_completion.value % 2];
        reset_command_pool(command_pool);
        commands: *CommandBuffer = begin_commands(command_pool);

        frame := acquire(commands);
        if !frame.render_view  continue;

        begin_render_pass(commands,
            *(RenderingDesc.{
                colors = to_span(ColorAttachment.{
                    render_view = frame.render_view,
                    load = LoadOp.CLEAR,
                })
            }));
        bind_pso(commands, triangle_pso);
        draw(commands, null, 3);
        end_render_pass(commands);

        end_commands(commands);
        latest_completion.value += 1;
        submit_and_present(device, SubmitDesc.{
            commands = to_span(commands),
            completion = latest_completion
        });
    }

    // wait for gpu to go idle before we start freeing gpu-related resources
    wait_idle(device);
}

assert_no_memory_leaks :: () {
    leak_count := make_leak_report().sorted_summaries.count;
    if (leak_count > 0) {
        log("\n\n**** Leak Report: ****\n");
        report_memory_leaks();
        debug_break();
    }
}

#import "Basic"()(MEMORY_DEBUGGER = true, ENABLE_ASSERT = true);
#import "String";
#import,file "../module.jai"(DEBUG = true);
#load "platform.jai";
