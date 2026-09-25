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
    print("created gpu device, name: %\n", to_string(get_device_caps(device).device_name));

    vert_spirv, ok := read_entire_file("triangle.vert.spv");
    assert(ok);
    vertex_spirv := Span(u32).{
        data = xx vert_spirv.data,
        size = xx ( vert_spirv.count / 4 ),
    };

    frag_spirv:, ok = read_entire_file("triangle.frag.spv");
    assert(ok);
    fragment_spirv := Span(u32).{
        data = xx frag_spirv.data,
        size = xx ( frag_spirv.count / 4 ),
    };

    triangle_pso: *PSO = create_graphics_pso(device, GraphicsPSODesc.{
        vertex_spirv = vertex_spirv,
        fragment_spirv = fragment_spirv, // Empty omits the fragment stage, for depth-only rasterization.
        color_targets = Span(ColorTargetDesc).{
            data = *(ColorTargetDesc.{ format = COLOR_FORMAT }),
            size = 1,
        },
    });

    latest_completion := TimelinePoint.{ semaphore = create_timeline_semaphore(device) };
    command_pools: []*CommandPool = .[create_command_pool(device), create_command_pool(device)];


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
        commands := begin_commands(command_pool);

        frame := acquire(commands);
        if !frame.render_view  continue;
        colors := Span(ColorAttachment).{
            data = *(ColorAttachment.{
                render_view = frame.render_view,
                load = LoadOp.CLEAR,
            }),
            size = 1,
        };

        begin_render_pass(commands, *(RenderingDesc.{ colors = colors, }));
        bind_pso(commands, triangle_pso);
        draw(commands, ByteSpan.{}, 3);
        end_render_pass(commands);

        end_commands(commands);
        latest_completion.value += 1;
        submit_and_present(device, SubmitDesc.{
            commands = Span(*CommandBuffer).{*commands, 1},
            completion = latest_completion
        });
    }
}

#import "Basic"()(MEMORY_DEBUGGER = true, ENABLE_ASSERT = true);
#import "String";
#import "File";
#import "Window_Creation";
#import "Input";
#import "Windows";

NoGraphicsAPI :: #import,file "../module.jai"(DEBUG = true);
using NoGraphicsAPI.gpu;
