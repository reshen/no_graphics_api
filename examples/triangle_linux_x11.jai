XCB_LINKED :: false;

WIDTH :: 640;
HEIGHT :: 480;

main :: () {
    assert(OS == .LINUX, "This example requires linux");

    connection, window, wm_delete_window_atom := open_x11_window("triangle no graphics api");

    COLOR_FORMAT :: Format.BGRA8_SRGB;

    device_init: DeviceInit = create_device(.{
        window = cast(*void) window,  // HWND on Windows; xcb_window_t cast to void* on Linux.
        display = connection,  // Unused on Windows; xcb_connection_t* on Linux.
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

    should_quit := false;
    key_press_event: *xcb_key_press_event_t;

    while !should_quit {
        event: *xcb_generic_event_t = xcb_poll_for_event(connection);
        while (event != null) {
            if event.response_type & 0x7F == {
                case XCB_CLIENT_MESSAGE;
                client_message: *xcb_client_message_event_t = xx event;
                if (client_message.data.data32[0] == wm_delete_window_atom) {
                    should_quit = true;
                }

                case XCB_KEY_PRESS;
                key_press_event = cast(*xcb_key_press_event_t)event;
                // This is ESC
                if key_press_event.detail == 9 should_quit = true;
            }

            c_free(event);
            event = xcb_poll_for_event(connection);
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

open_x11_window :: (window_title: string) -> (connection: *xcb_connection_t, window: xcb_window_t, wm_delete_window_atom: xcb_atom_t) {
    #if !XCB_LINKED {
        load_procs(*xcb_procs, "libxcb.so");
    }

    screen_number: s32;
    connection: *xcb_connection_t = xcb_connect(null, *screen_number);
    assert(xcb_connection_has_error(connection) == 0);

    setup: *xcb_setup_t = xcb_get_setup(connection);
    screen_it: xcb_screen_iterator_t = xcb_setup_roots_iterator(setup);
    for 0..screen_number-1 {
        xcb_screen_next(*screen_it);
    }
    screen: *xcb_screen_t = screen_it.data;
    assert(screen != null);

    window: xcb_window_t = xcb_generate_id(connection);
    xcb_create_window(
        c=connection,
        depth=XCB_COPY_FROM_PARENT,
        wid=window,
        parent=screen.root,
        x=0, y=0, width=WIDTH, height=HEIGHT, border_width=1,
        _class=.XCB_WINDOW_CLASS_INPUT_OUTPUT,
        visual=screen.root_visual,
        value_mask=.XCB_CW_BACK_PIXEL | .XCB_CW_EVENT_MASK,
        value_list=u32.[screen.black_pixel, xx xcb_event_mask_t.XCB_EVENT_MASK_KEY_PRESS].data,
    );

    xcb_change_property(
        connection,
        .XCB_PROP_MODE_REPLACE,
        window,
        xx xcb_atom_enum_t.XCB_ATOM_WM_NAME,
        xx xcb_atom_enum_t.XCB_ATOM_STRING,
        8,
        xx window_title.count,
        xx window_title.data);


    wm_protocols := "WM_PROTOCOLS";
    protocols_cookie: xcb_intern_atom_cookie_t = xcb_intern_atom(connection, 1, xx wm_protocols.count,
        xx wm_protocols.data);
    wm_delete_window  := "WM_DELETE_WINDOW";
    delete_window_cookie: xcb_intern_atom_cookie_t = xcb_intern_atom(connection, 0, xx wm_delete_window.count, xx wm_delete_window.data);

    protocols_reply: *xcb_intern_atom_reply_t = xcb_intern_atom_reply(connection, protocols_cookie, null);
    delete_window_reply: *xcb_intern_atom_reply_t = xcb_intern_atom_reply(connection, delete_window_cookie, null);
    wm_delete_window_atom: xcb_atom_t = delete_window_reply.atom;
    if (protocols_reply && delete_window_reply) {
        xcb_change_property(
            connection,
            .XCB_PROP_MODE_REPLACE,
            window,
            protocols_reply.atom,
            xx xcb_atom_enum_t.XCB_ATOM_ATOM,
            32,
            1,
            *wm_delete_window_atom);
    }
    c_free(protocols_reply);
    c_free(delete_window_reply);

    xcb_map_window(connection, window);
    xcb_flush(connection);

    return connection, window, wm_delete_window_atom;
}

load_procs :: (procs: *$T, libname: string) -> success := false {
    generic_c_call :: #type () #c_call;

    lib := dlopen(temp_c_string(libname), RTLD_NOW);
    if !lib {
        log_error("Failed to load %: %", libname, to_string(dlerror()));
        return false;
    }

    tis := cast(*Type_Info_Struct) type_info(T);
    for m : tis.members {
        pi := cast(*Type_Info_Procedure) m.type;
        dlerror();
        ppfn := cast(*generic_c_call)((cast(*u8) procs) + m.offset_in_bytes);
        ppfn.* = cast(generic_c_call) dlsym(lib, m.name.data);
        assert(!!(ppfn.*), "Failed to resolve function '%': %", m.name, to_string(dlerror()));
    }

    return true;
}


libc :: #library,system "libc";
c_free :: (data: *void)  #foreign libc "free";
c_alloc :: (size: u64) -> *void #foreign libc "malloc";

#import "Basic"()(MEMORY_DEBUGGER = true, ENABLE_ASSERT = true);
#import "POSIX";
#import "String";
#import "File";

#if XCB_LINKED {
    #load "jai-on-linux/generated/xcb.jai";
    #load "jai-on-linux/generated/xcb_image.jai";
} else {
    #load "jai-on-linux/generated/xcb_fp.jai";
    #load "jai-on-linux/generated/xcb_image_fp.jai";

    using xcb_procs: XCB_Symbols;
    using xcb_image_procs: XCB_Image_Symbols;
}

NoGraphicsAPI :: #import,file "../module.jai"(DEBUG = false);
using NoGraphicsAPI.gpu;
