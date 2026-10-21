#import "Basic";
#import "Objective_C";
#import "Objective_C/AppKit";
#import,file "../module.jai";

MyDelegate :: struct {
    using #as super: NSObject;
    drawInMTKView :: (self: *MTKViewDelegate, _sel: Selector, view: *MTKView) #c_call {
        push_context { log("drawInMTKView called! %", view); }
    } @selector(drawInMTKView:)

    mtkView :: (self: *MyDelegate, _sel: Selector, view: *MTKView, size: CGSize) #c_call {
        push_context { log("mtkView drawableSizeWillChange called! % %", view, size); }
    } @selector(mtkView:drawableSizeWillChange:)
}

main :: () {
    init_objective_c();
    init_app_kit();

    device := MTLCreateSystemDefaultDevice();
    defer release(device);

    clz := objc_create_class(MyDelegate, NSObject);
    objc_add_instance_method(clz, MyDelegate.drawInMTKView, "drawInMTKView:");
    objc_add_instance_method(clz, MyDelegate.mtkView, "mtkView:drawableSizeWillChange:");
    objc_finalize_class(clz);

    delegate := objc_new(MyDelegate);
    assert(delegate != null);

    view := objc_new(MTKView);
    assert(view != null);

    view.setDelegate(view, xx delegate);
    view.setDevice(view, device);
    NSView.setFrame(xx view, {{0, 0}, {64, 64}});
    NSView.setWantsLayer(xx view, YES);
    view.setEnableSetNeedsDisplay(view, NO);
    view.setPaused(view, NO);

    // TODO: this doesn't currently invoke our delegate; probably requires a runloop or even a window
    view.draw(view);


    log("OK");
}
