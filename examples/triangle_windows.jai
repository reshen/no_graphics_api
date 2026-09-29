XCB_LINKED :: false;

WIDTH :: 640;
HEIGHT :: 480;

main :: () {
    assert(OS == .WINDOWS, "This example requires windows");

    window: HWND = create_window(WIDTH, HEIGHT, "triangle no graphics api");

    COLOR_FORMAT :: Format.BGRA8_SRGB;

    device_init: DeviceInit = create_device(.{
        window = cast(*void) window,  // HWND on Windows; xcb_window_t cast to void* on Linux.
        // display = connection,  // Unused on Windows; xcb_connection_t* on Linux.
        swapchain_format = COLOR_FORMAT,
        // desired_swapchain_image_count = 1, // 1..8 presentation contexts.
    });
    assert(device_init.error == .NONE, "err: %", device_init.error);
    device: *Device = device_init.device;
    defer destroy_device(device);
    print("created gpu device, name: %\n", to_string(get_device_caps(device).device_name));

    vertex_spirv, ok := read_entire_file("triangle.vert.spv");
    defer free(vertex_spirv.data);
    assert(ok);

    fragment_spirv:, ok = read_entire_file("triangle.frag.spv");
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
    defer destroy_pso(triangle_pso);

    latest_completion := TimelinePoint.{ semaphore = create_timeline_semaphore(device) };
    defer destroy_timeline_semaphore(latest_completion.semaphore);

    command_pools: []*CommandPool = .[create_command_pool(device), create_command_pool(device)];
    defer {
        for command_pools {
            destroy_command_pool(it);
        }
    }

    quit := false;
    while !quit {
        update_window_events();

        for events_this_frame {
            if it.type == .QUIT then quit = true;

            if it.type == .KEYBOARD {
                if it.key_pressed == 0 continue;

                if it.key_code == .ESCAPE {
                    quit = true;
                }
            }
        }


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

#import "Basic"()(MEMORY_DEBUGGER = true, ENABLE_ASSERT = true);
#import "String";
#import "File";
#import "Window_Creation";
#import "Input";
#import "Windows";

NoGraphicsAPI :: #import,file "../module.jai"(DEBUG = true);
using NoGraphicsAPI.gpu;
