//
// This file was auto-generated using the following command:
//
// generate
//

MetalKit :: #library,system,link_always "MetalKit";  // We were having some problems on Mac, so, try this...
CGRect :: NSRect;
CGContextRef :: *void;
NSCoder :: struct {}




CALayerContentsGravity :: *NSString;
CALayerContentsFormat :: *NSString;
CALayerContentsFilter :: *NSString;
CALayerCornerCurve :: *NSString;

CAAutoresizingMask :: u32;
kCALayer :: enum CAAutoresizingMask {
    NotSizable    :: 0;
    MinXMargin    :: 1;
    WidthSizable  :: 2;
    MaxXMargin    :: 4;
    MinYMargin    :: 8;
    HeightSizable :: 16;
    MaxYMargin    :: 32;
}

CAToneMapMode :: *NSString;

CADynamicRange :: *NSString;

CAEdgeAntialiasingMask :: u32;
kCALayer_1 :: enum CAEdgeAntialiasingMask {
    LeftEdge   :: 1;
    RightEdge  :: 2;
    BottomEdge :: 4;
    TopEdge    :: 8;
}

CACornerMask :: NSUInteger;
kCALayerM :: enum CACornerMask {
    inXMinYCorner :: 1;
    axXMinYCorner :: 2;
    inXMaxYCorner :: 4;
    axXMaxYCorner :: 8;
}

CAAction :: struct {
    runActionForKey :: inline (self: *CAAction, event: *NSString, anObject: id, dict: *NSDictionary(id, id)) -> void {
        sel := sel_registerName("runActionForKey:object:arguments:");
        return xx (cast((*CAAction, Selector, *NSString, id, *NSDictionary(id, id)) -> void #c_call)objc_msgSend)(self, sel, event, anObject, dict);
    }
}

CALayerDelegate :: struct #type_info_none {
    displayLayer :: inline (self: *CALayerDelegate, layer: *CALayer) -> void {
        sel := sel_registerName("displayLayer:");
        return xx (cast((*CALayerDelegate, Selector, *CALayer) -> void #c_call)objc_msgSend)(self, sel, layer);
    }

    drawLayer :: inline (self: *CALayerDelegate, layer: *CALayer, ctx: CGContextRef) -> void {
        sel := sel_registerName("drawLayer:inContext:");
        return xx (cast((*CALayerDelegate, Selector, *CALayer, CGContextRef) -> void #c_call)objc_msgSend)(self, sel, layer, ctx);
    }

    layerWillDraw :: inline (self: *CALayerDelegate, layer: *CALayer) -> void {
        sel := sel_registerName("layerWillDraw:");
        return xx (cast((*CALayerDelegate, Selector, *CALayer) -> void #c_call)objc_msgSend)(self, sel, layer);
    }

    layoutSublayersOfLayer :: inline (self: *CALayerDelegate, layer: *CALayer) -> void {
        sel := sel_registerName("layoutSublayersOfLayer:");
        return xx (cast((*CALayerDelegate, Selector, *CALayer) -> void #c_call)objc_msgSend)(self, sel, layer);
    }

    actionForLayer :: inline (self: *CALayerDelegate, layer: *CALayer, event: *NSString) -> *CAAction {
        sel := sel_registerName("actionForLayer:forKey:");
        return xx (cast((*CALayerDelegate, Selector, *CALayer, *NSString) -> *CAAction #c_call)objc_msgSend)(self, sel, layer, event);
    }
}

/*!
@class MTKView
@abstract View for rendering metal content
*/
MTKView :: struct #type_info_none {
    #as using nsview:          NSView;
    #as using nscoding:        NSCoding;
    #as using calayerdelegate: CALayerDelegate;

    /*!
    @method initWithFrame:device
    @abstract Initalize the view with a frame and device
    @param frameRect The frame rectangle for the created view object.
    @param device The MTLDevice to be used by the view to create Metal objects
    */
    initWithFrame :: inline (/*!
@method initWithFrame:device
@abstract Initalize the view with a frame and device
@param frameRect The frame rectangle for the created view object.
@param device The MTLDevice to be used by the view to create Metal objects
*/
self: *$instancetype/MTKView, frameRect: CGRect, device: *MTLDevice) -> *instancetype {
        sel := sel_registerName("initWithFrame:device:");
        return xx (cast((*MTKView, Selector, CGRect, *MTLDevice) -> *instancetype #c_call)objc_msgSend)(self, sel, frameRect, device);
    }

    /*!
    @method initWithCoder:
    @abstract Returns a view initalized from data in a given unarchiver
    @param coder An unarchiver object
    */
    initWithCoder :: inline (/*!
@method initWithCoder:
@abstract Returns a view initalized from data in a given unarchiver
@param coder An unarchiver object
*/
self: *$instancetype/MTKView, coder: *NSCoder) -> *instancetype {
        sel := sel_registerName("initWithCoder:");
        return xx (cast((*MTKView, Selector, *NSCoder) -> *instancetype #c_call)objc_msgSend)(self, sel, coder);
    }

    /*!
    @method releaseDrawables
    @abstract Release the depthStencilTexture and multisampleColorTexture
    @discussion Can be called by the app to release the textures in order to conserve memory when it goes into the background.   The view will recreate multisampleColorTexture or depthStencilTexture upon the next access of the respective properties.  Both multisampleColorTexture and depthStencilTexture will be recreated in the access to currentRenderPassDescriptor.
    */
    releaseDrawables :: inline (/*!
@method releaseDrawables
@abstract Release the depthStencilTexture and multisampleColorTexture
@discussion Can be called by the app to release the textures in order to conserve memory when it goes into the background.   The view will recreate multisampleColorTexture or depthStencilTexture upon the next access of the respective properties.  Both multisampleColorTexture and depthStencilTexture will be recreated in the access to currentRenderPassDescriptor.
*/
self: *MTKView) -> void {
        sel := sel_registerName("releaseDrawables");
        return xx (cast((*MTKView, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    /*!
    @method draw
    @abstract Manually ask the view to draw new contents. This causes the view to call either the drawInMTKView (delegate) or drawRect (subclass) method.
    @discussion Manually ask the view to draw new contents. This causes the view to call either the drawInMTKView (delegate) or drawRect (subclass) method. This should be used when the view's paused proprety is set to true and enableSetNeedsDisplay is set to false.
    */
    draw :: inline (/*!
@method draw
@abstract Manually ask the view to draw new contents. This causes the view to call either the drawInMTKView (delegate) or drawRect (subclass) method.
@discussion Manually ask the view to draw new contents. This causes the view to call either the drawInMTKView (delegate) or drawRect (subclass) method. This should be used when the view's paused proprety is set to true and enableSetNeedsDisplay is set to false.
*/
self: *MTKView) -> void {
        sel := sel_registerName("draw");
        return xx (cast((*MTKView, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    delegate :: inline (self: *MTKView) -> *MTKViewDelegate {
        sel := sel_registerName("delegate");
        return xx (cast((*MTKView, Selector) -> *MTKViewDelegate #c_call)objc_msgSend)(self, sel);
    }
    setDelegate :: inline (self: *MTKView, delegate: *MTKViewDelegate) -> void {
        sel := sel_registerName("setDelegate:");
        return xx (cast((*MTKView, Selector, *MTKViewDelegate) -> void #c_call)objc_msgSend)(self, sel, delegate);
    }

    device :: inline (self: *MTKView) -> *MTLDevice {
        sel := sel_registerName("device");
        return xx (cast((*MTKView, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }
    setDevice :: inline (self: *MTKView, device: *MTLDevice) -> void {
        sel := sel_registerName("setDevice:");
        return xx (cast((*MTKView, Selector, *MTLDevice) -> void #c_call)objc_msgSend)(self, sel, device);
    }

    currentDrawable :: inline (self: *MTKView) -> *CAMetalDrawable {
        sel := sel_registerName("currentDrawable");
        return xx (cast((*MTKView, Selector) -> *CAMetalDrawable #c_call)objc_msgSend)(self, sel);
    }

    framebufferOnly :: inline (self: *MTKView) -> BOOL {
        sel := sel_registerName("framebufferOnly");
        return xx (cast((*MTKView, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setFramebufferOnly :: inline (self: *MTKView, framebufferOnly: BOOL) -> void {
        sel := sel_registerName("setFramebufferOnly:");
        return xx (cast((*MTKView, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, framebufferOnly);
    }

    depthStencilAttachmentTextureUsage :: inline (self: *MTKView) -> MTLTextureUsage {
        sel := sel_registerName("depthStencilAttachmentTextureUsage");
        return xx (cast((*MTKView, Selector) -> MTLTextureUsage #c_call)objc_msgSend)(self, sel);
    }
    setDepthStencilAttachmentTextureUsage :: inline (self: *MTKView, depthStencilAttachmentTextureUsage: MTLTextureUsage) -> void {
        sel := sel_registerName("setDepthStencilAttachmentTextureUsage:");
        return xx (cast((*MTKView, Selector, MTLTextureUsage) -> void #c_call)objc_msgSend)(self, sel, depthStencilAttachmentTextureUsage);
    }

    multisampleColorAttachmentTextureUsage :: inline (self: *MTKView) -> MTLTextureUsage {
        sel := sel_registerName("multisampleColorAttachmentTextureUsage");
        return xx (cast((*MTKView, Selector) -> MTLTextureUsage #c_call)objc_msgSend)(self, sel);
    }
    setMultisampleColorAttachmentTextureUsage :: inline (self: *MTKView, multisampleColorAttachmentTextureUsage: MTLTextureUsage) -> void {
        sel := sel_registerName("setMultisampleColorAttachmentTextureUsage:");
        return xx (cast((*MTKView, Selector, MTLTextureUsage) -> void #c_call)objc_msgSend)(self, sel, multisampleColorAttachmentTextureUsage);
    }

    presentsWithTransaction :: inline (self: *MTKView) -> BOOL {
        sel := sel_registerName("presentsWithTransaction");
        return xx (cast((*MTKView, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setPresentsWithTransaction :: inline (self: *MTKView, presentsWithTransaction: BOOL) -> void {
        sel := sel_registerName("setPresentsWithTransaction:");
        return xx (cast((*MTKView, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, presentsWithTransaction);
    }

    colorPixelFormat :: inline (self: *MTKView) -> MTLPixelFormat {
        sel := sel_registerName("colorPixelFormat");
        return xx (cast((*MTKView, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setColorPixelFormat :: inline (self: *MTKView, colorPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName("setColorPixelFormat:");
        return xx (cast((*MTKView, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, colorPixelFormat);
    }

    depthStencilPixelFormat :: inline (self: *MTKView) -> MTLPixelFormat {
        sel := sel_registerName("depthStencilPixelFormat");
        return xx (cast((*MTKView, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setDepthStencilPixelFormat :: inline (self: *MTKView, depthStencilPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName("setDepthStencilPixelFormat:");
        return xx (cast((*MTKView, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, depthStencilPixelFormat);
    }

    depthStencilStorageMode :: inline (self: *MTKView) -> MTLStorageMode {
        sel := sel_registerName("depthStencilStorageMode");
        return xx (cast((*MTKView, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }
    setDepthStencilStorageMode :: inline (self: *MTKView, depthStencilStorageMode: MTLStorageMode) -> void {
        sel := sel_registerName("setDepthStencilStorageMode:");
        return xx (cast((*MTKView, Selector, MTLStorageMode) -> void #c_call)objc_msgSend)(self, sel, depthStencilStorageMode);
    }

    sampleCount :: inline (self: *MTKView) -> NSUInteger {
        sel := sel_registerName("sampleCount");
        return xx (cast((*MTKView, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSampleCount :: inline (self: *MTKView, sampleCount: NSUInteger) -> void {
        sel := sel_registerName("setSampleCount:");
        return xx (cast((*MTKView, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampleCount);
    }

    clearColor :: inline (self: *MTKView) -> MTLClearColor {
        sel := sel_registerName("clearColor");
        return xx (cast((*MTKView, Selector) -> MTLClearColor #c_call)objc_msgSend)(self, sel);
    }
    setClearColor :: inline (self: *MTKView, clearColor: MTLClearColor) -> void {
        sel := sel_registerName("setClearColor:");
        return xx (cast((*MTKView, Selector, MTLClearColor) -> void #c_call)objc_msgSend)(self, sel, clearColor);
    }

    clearDepth :: inline (self: *MTKView) -> float64 {
        sel := sel_registerName("clearDepth");
        return xx (cast((*MTKView, Selector) -> float64 #c_call)objc_msgSend)(self, sel);
    }
    setClearDepth :: inline (self: *MTKView, clearDepth: float64) -> void {
        sel := sel_registerName("setClearDepth:");
        return xx (cast((*MTKView, Selector, float64) -> void #c_call)objc_msgSend)(self, sel, clearDepth);
    }

    clearStencil :: inline (self: *MTKView) -> u32 {
        sel := sel_registerName("clearStencil");
        return xx (cast((*MTKView, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }
    setClearStencil :: inline (self: *MTKView, clearStencil: u32) -> void {
        sel := sel_registerName("setClearStencil:");
        return xx (cast((*MTKView, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, clearStencil);
    }

    depthStencilTexture :: inline (self: *MTKView) -> *MTLTexture {
        sel := sel_registerName("depthStencilTexture");
        return xx (cast((*MTKView, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }

    multisampleColorTexture :: inline (self: *MTKView) -> *MTLTexture {
        sel := sel_registerName("multisampleColorTexture");
        return xx (cast((*MTKView, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }

    currentRenderPassDescriptor :: inline (self: *MTKView) -> *MTLRenderPassDescriptor {
        sel := sel_registerName("currentRenderPassDescriptor");
        return xx (cast((*MTKView, Selector) -> *MTLRenderPassDescriptor #c_call)objc_msgSend)(self, sel);
    }

    currentMTL4RenderPassDescriptor :: inline (self: *MTKView) -> *MTL4RenderPassDescriptor {
        sel := sel_registerName("currentMTL4RenderPassDescriptor");
        return xx (cast((*MTKView, Selector) -> *MTL4RenderPassDescriptor #c_call)objc_msgSend)(self, sel);
    }

    preferredFramesPerSecond :: inline (self: *MTKView) -> NSInteger {
        sel := sel_registerName("preferredFramesPerSecond");
        return xx (cast((*MTKView, Selector) -> NSInteger #c_call)objc_msgSend)(self, sel);
    }
    setPreferredFramesPerSecond :: inline (self: *MTKView, preferredFramesPerSecond: NSInteger) -> void {
        sel := sel_registerName("setPreferredFramesPerSecond:");
        return xx (cast((*MTKView, Selector, NSInteger) -> void #c_call)objc_msgSend)(self, sel, preferredFramesPerSecond);
    }

    enableSetNeedsDisplay :: inline (self: *MTKView) -> BOOL {
        sel := sel_registerName("enableSetNeedsDisplay");
        return xx (cast((*MTKView, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setEnableSetNeedsDisplay :: inline (self: *MTKView, enableSetNeedsDisplay: BOOL) -> void {
        sel := sel_registerName("setEnableSetNeedsDisplay:");
        return xx (cast((*MTKView, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, enableSetNeedsDisplay);
    }

    autoResizeDrawable :: inline (self: *MTKView) -> BOOL {
        sel := sel_registerName("autoResizeDrawable");
        return xx (cast((*MTKView, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAutoResizeDrawable :: inline (self: *MTKView, autoResizeDrawable: BOOL) -> void {
        sel := sel_registerName("setAutoResizeDrawable:");
        return xx (cast((*MTKView, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, autoResizeDrawable);
    }

    drawableSize :: inline (self: *MTKView) -> CGSize {
        sel := sel_registerName("drawableSize");
        return xx (cast((*MTKView, Selector) -> CGSize #c_call)objc_msgSend)(self, sel);
    }
    setDrawableSize :: inline (self: *MTKView, drawableSize: CGSize) -> void {
        sel := sel_registerName("setDrawableSize:");
        return xx (cast((*MTKView, Selector, CGSize) -> void #c_call)objc_msgSend)(self, sel, drawableSize);
    }

    preferredDrawableSize :: inline (self: *MTKView) -> CGSize {
        sel := sel_registerName("preferredDrawableSize");
        return xx (cast((*MTKView, Selector) -> CGSize #c_call)objc_msgSend)(self, sel);
    }

    preferredDevice :: inline (self: *MTKView) -> *MTLDevice {
        sel := sel_registerName("preferredDevice");
        return xx (cast((*MTKView, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    isPaused :: inline (self: *MTKView) -> BOOL {
        sel := sel_registerName("isPaused");
        return xx (cast((*MTKView, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setPaused :: inline (self: *MTKView, paused: BOOL) -> void {
        sel := sel_registerName("setPaused:");
        return xx (cast((*MTKView, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, paused);
    }

    colorspace :: inline (self: *MTKView) -> CGColorSpaceRef {
        sel := sel_registerName("colorspace");
        return xx (cast((*MTKView, Selector) -> CGColorSpaceRef #c_call)objc_msgSend)(self, sel);
    }
    setColorspace :: inline (self: *MTKView, colorspace: CGColorSpaceRef) -> void {
        sel := sel_registerName("setColorspace:");
        return xx (cast((*MTKView, Selector, CGColorSpaceRef) -> void #c_call)objc_msgSend)(self, sel, colorspace);
    }
}

/*!
@class MTKViewDelegate
@abstract Allows an object to render into the view and respond to resize events
*/
MTKViewDelegate :: struct #type_info_none {
    /*!
    @method mtkView:drawableSizeWillChange:
    @abstract Called whenever the drawableSize of the view will change
    @discussion Delegate can recompute view and projection matricies or regenerate any buffers to be compatible with the new view size or resolution
    @param view MTKView which called this method
    @param size New drawable size in pixels
    */
    mtkView :: inline (/*!
@method mtkView:drawableSizeWillChange:
@abstract Called whenever the drawableSize of the view will change
@discussion Delegate can recompute view and projection matricies or regenerate any buffers to be compatible with the new view size or resolution
@param view MTKView which called this method
@param size New drawable size in pixels
*/
self: *MTKViewDelegate, view: *MTKView, size: CGSize) -> void {
        sel := sel_registerName("mtkView:drawableSizeWillChange:");
        return xx (cast((*MTKViewDelegate, Selector, *MTKView, CGSize) -> void #c_call)objc_msgSend)(self, sel, view, size);
    }

    /*!
    @method drawInMTKView:
    @abstract Called on the delegate when it is asked to render into the view
    @discussion Called on the delegate when it is asked to render into the view
    */
    drawInMTKView :: inline (/*!
@method drawInMTKView:
@abstract Called on the delegate when it is asked to render into the view
@discussion Called on the delegate when it is asked to render into the view
*/
self: *MTKViewDelegate, view: *MTKView) -> void {
        sel := sel_registerName("drawInMTKView:");
        return xx (cast((*MTKViewDelegate, Selector, *MTKView) -> void #c_call)objc_msgSend)(self, sel, view);
    }
}

#scope_file

libobjc :: #library,system "libobjc";
