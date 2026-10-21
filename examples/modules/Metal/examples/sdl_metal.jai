/*

Minimal SDL + Metal4 example.

Optionally pass --singleframe to do a one frame test. For example:

    jai -quiet sdl_metal.jai +Autorun -singleframe

*/

main :: () {
    init_objective_c();
    init_metal();

    success, args, is_set := parse_arguments(struct { singleframe: bool; });
    singleframe := success && is_set.singleframe;

    SDL_SetHint(SDL_HINT_RENDER_DRIVER, "metal");
    SDL_Init(SDL_INIT_VIDEO);
    defer SDL_Quit();

    // Create an application window with the following settings:
    window := SDL_CreateWindow("SDL + Metal 4", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_ALLOW_HIGHDPI);
    if !window {
        log_error("Could not create window: %\n", to_string(SDL_GetError()));
        exit(1);
    }
    defer SDL_DestroyWindow(window);

    renderer := SDL_CreateRenderer(window, -1, .PRESENTVSYNC);
    defer SDL_DestroyRenderer(renderer);

    swapchain := cast(*CAMetalLayer) SDL_RenderGetMetalLayer(renderer);
    device := CAMetalLayer.device(swapchain);

    // Create MTL4 command queue
    mtl4_desc := objc_new(MTL4CommandQueueDescriptor);
    error: *NSError = null;
    queue := MTLDevice.newMTL4CommandQueueWithDescriptor(device, mtl4_desc, *error);
    defer release(queue);
    release(mtl4_desc);

    // Create command allocator for reuse
    allocator := MTLDevice.newCommandAllocator(device);
    defer release(allocator);

    color: MTLClearColor = {1.0, 0, 0, 1};

    // Check that the window was successfully created
    if window == null {
        log_error("Could not create window: %\n", to_string(SDL_GetError()));
        return;
    }

    quit_requested := false;
    while !quit_requested && !singleframe {
        event: SDL_Event;
        while SDL_PollEvent(*event) {
            if event.type == {
                case SDL_QUIT;
                    quit_requested = true;
                case SDL_KEYUP;
                    if event.key.keysym.sym == SDLK_ESCAPE quit_requested = true;
            }
        }

        color.red = ifx color.red > 1.0 then cast(float64)0.0 else color.red + 0.01;

        pool := objc_new(NSAutoreleasePool);
        defer NSAutoreleasePool.drain(pool);

        drawable := CAMetalLayer.nextDrawable(swapchain);

        // Create MTL4 render pass descriptor
        pass := objc_new(MTL4RenderPassDescriptor);
        defer release(pass);

        color_attachments := pass.colorAttachments(pass);
        color_attachment := color_attachments.objectAtIndexedSubscript(color_attachments, 0);
        {
            using color_attachment;
            setClearColor(color_attachment, color);
            setLoadAction(color_attachment, .Clear);
            setStoreAction(color_attachment, .Store);
            setTexture(color_attachment, drawable.texture(drawable));
        }

        buffer := MTLDevice.newCommandBuffer(device);
        buffer.beginCommandBufferWithAllocator(buffer, allocator);

        encoder := MTL4CommandBuffer.renderCommandEncoderWithDescriptor(buffer, pass);
        MTL4CommandEncoder.endEncoding(encoder);

        queue.waitForDrawable(queue, drawable);
        buffer.endCommandBuffer(buffer);
        queue.commit(queue, *buffer, 1);
        queue.signalDrawable(queue, drawable);
        drawable.present(drawable);
    }


    if singleframe print("OK!\n");
}

#scope_file
#import "Basic";
using,except(NO) SDL :: #import "SDL";
#import,file "../module.jai"; // the local Metal module
#import "Objective_C";
#import "Command_Line";
