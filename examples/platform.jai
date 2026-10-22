#if OS == .LINUX {
    PlatformWindow :: struct {
        connection: *xcb_connection_t; 
        window: xcb_window_t; 
        wm_delete_window_atom: xcb_atom_t;
    };
} else #if OS == .WINDOWS {
    PlatformWindow :: struct {
        window: HWND;
    };
} else #if OS == .MACOS {
    PlatformWindow :: struct {
        window: *CAMetalLayer;
    };
} else { 
    assert(false, "Unsupported OS");
}

create_window_and_device :: (window_title: string) -> PlatformWindow, DeviceDesc {
    platform_window: PlatformWindow;
    device_desc: DeviceDesc;

    #if OS == .LINUX {
        // create platform window
        platform_window.connection, platform_window.window, platform_window.wm_delete_window_atom = open_x11_window(window_title);
        assert(platform_window.connection != null);
        assert(platform_window.window != 0);

        device_desc = .{
            window = cast(*void) platform_window.window,  // HWND on Windows; CAMetalLayer* on macOS/iOS. xcb_window_t cast to void* on Linux. Null creates a headless device.
            display = platform_window.connection,  // Unused on Windows/macOS; xcb_connection_t* on Linux.
            swapchain_format = COLOR_FORMAT,
        };
    } else #if OS == .WINDOWS {
        // create platform window
        platform_window.window = create_window(WIDTH, HEIGHT, window_title);
        assert(platform_window.window != null);

        device_desc = .{
            window = cast(*void) platform_window.window,  // HWND on Windows; CAMetalLayer* on macOS/iOS. xcb_window_t cast to void* on Linux. Null creates a headless device.
            swapchain_format = COLOR_FORMAT,
        };
    } else #if OS == .MACOS {
        // create platform window
        platform_window.window = create_window_metal(WIDTH, HEIGHT, window_title);
        assert(platform_window.window != null);

        device_desc = .{
            window = cast(*void) platform_window.window,  // HWND on Windows; CAMetalLayer* on macOS/iOS. xcb_window_t cast to void* on Linux. Null creates a headless device.
            swapchain_format = COLOR_FORMAT,
        };
    } else { 
        assert(false, "Unsupported OS");
    }

    return platform_window, device_desc;
}


quit_event_received :: (platform_window: PlatformWindow) -> bool {
    #if OS == .LINUX {
        event: *xcb_generic_event_t = xcb_poll_for_event(platform_window.connection);
        while (event != null) {
            if event.response_type & 0x7F == {
                case XCB_CLIENT_MESSAGE;
                client_message: *xcb_client_message_event_t = xx event;
                if (client_message.data.data32[0] == platform_window.wm_delete_window_atom) {
                    return true;
                }

                case XCB_KEY_PRESS;
                key_press_event := cast(*xcb_key_press_event_t)event;
                // This is ESC
                if key_press_event.detail == 9 return true;
            }

            c_free(event);
            event = xcb_poll_for_event(platform_window.connection);
        }
    } else #if OS == .WINDOWS || OS == .MACOS {
        update_window_events();

        for events_this_frame {
            if it.type == .QUIT then return true;

            if it.type == .KEYBOARD {
                if it.key_code == .ESCAPE {
                    return true;
                }
            }
        }
    } else { 
        assert(false, "Unsupported OS");
    }

    return false;
}

add_shader_file_platform_ext :: (prefix: string) -> string {
    #if OS == .LINUX || OS == .WINDOWS {
        return join(prefix, ".", "spv");
    } else #if OS == .MACOS {
        return join(prefix, ".", "metallib");
    } else {
        assert(false, "Unsupported OS");
    }
}

#if OS == .LINUX {
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

    XCB_LINKED :: false;

    #if XCB_LINKED {
        #load "jai-on-linux/generated/xcb.jai";
        #load "jai-on-linux/generated/xcb_image.jai";
    } else {
        #load "jai-on-linux/generated/xcb_fp.jai";
        #load "jai-on-linux/generated/xcb_image_fp.jai";

        using xcb_procs: XCB_Symbols;
        using xcb_image_procs: XCB_Image_Symbols;
    }

    #import "POSIX";
} else #if OS == .MACOS {
    create_window_metal :: (width: int, height: int, window_name: string, window_x := -1, window_y := -1, parent: Window_Type = null, background_color_rgb := DEFAULT_WINDOW_CREATION_COLOR, wanted_msaa := DEFAULT_MSAA) -> *CAMetalLayer {
        if !application_initialized init_mac_app();

        // On MacOS, window dimensions are specified in points, not pixels.
        // To be consistent with our other APIs, we assume width and height to be in pixels
        // and convert them to points here. :MacHighResDisplays:
        target_screen := NSScreen.mainScreen();
        pixels_to_points_factor := cast(CGFloat) 1 / NSScreen.backingScaleFactor(target_screen);
        target_frame: NSRect = ---;
        target_frame.origin = .{ xx window_x * pixels_to_points_factor, xx window_y * pixels_to_points_factor };
        target_frame.size = .{ xx width * pixels_to_points_factor, xx height * pixels_to_points_factor };

        window := NSWindow.initWithContentRect(objc_alloc(NSWindow), target_frame,
            NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable, NSBackingStoreBuffered, NO, target_screen);


        // hmm... maybe it would be better if this wasnt kept in the autoreleasepool ?
        autorelease(window);
        NSWindow.setReleasedWhenClosed(window, NO);

        NSWindow.setTitle(window, window_name);

        #if #exists(context._macos_create_window_delegate) { // :DecoupleWindowCreationAndInput:
            wd := context._macos_create_window_delegate();
            NSWindow.setDelegate(window, wd);
        }

        NSWindow.setCollectionBehavior(window, NSWindowCollectionBehaviorFullScreenPrimary | NSWindowCollectionBehaviorManaged);
        NSWindow.makeKeyAndOrderFront(window, null);

        view := objc_init(objc_alloc(NSView));

        NSView.setWantsLayer(view, YES);
        autorelease(view);

        metal_layer: *CAMetalLayer = objc_init(objc_alloc(CAMetalLayer));
        autorelease(metal_layer);

        ns_view_set_layer(view, cast(*CALayer) metal_layer);

        NSWindow.setContentView(window, xx view);
        NSWindow.makeFirstResponder(window, view);

        // @ToDo: Centering the window makes it more presentable, but is obviously
        // in direct conflict with params window_x and window_y.
        if window_x == -1 && window_y == -1 {
            NSWindow.center(window);
        }

        CAMetalLayer.setDrawableSize(metal_layer, .{xx width, xx height});

        // return window;
        return metal_layer;
    }

    ns_view_set_layer :: (self: *NSView, layer: *CALayer) {
        func: (*NSView, Selector, *CALayer) -> void #c_call;
        func = xx objc_msgSend;
        func(self, sel_registerName("setLayer:"), layer);
    }

    DEFAULT_WINDOW_CREATION_COLOR :: float.[.15,.15,.2];

    #import "Objective_C";
    #import "Objective_C/AppKit";
    #import "Metal";
} else #if OS == .WINDOWS {
    #import "Windows";
} else { 
    assert(false, "Unsupported OS");
}

#import "Input";
#import "Window_Creation"(DEFAULT_MSAA = DEFAULT_MSAA);
