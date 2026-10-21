//
// This file was auto-generated using the following command:
//
// generate
//
#import "Objective_C";
sel_registerName2 :: ($name: string) -> Selector #no_context {
    libobjc :: #library,system "libobjc";
    sel :: (str: *u8) -> SEL #foreign libobjc "sel_registerName";
    return sel(name.data);
}
#import "macOS"; // TODO: iOS optionally instead

// Types not automatically imported
IOSurfaceRef :: *void;
Block :: *void;  // Objective-C blocks - opaque pointer
task_id_token_t :: u32;  // Mach task identity token
CGColorSpaceRef :: *void;
CAEDRMetadata :: *void;

// Forward declaration for NSNumber (used by Metal but not in base Objective_C module)
NSNumber :: struct { #as using nsobject: NSObject; }

// Empty protocol structs for inheritance
NSFastEnumeration :: struct {}
NSCopying :: struct {}
NSSecureCoding :: struct {}

Metal :: #library,system,link_always "Metal";  // We were having some problems on Mac, so, try this...
MTLCreateSystemDefaultDevice :: () -> *MTLDevice #foreign Metal;

MTLClearColorMake :: (red: float64, green: float64, blue: float64, alpha: float64) -> MTLClearColor {
    col: MTLClearColor = ---;
    col.red = red;
    col.green = green;
    col.blue = blue;
    col.alpha = alpha;
    return col;
}

init_metal :: () {
    // TODO: do selector Structs instead of sel_registerName
}




MTLResourceCPUCacheModeShift :: 0;
MTLResourceCPUCacheModeMask :: 0xf << MTLResourceCPUCacheModeShift;

MTLResourceStorageModeShift :: 4;
MTLResourceStorageModeMask :: 0xf << MTLResourceStorageModeShift;

MTLResourceHazardTrackingModeShift :: 8;
MTLResourceHazardTrackingModeMask :: 0x3 << MTLResourceHazardTrackingModeShift;

MTL_TENSOR_MAX_RANK :: 16;

MTLCounterErrorValue :: cast,trunc(u64) ~0;

MTLOrigin :: struct #type_info_none {
    x: NSUInteger;
    y: NSUInteger;
    z: NSUInteger;
}

MTLSize :: struct #type_info_none {
    width:  NSUInteger;
    height: NSUInteger;
    depth:  NSUInteger;
}

MTLRegion :: struct #type_info_none {
    origin: MTLOrigin;
    size:   MTLSize;
}

MTLSamplePosition :: struct #type_info_none {
    x: float;
    y: float;
}

MTLCoordinate2D :: MTLSamplePosition;

MTLResourceID :: struct #type_info_none {
    _impl: u64;
}

MTLResourceUsage :: NSUInteger;
MTLResourceUsage_1 :: enum MTLResourceUsage {
    Read   :: 1;
    Write  :: 2;
    Sample :: 4;
}

MTLBarrierScope :: NSUInteger;
MTLBarrierScope_1 :: enum MTLBarrierScope {
    Buffers       :: 1;
    Textures      :: 2;
    RenderTargets :: 4;
}

MTLStages :: NSUInteger;
MTLStage :: enum MTLStages {
    Vertex                :: 1;

    Fragment              :: 2;

    Tile                  :: 4;

    Object                :: 8;

    Mesh                  :: 16;

    ResourceState         :: 67108864;

    Dispatch              :: 134217728;

    Blit                  :: 268435456;

    AccelerationStructure :: 536870912;

    MachineLearning       :: 1073741824;

    All                   :: 9223372036854775807;
}

MTLCommandEncoder :: struct #type_info_none {
    endEncoding :: inline (self: *MTLCommandEncoder) -> void {
        sel := sel_registerName2("endEncoding");
        return xx (cast((*MTLCommandEncoder, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    barrierAfterQueueStages :: inline (self: *MTLCommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages) -> void {
        sel := sel_registerName2("barrierAfterQueueStages:beforeStages:");
        return xx (cast((*MTLCommandEncoder, Selector, MTLStages, MTLStages) -> void #c_call)objc_msgSend)(self, sel, afterQueueStages, beforeStages);
    }

    insertDebugSignpost :: inline (self: *MTLCommandEncoder, _string: *NSString) -> void {
        sel := sel_registerName2("insertDebugSignpost:");
        return xx (cast((*MTLCommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    pushDebugGroup :: inline (self: *MTLCommandEncoder, _string: *NSString) -> void {
        sel := sel_registerName2("pushDebugGroup:");
        return xx (cast((*MTLCommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    popDebugGroup :: inline (self: *MTLCommandEncoder) -> void {
        sel := sel_registerName2("popDebugGroup");
        return xx (cast((*MTLCommandEncoder, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLCommandEncoder) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLCommandEncoder, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLCommandEncoder) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCommandEncoder, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLCommandEncoder, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLCommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLAllocation :: struct #type_info_none {
    allocatedSize :: inline (self: *MTLAllocation) -> NSUInteger {
        sel := sel_registerName2("allocatedSize");
        return xx (cast((*MTLAllocation, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLPurgeableState :: enum NSUInteger {
    KeepCurrent :: 1;

    NonVolatile :: 2;
    Volatile    :: 3;
    Empty       :: 4;
}

MTLCPUCacheMode :: enum NSUInteger {
    DefaultCache  :: 0;
    WriteCombined :: 1;
}

MTLStorageMode :: enum NSUInteger {
    Shared     :: 0;
    Managed    :: 1;
    Private    :: 2;
    Memoryless :: 3;
}

MTLHazardTrackingMode :: enum NSUInteger {
    Default   :: 0;
    Untracked :: 1;
    Tracked   :: 2;
}

MTLResourceOptions :: NSUInteger;
MTLResource :: enum MTLResourceOptions {
    CPUCacheModeDefaultCache        :: 0;
    CPUCacheModeWriteCombined       :: 1;

    StorageModeShared               :: 0;
    StorageModeManaged              :: 16;
    StorageModePrivate              :: 32;
    StorageModeMemoryless           :: 48;

    HazardTrackingModeDefault       :: 0;
    HazardTrackingModeUntracked     :: 256;
    HazardTrackingModeTracked       :: 512;

    OptionCPUCacheModeDefault       :: 0;
    OptionCPUCacheModeWriteCombined :: 1;
}

MTLSparsePageSize :: enum NSInteger {
    _16  :: 101;
    _64  :: 102;
    _256 :: 103;
}

MTLBufferSparseTier :: enum NSInteger {
    None :: 0;

    _1   :: 1;
}

MTLTextureSparseTier :: enum NSInteger {
    None :: 0;

    _1   :: 1;

    _2   :: 2;
}

MTLResource_1 :: struct #type_info_none {
    #as using mtlallocation: MTLAllocation;

    setPurgeableState :: inline (self: *MTLResource_1, state: MTLPurgeableState) -> MTLPurgeableState {
        sel := sel_registerName2("setPurgeableState:");
        return xx (cast((*MTLResource_1, Selector, MTLPurgeableState) -> MTLPurgeableState #c_call)objc_msgSend)(self, sel, state);
    }

    makeAliasable :: inline (self: *MTLResource_1) -> void {
        sel := sel_registerName2("makeAliasable");
        return xx (cast((*MTLResource_1, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    isAliasable :: inline (self: *MTLResource_1) -> BOOL {
        sel := sel_registerName2("isAliasable");
        return xx (cast((*MTLResource_1, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    setOwnerWithIdentity :: inline (self: *MTLResource_1, task_id_token: task_id_token_t) -> kern_return_t {
        sel := sel_registerName2("setOwnerWithIdentity:");
        return xx (cast((*MTLResource_1, Selector, task_id_token_t) -> kern_return_t #c_call)objc_msgSend)(self, sel, task_id_token);
    }

    label :: inline (self: *MTLResource_1) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLResource_1, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLResource_1, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLResource_1, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLResource_1) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLResource_1, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    cpuCacheMode :: inline (self: *MTLResource_1) -> MTLCPUCacheMode {
        sel := sel_registerName2("cpuCacheMode");
        return xx (cast((*MTLResource_1, Selector) -> MTLCPUCacheMode #c_call)objc_msgSend)(self, sel);
    }

    storageMode :: inline (self: *MTLResource_1) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLResource_1, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }

    hazardTrackingMode :: inline (self: *MTLResource_1) -> MTLHazardTrackingMode {
        sel := sel_registerName2("hazardTrackingMode");
        return xx (cast((*MTLResource_1, Selector) -> MTLHazardTrackingMode #c_call)objc_msgSend)(self, sel);
    }

    resourceOptions :: inline (self: *MTLResource_1) -> MTLResourceOptions {
        sel := sel_registerName2("resourceOptions");
        return xx (cast((*MTLResource_1, Selector) -> MTLResourceOptions #c_call)objc_msgSend)(self, sel);
    }

    heap :: inline (self: *MTLResource_1) -> *MTLHeap {
        sel := sel_registerName2("heap");
        return xx (cast((*MTLResource_1, Selector) -> *MTLHeap #c_call)objc_msgSend)(self, sel);
    }

    heapOffset :: inline (self: *MTLResource_1) -> NSUInteger {
        sel := sel_registerName2("heapOffset");
        return xx (cast((*MTLResource_1, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLResource_1) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLResource_1, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    allocatedSize :: inline (self: *MTLResource_1) -> NSUInteger {
        sel := sel_registerName2("allocatedSize");
        return xx (cast((*MTLResource_1, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLPixelFormat :: enum NSUInteger {
    Invalid               :: 0;

    A8Unorm               :: 1;

    R8Unorm               :: 10;
    R8Unorm_sRGB          :: 11;
    R8Snorm               :: 12;
    R8Uint                :: 13;
    R8Sint                :: 14;

    R16Unorm              :: 20;
    R16Snorm              :: 22;
    R16Uint               :: 23;
    R16Sint               :: 24;
    R16Float              :: 25;

    RG8Unorm              :: 30;
    RG8Unorm_sRGB         :: 31;
    RG8Snorm              :: 32;
    RG8Uint               :: 33;
    RG8Sint               :: 34;

    B5G6R5Unorm           :: 40;
    A1BGR5Unorm           :: 41;
    ABGR4Unorm            :: 42;
    BGR5A1Unorm           :: 43;

    R32Uint               :: 53;
    R32Sint               :: 54;
    R32Float              :: 55;

    RG16Unorm             :: 60;
    RG16Snorm             :: 62;
    RG16Uint              :: 63;
    RG16Sint              :: 64;
    RG16Float             :: 65;

    RGBA8Unorm            :: 70;
    RGBA8Unorm_sRGB       :: 71;
    RGBA8Snorm            :: 72;
    RGBA8Uint             :: 73;
    RGBA8Sint             :: 74;

    BGRA8Unorm            :: 80;
    BGRA8Unorm_sRGB       :: 81;

    RGB10A2Unorm          :: 90;
    RGB10A2Uint           :: 91;

    RG11B10Float          :: 92;
    RGB9E5Float           :: 93;

    BGR10A2Unorm          :: 94;

    BGR10_XR              :: 554;
    BGR10_XR_sRGB         :: 555;

    RG32Uint              :: 103;
    RG32Sint              :: 104;
    RG32Float             :: 105;

    RGBA16Unorm           :: 110;
    RGBA16Snorm           :: 112;
    RGBA16Uint            :: 113;
    RGBA16Sint            :: 114;
    RGBA16Float           :: 115;

    BGRA10_XR             :: 552;
    BGRA10_XR_sRGB        :: 553;

    RGBA32Uint            :: 123;
    RGBA32Sint            :: 124;
    RGBA32Float           :: 125;

    BC1_RGBA              :: 130;
    BC1_RGBA_sRGB         :: 131;
    BC2_RGBA              :: 132;
    BC2_RGBA_sRGB         :: 133;
    BC3_RGBA              :: 134;
    BC3_RGBA_sRGB         :: 135;

    BC4_RUnorm            :: 140;
    BC4_RSnorm            :: 141;
    BC5_RGUnorm           :: 142;
    BC5_RGSnorm           :: 143;

    BC6H_RGBFloat         :: 150;
    BC6H_RGBUfloat        :: 151;
    BC7_RGBAUnorm         :: 152;
    BC7_RGBAUnorm_sRGB    :: 153;

    PVRTC_RGB_2BPP        :: 160;
    PVRTC_RGB_2BPP_sRGB   :: 161;
    PVRTC_RGB_4BPP        :: 162;
    PVRTC_RGB_4BPP_sRGB   :: 163;
    PVRTC_RGBA_2BPP       :: 164;
    PVRTC_RGBA_2BPP_sRGB  :: 165;
    PVRTC_RGBA_4BPP       :: 166;
    PVRTC_RGBA_4BPP_sRGB  :: 167;

    EAC_R11Unorm          :: 170;
    EAC_R11Snorm          :: 172;
    EAC_RG11Unorm         :: 174;
    EAC_RG11Snorm         :: 176;
    EAC_RGBA8             :: 178;
    EAC_RGBA8_sRGB        :: 179;

    ETC2_RGB8             :: 180;
    ETC2_RGB8_sRGB        :: 181;
    ETC2_RGB8A1           :: 182;
    ETC2_RGB8A1_sRGB      :: 183;

    ASTC_4x4_sRGB         :: 186;
    ASTC_5x4_sRGB         :: 187;
    ASTC_5x5_sRGB         :: 188;
    ASTC_6x5_sRGB         :: 189;
    ASTC_6x6_sRGB         :: 190;
    ASTC_8x5_sRGB         :: 192;
    ASTC_8x6_sRGB         :: 193;
    ASTC_8x8_sRGB         :: 194;
    ASTC_10x5_sRGB        :: 195;
    ASTC_10x6_sRGB        :: 196;
    ASTC_10x8_sRGB        :: 197;
    ASTC_10x10_sRGB       :: 198;
    ASTC_12x10_sRGB       :: 199;
    ASTC_12x12_sRGB       :: 200;

    ASTC_4x4_LDR          :: 204;
    ASTC_5x4_LDR          :: 205;
    ASTC_5x5_LDR          :: 206;
    ASTC_6x5_LDR          :: 207;
    ASTC_6x6_LDR          :: 208;
    ASTC_8x5_LDR          :: 210;
    ASTC_8x6_LDR          :: 211;
    ASTC_8x8_LDR          :: 212;
    ASTC_10x5_LDR         :: 213;
    ASTC_10x6_LDR         :: 214;
    ASTC_10x8_LDR         :: 215;
    ASTC_10x10_LDR        :: 216;
    ASTC_12x10_LDR        :: 217;
    ASTC_12x12_LDR        :: 218;

    ASTC_4x4_HDR          :: 222;
    ASTC_5x4_HDR          :: 223;
    ASTC_5x5_HDR          :: 224;
    ASTC_6x5_HDR          :: 225;
    ASTC_6x6_HDR          :: 226;
    ASTC_8x5_HDR          :: 228;
    ASTC_8x6_HDR          :: 229;
    ASTC_8x8_HDR          :: 230;
    ASTC_10x5_HDR         :: 231;
    ASTC_10x6_HDR         :: 232;
    ASTC_10x8_HDR         :: 233;
    ASTC_10x10_HDR        :: 234;
    ASTC_12x10_HDR        :: 235;
    ASTC_12x12_HDR        :: 236;

    GBGR422               :: 240;

    BGRG422               :: 241;

    Depth16Unorm          :: 250;
    Depth32Float          :: 252;

    Stencil8              :: 253;

    Depth24Unorm_Stencil8 :: 255;
    Depth32Float_Stencil8 :: 260;

    X32_Stencil8          :: 261;
    X24_Stencil8          :: 262;

    Unspecialized         :: 263;
}

MTLDataType :: enum NSUInteger {
    None                           :: 0;

    Struct                         :: 1;

    Array                          :: 2;

    Float                          :: 3;

    Float2                         :: 4;

    Float3                         :: 5;

    Float4                         :: 6;

    Float2x2                       :: 7;

    Float2x3                       :: 8;

    Float2x4                       :: 9;

    Float3x2                       :: 10;

    Float3x3                       :: 11;

    Float3x4                       :: 12;

    Float4x2                       :: 13;

    Float4x3                       :: 14;

    Float4x4                       :: 15;

    Half                           :: 16;

    Half2                          :: 17;

    Half3                          :: 18;

    Half4                          :: 19;

    Half2x2                        :: 20;

    Half2x3                        :: 21;

    Half2x4                        :: 22;

    Half3x2                        :: 23;

    Half3x3                        :: 24;

    Half3x4                        :: 25;

    Half4x2                        :: 26;

    Half4x3                        :: 27;

    Half4x4                        :: 28;

    Int                            :: 29;

    Int2                           :: 30;

    Int3                           :: 31;

    Int4                           :: 32;

    UInt                           :: 33;

    UInt2                          :: 34;

    UInt3                          :: 35;

    UInt4                          :: 36;

    Short                          :: 37;

    Short2                         :: 38;

    Short3                         :: 39;

    Short4                         :: 40;

    UShort                         :: 41;

    UShort2                        :: 42;

    UShort3                        :: 43;

    UShort4                        :: 44;

    Char                           :: 45;

    Char2                          :: 46;

    Char3                          :: 47;

    Char4                          :: 48;

    UChar                          :: 49;

    UChar2                         :: 50;

    UChar3                         :: 51;

    UChar4                         :: 52;

    Bool                           :: 53;

    Bool2                          :: 54;

    Bool3                          :: 55;

    Bool4                          :: 56;

    Texture                        :: 58;

    Sampler                        :: 59;

    Pointer                        :: 60;

    R8Unorm                        :: 62;

    R8Snorm                        :: 63;

    R16Unorm                       :: 64;

    R16Snorm                       :: 65;

    RG8Unorm                       :: 66;

    RG8Snorm                       :: 67;

    RG16Unorm                      :: 68;

    RG16Snorm                      :: 69;

    RGBA8Unorm                     :: 70;

    RGBA8Unorm_sRGB                :: 71;

    RGBA8Snorm                     :: 72;

    RGBA16Unorm                    :: 73;

    RGBA16Snorm                    :: 74;

    RGB10A2Unorm                   :: 75;

    RG11B10Float                   :: 76;

    RGB9E5Float                    :: 77;

    RenderPipeline                 :: 78;

    ComputePipeline                :: 79;

    IndirectCommandBuffer          :: 80;

    Long                           :: 81;

    Long2                          :: 82;

    Long3                          :: 83;

    Long4                          :: 84;

    ULong                          :: 85;

    ULong2                         :: 86;

    ULong3                         :: 87;

    ULong4                         :: 88;

    VisibleFunctionTable           :: 115;

    IntersectionFunctionTable      :: 116;

    PrimitiveAccelerationStructure :: 117;

    InstanceAccelerationStructure  :: 118;

    BFloat                         :: 121;

    BFloat2                        :: 122;

    BFloat3                        :: 123;

    BFloat4                        :: 124;

    DepthStencilState              :: 139;

    Tensor                         :: 140;
}

MTLTensorDataType :: enum NSInteger {
    None     :: 0;
    Float32  :: 3;
    Float16  :: 16;
    BFloat16 :: 121;
    Int8     :: 45;
    UInt8    :: 49;
    Int16    :: 37;
    UInt16   :: 41;
    Int32    :: 29;
    UInt32   :: 33;
}

MTLTensorExtents :: struct #type_info_none {
    initWithRank :: inline (self: *$instancetype/MTLTensorExtents, rank: NSUInteger, values: *NSInteger) -> *instancetype {
        sel := sel_registerName2("initWithRank:values:");
        return xx (cast((*MTLTensorExtents, Selector, NSUInteger, *NSInteger) -> *instancetype #c_call)objc_msgSend)(self, sel, rank, values);
    }

    extentAtDimensionIndex :: inline (self: *MTLTensorExtents, dimensionIndex: NSUInteger) -> NSInteger {
        sel := sel_registerName2("extentAtDimensionIndex:");
        return xx (cast((*MTLTensorExtents, Selector, NSUInteger) -> NSInteger #c_call)objc_msgSend)(self, sel, dimensionIndex);
    }

    rank :: inline (self: *MTLTensorExtents) -> NSUInteger {
        sel := sel_registerName2("rank");
        return xx (cast((*MTLTensorExtents, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLTensorError :: enum NSInteger {
    None              :: 0;
    InternalError     :: 1;
    InvalidDescriptor :: 2;
}

MTLTensorUsage :: NSUInteger;
MTLTensorUsage_1 :: enum MTLTensorUsage {
    Compute         :: 1;

    Render          :: 2;

    MachineLearning :: 4;
}

MTLTensorDescriptor :: struct #type_info_none {
    dimensions :: inline (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        sel := sel_registerName2("dimensions");
        return xx (cast((*MTLTensorDescriptor, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }
    setDimensions :: inline (self: *MTLTensorDescriptor, dimensions: *MTLTensorExtents) -> void {
        sel := sel_registerName2("setDimensions:");
        return xx (cast((*MTLTensorDescriptor, Selector, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, dimensions);
    }

    strides :: inline (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        sel := sel_registerName2("strides");
        return xx (cast((*MTLTensorDescriptor, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }
    setStrides :: inline (self: *MTLTensorDescriptor, strides: *MTLTensorExtents) -> void {
        sel := sel_registerName2("setStrides:");
        return xx (cast((*MTLTensorDescriptor, Selector, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, strides);
    }

    dataType :: inline (self: *MTLTensorDescriptor) -> MTLTensorDataType {
        sel := sel_registerName2("dataType");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLTensorDataType #c_call)objc_msgSend)(self, sel);
    }
    setDataType :: inline (self: *MTLTensorDescriptor, dataType: MTLTensorDataType) -> void {
        sel := sel_registerName2("setDataType:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLTensorDataType) -> void #c_call)objc_msgSend)(self, sel, dataType);
    }

    usage :: inline (self: *MTLTensorDescriptor) -> MTLTensorUsage {
        sel := sel_registerName2("usage");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLTensorUsage #c_call)objc_msgSend)(self, sel);
    }
    setUsage :: inline (self: *MTLTensorDescriptor, usage: MTLTensorUsage) -> void {
        sel := sel_registerName2("setUsage:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLTensorUsage) -> void #c_call)objc_msgSend)(self, sel, usage);
    }

    resourceOptions :: inline (self: *MTLTensorDescriptor) -> MTLResourceOptions {
        sel := sel_registerName2("resourceOptions");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLResourceOptions #c_call)objc_msgSend)(self, sel);
    }
    setResourceOptions :: inline (self: *MTLTensorDescriptor, resourceOptions: MTLResourceOptions) -> void {
        sel := sel_registerName2("setResourceOptions:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLResourceOptions) -> void #c_call)objc_msgSend)(self, sel, resourceOptions);
    }

    cpuCacheMode :: inline (self: *MTLTensorDescriptor) -> MTLCPUCacheMode {
        sel := sel_registerName2("cpuCacheMode");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLCPUCacheMode #c_call)objc_msgSend)(self, sel);
    }
    setCpuCacheMode :: inline (self: *MTLTensorDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        sel := sel_registerName2("setCpuCacheMode:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLCPUCacheMode) -> void #c_call)objc_msgSend)(self, sel, cpuCacheMode);
    }

    storageMode :: inline (self: *MTLTensorDescriptor) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }
    setStorageMode :: inline (self: *MTLTensorDescriptor, storageMode: MTLStorageMode) -> void {
        sel := sel_registerName2("setStorageMode:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLStorageMode) -> void #c_call)objc_msgSend)(self, sel, storageMode);
    }

    hazardTrackingMode :: inline (self: *MTLTensorDescriptor) -> MTLHazardTrackingMode {
        sel := sel_registerName2("hazardTrackingMode");
        return xx (cast((*MTLTensorDescriptor, Selector) -> MTLHazardTrackingMode #c_call)objc_msgSend)(self, sel);
    }
    setHazardTrackingMode :: inline (self: *MTLTensorDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        sel := sel_registerName2("setHazardTrackingMode:");
        return xx (cast((*MTLTensorDescriptor, Selector, MTLHazardTrackingMode) -> void #c_call)objc_msgSend)(self, sel, hazardTrackingMode);
    }
}

MTLTensor :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    replaceSliceOrigin :: inline (self: *MTLTensor, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> void {
        sel := sel_registerName2("replaceSliceOrigin:sliceDimensions:withBytes:strides:");
        return xx (cast((*MTLTensor, Selector, *MTLTensorExtents, *MTLTensorExtents, *void, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, sliceOrigin, sliceDimensions, bytes, strides);
    }

    getBytes :: inline (self: *MTLTensor, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> void {
        sel := sel_registerName2("getBytes:strides:fromSliceOrigin:sliceDimensions:");
        return xx (cast((*MTLTensor, Selector, *void, *MTLTensorExtents, *MTLTensorExtents, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, bytes, strides, sliceOrigin, sliceDimensions);
    }

    gpuResourceID :: inline (self: *MTLTensor) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLTensor, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    buffer :: inline (self: *MTLTensor) -> *MTLBuffer {
        sel := sel_registerName2("buffer");
        return xx (cast((*MTLTensor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }

    bufferOffset :: inline (self: *MTLTensor) -> NSUInteger {
        sel := sel_registerName2("bufferOffset");
        return xx (cast((*MTLTensor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    strides :: inline (self: *MTLTensor) -> *MTLTensorExtents {
        sel := sel_registerName2("strides");
        return xx (cast((*MTLTensor, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }

    dimensions :: inline (self: *MTLTensor) -> *MTLTensorExtents {
        sel := sel_registerName2("dimensions");
        return xx (cast((*MTLTensor, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }

    dataType :: inline (self: *MTLTensor) -> MTLTensorDataType {
        sel := sel_registerName2("dataType");
        return xx (cast((*MTLTensor, Selector) -> MTLTensorDataType #c_call)objc_msgSend)(self, sel);
    }

    usage :: inline (self: *MTLTensor) -> MTLTensorUsage {
        sel := sel_registerName2("usage");
        return xx (cast((*MTLTensor, Selector) -> MTLTensorUsage #c_call)objc_msgSend)(self, sel);
    }
}

MTLGPUAddress :: u64;

MTLBuffer :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    contents :: inline (self: *MTLBuffer) -> *void {
        sel := sel_registerName2("contents");
        return xx (cast((*MTLBuffer, Selector) -> *void #c_call)objc_msgSend)(self, sel);
    }

    didModifyRange :: inline (self: *MTLBuffer, range: NSRange) -> void {
        sel := sel_registerName2("didModifyRange:");
        return xx (cast((*MTLBuffer, Selector, NSRange) -> void #c_call)objc_msgSend)(self, sel, range);
    }

    newTextureWithDescriptor :: inline (self: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture {
        sel := sel_registerName2("newTextureWithDescriptor:offset:bytesPerRow:");
        return xx (cast((*MTLBuffer, Selector, *MTLTextureDescriptor, NSUInteger, NSUInteger) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor, offset, bytesPerRow);
    }

    newTensorWithDescriptor :: inline (self: *MTLBuffer, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor {
        sel := sel_registerName2("newTensorWithDescriptor:offset:error:");
        return xx (cast((*MTLBuffer, Selector, *MTLTensorDescriptor, NSUInteger, **NSError) -> *MTLTensor #c_call)objc_msgSend)(self, sel, descriptor, offset, error);
    }

    addDebugMarker :: inline (self: *MTLBuffer, marker: *NSString, range: NSRange) -> void {
        sel := sel_registerName2("addDebugMarker:range:");
        return xx (cast((*MTLBuffer, Selector, *NSString, NSRange) -> void #c_call)objc_msgSend)(self, sel, marker, range);
    }

    removeAllDebugMarkers :: inline (self: *MTLBuffer) -> void {
        sel := sel_registerName2("removeAllDebugMarkers");
        return xx (cast((*MTLBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    newRemoteBufferViewForDevice :: inline (self: *MTLBuffer, device: *MTLDevice) -> *MTLBuffer {
        sel := sel_registerName2("newRemoteBufferViewForDevice:");
        return xx (cast((*MTLBuffer, Selector, *MTLDevice) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, device);
    }

    length :: inline (self: *MTLBuffer) -> NSUInteger {
        sel := sel_registerName2("length");
        return xx (cast((*MTLBuffer, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    remoteStorageBuffer :: inline (self: *MTLBuffer) -> *MTLBuffer {
        sel := sel_registerName2("remoteStorageBuffer");
        return xx (cast((*MTLBuffer, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }

    gpuAddress :: inline (self: *MTLBuffer) -> MTLGPUAddress {
        sel := sel_registerName2("gpuAddress");
        return xx (cast((*MTLBuffer, Selector) -> MTLGPUAddress #c_call)objc_msgSend)(self, sel);
    }

    sparseBufferTier :: inline (self: *MTLBuffer) -> MTLBufferSparseTier {
        sel := sel_registerName2("sparseBufferTier");
        return xx (cast((*MTLBuffer, Selector) -> MTLBufferSparseTier #c_call)objc_msgSend)(self, sel);
    }
}

MTLTextureType :: enum NSUInteger {
    _1D                 :: 0;
    _1DArray            :: 1;
    _2D                 :: 2;
    _2DArray            :: 3;
    _2DMultisample      :: 4;
    Cube                :: 5;
    CubeArray           :: 6;
    _3D                 :: 7;
    _2DMultisampleArray :: 8;
    TextureBuffer       :: 9;
}

MTLTextureSwizzle :: enum u8 {
    Zero  :: 0;
    One   :: 1;
    Red   :: 2;
    Green :: 3;
    Blue  :: 4;
    Alpha :: 5;
}

MTLTextureSwizzleChannels :: struct #type_info_none {
    red:   MTLTextureSwizzle;
    green: MTLTextureSwizzle;
    blue:  MTLTextureSwizzle;
    alpha: MTLTextureSwizzle;
}

MTLSharedTextureHandle :: struct #type_info_none {
    #as using nssecurecoding: NSSecureCoding;

    device :: inline (self: *MTLSharedTextureHandle) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLSharedTextureHandle, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLSharedTextureHandle) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLSharedTextureHandle, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLTextureUsage :: NSUInteger;
MTLTextureUsage_1 :: enum MTLTextureUsage {
    Unknown         :: 0;
    ShaderRead      :: 1;
    ShaderWrite     :: 2;
    RenderTarget    :: 4;
    PixelFormatView :: 16;
    ShaderAtomic    :: 32;
}

MTLTextureCompressionType :: enum NSInteger {
    Lossless :: 0;
    Lossy    :: 1;
}

MTLTextureDescriptor :: struct #type_info_none {
    texture2DDescriptorWithPixelFormat :: inline (pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        class := objc_getClass("MTLTextureDescriptor");
        sel := sel_registerName2("texture2DDescriptorWithPixelFormat:width:height:mipmapped:");
        return xx (cast((Class, Selector, MTLPixelFormat, NSUInteger, NSUInteger, BOOL) -> *MTLTextureDescriptor #c_call)objc_msgSend)(class, sel, pixelFormat, width, height, mipmapped);
    }

    textureCubeDescriptorWithPixelFormat :: inline (pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        class := objc_getClass("MTLTextureDescriptor");
        sel := sel_registerName2("textureCubeDescriptorWithPixelFormat:size:mipmapped:");
        return xx (cast((Class, Selector, MTLPixelFormat, NSUInteger, BOOL) -> *MTLTextureDescriptor #c_call)objc_msgSend)(class, sel, pixelFormat, size, mipmapped);
    }

    textureBufferDescriptorWithPixelFormat :: inline (pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor {
        class := objc_getClass("MTLTextureDescriptor");
        sel := sel_registerName2("textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:");
        return xx (cast((Class, Selector, MTLPixelFormat, NSUInteger, MTLResourceOptions, MTLTextureUsage) -> *MTLTextureDescriptor #c_call)objc_msgSend)(class, sel, pixelFormat, width, resourceOptions, usage);
    }

    textureType :: inline (self: *MTLTextureDescriptor) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    setTextureType :: inline (self: *MTLTextureDescriptor, textureType: MTLTextureType) -> void {
        sel := sel_registerName2("setTextureType:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLTextureType) -> void #c_call)objc_msgSend)(self, sel, textureType);
    }

    pixelFormat :: inline (self: *MTLTextureDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    width :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("width");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setWidth :: inline (self: *MTLTextureDescriptor, width: NSUInteger) -> void {
        sel := sel_registerName2("setWidth:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, width);
    }

    height :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("height");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setHeight :: inline (self: *MTLTextureDescriptor, height: NSUInteger) -> void {
        sel := sel_registerName2("setHeight:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, height);
    }

    depth :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("depth");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setDepth :: inline (self: *MTLTextureDescriptor, depth: NSUInteger) -> void {
        sel := sel_registerName2("setDepth:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, depth);
    }

    mipmapLevelCount :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("mipmapLevelCount");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMipmapLevelCount :: inline (self: *MTLTextureDescriptor, mipmapLevelCount: NSUInteger) -> void {
        sel := sel_registerName2("setMipmapLevelCount:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, mipmapLevelCount);
    }

    sampleCount :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSampleCount :: inline (self: *MTLTextureDescriptor, sampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setSampleCount:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampleCount);
    }

    arrayLength :: inline (self: *MTLTextureDescriptor) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLTextureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setArrayLength :: inline (self: *MTLTextureDescriptor, arrayLength: NSUInteger) -> void {
        sel := sel_registerName2("setArrayLength:");
        return xx (cast((*MTLTextureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, arrayLength);
    }

    resourceOptions :: inline (self: *MTLTextureDescriptor) -> MTLResourceOptions {
        sel := sel_registerName2("resourceOptions");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLResourceOptions #c_call)objc_msgSend)(self, sel);
    }
    setResourceOptions :: inline (self: *MTLTextureDescriptor, resourceOptions: MTLResourceOptions) -> void {
        sel := sel_registerName2("setResourceOptions:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLResourceOptions) -> void #c_call)objc_msgSend)(self, sel, resourceOptions);
    }

    cpuCacheMode :: inline (self: *MTLTextureDescriptor) -> MTLCPUCacheMode {
        sel := sel_registerName2("cpuCacheMode");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLCPUCacheMode #c_call)objc_msgSend)(self, sel);
    }
    setCpuCacheMode :: inline (self: *MTLTextureDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        sel := sel_registerName2("setCpuCacheMode:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLCPUCacheMode) -> void #c_call)objc_msgSend)(self, sel, cpuCacheMode);
    }

    storageMode :: inline (self: *MTLTextureDescriptor) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }
    setStorageMode :: inline (self: *MTLTextureDescriptor, storageMode: MTLStorageMode) -> void {
        sel := sel_registerName2("setStorageMode:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLStorageMode) -> void #c_call)objc_msgSend)(self, sel, storageMode);
    }

    hazardTrackingMode :: inline (self: *MTLTextureDescriptor) -> MTLHazardTrackingMode {
        sel := sel_registerName2("hazardTrackingMode");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLHazardTrackingMode #c_call)objc_msgSend)(self, sel);
    }
    setHazardTrackingMode :: inline (self: *MTLTextureDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        sel := sel_registerName2("setHazardTrackingMode:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLHazardTrackingMode) -> void #c_call)objc_msgSend)(self, sel, hazardTrackingMode);
    }

    usage :: inline (self: *MTLTextureDescriptor) -> MTLTextureUsage {
        sel := sel_registerName2("usage");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLTextureUsage #c_call)objc_msgSend)(self, sel);
    }
    setUsage :: inline (self: *MTLTextureDescriptor, usage: MTLTextureUsage) -> void {
        sel := sel_registerName2("setUsage:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLTextureUsage) -> void #c_call)objc_msgSend)(self, sel, usage);
    }

    allowGPUOptimizedContents :: inline (self: *MTLTextureDescriptor) -> BOOL {
        sel := sel_registerName2("allowGPUOptimizedContents");
        return xx (cast((*MTLTextureDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAllowGPUOptimizedContents :: inline (self: *MTLTextureDescriptor, allowGPUOptimizedContents: BOOL) -> void {
        sel := sel_registerName2("setAllowGPUOptimizedContents:");
        return xx (cast((*MTLTextureDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, allowGPUOptimizedContents);
    }

    compressionType :: inline (self: *MTLTextureDescriptor) -> MTLTextureCompressionType {
        sel := sel_registerName2("compressionType");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLTextureCompressionType #c_call)objc_msgSend)(self, sel);
    }
    setCompressionType :: inline (self: *MTLTextureDescriptor, compressionType: MTLTextureCompressionType) -> void {
        sel := sel_registerName2("setCompressionType:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLTextureCompressionType) -> void #c_call)objc_msgSend)(self, sel, compressionType);
    }

    swizzle :: inline (self: *MTLTextureDescriptor) -> MTLTextureSwizzleChannels {
        sel := sel_registerName2("swizzle");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLTextureSwizzleChannels #c_call)objc_msgSend)(self, sel);
    }
    setSwizzle :: inline (self: *MTLTextureDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        sel := sel_registerName2("setSwizzle:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLTextureSwizzleChannels) -> void #c_call)objc_msgSend)(self, sel, swizzle);
    }

    placementSparsePageSize :: inline (self: *MTLTextureDescriptor) -> MTLSparsePageSize {
        sel := sel_registerName2("placementSparsePageSize");
        return xx (cast((*MTLTextureDescriptor, Selector) -> MTLSparsePageSize #c_call)objc_msgSend)(self, sel);
    }
    setPlacementSparsePageSize :: inline (self: *MTLTextureDescriptor, placementSparsePageSize: MTLSparsePageSize) -> void {
        sel := sel_registerName2("setPlacementSparsePageSize:");
        return xx (cast((*MTLTextureDescriptor, Selector, MTLSparsePageSize) -> void #c_call)objc_msgSend)(self, sel, placementSparsePageSize);
    }
}

MTLTextureViewDescriptor :: struct #type_info_none {
    pixelFormat :: inline (self: *MTLTextureViewDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTLTextureViewDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *MTLTextureViewDescriptor, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*MTLTextureViewDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    textureType :: inline (self: *MTLTextureViewDescriptor) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLTextureViewDescriptor, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    setTextureType :: inline (self: *MTLTextureViewDescriptor, textureType: MTLTextureType) -> void {
        sel := sel_registerName2("setTextureType:");
        return xx (cast((*MTLTextureViewDescriptor, Selector, MTLTextureType) -> void #c_call)objc_msgSend)(self, sel, textureType);
    }

    levelRange :: inline (self: *MTLTextureViewDescriptor) -> NSRange {
        sel := sel_registerName2("levelRange");
        return xx (cast((*MTLTextureViewDescriptor, Selector) -> NSRange #c_call)objc_msgSend)(self, sel);
    }
    setLevelRange :: inline (self: *MTLTextureViewDescriptor, levelRange: NSRange) -> void {
        sel := sel_registerName2("setLevelRange:");
        return xx (cast((*MTLTextureViewDescriptor, Selector, NSRange) -> void #c_call)objc_msgSend)(self, sel, levelRange);
    }

    sliceRange :: inline (self: *MTLTextureViewDescriptor) -> NSRange {
        sel := sel_registerName2("sliceRange");
        return xx (cast((*MTLTextureViewDescriptor, Selector) -> NSRange #c_call)objc_msgSend)(self, sel);
    }
    setSliceRange :: inline (self: *MTLTextureViewDescriptor, sliceRange: NSRange) -> void {
        sel := sel_registerName2("setSliceRange:");
        return xx (cast((*MTLTextureViewDescriptor, Selector, NSRange) -> void #c_call)objc_msgSend)(self, sel, sliceRange);
    }

    swizzle :: inline (self: *MTLTextureViewDescriptor) -> MTLTextureSwizzleChannels {
        sel := sel_registerName2("swizzle");
        return xx (cast((*MTLTextureViewDescriptor, Selector) -> MTLTextureSwizzleChannels #c_call)objc_msgSend)(self, sel);
    }
    setSwizzle :: inline (self: *MTLTextureViewDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        sel := sel_registerName2("setSwizzle:");
        return xx (cast((*MTLTextureViewDescriptor, Selector, MTLTextureSwizzleChannels) -> void #c_call)objc_msgSend)(self, sel, swizzle);
    }
}

MTLTexture :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    getBytes :: inline (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> void {
        sel := sel_registerName2("getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:");
        return xx (cast((*MTLTexture, Selector, *void, NSUInteger, NSUInteger, MTLRegion, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pixelBytes, bytesPerRow, bytesPerImage, region, level, slice);
    }

    replaceRegion :: inline (self: *MTLTexture, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> void {
        sel := sel_registerName2("replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:");
        return xx (cast((*MTLTexture, Selector, MTLRegion, NSUInteger, NSUInteger, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, region, level, slice, pixelBytes, bytesPerRow, bytesPerImage);
    }

    getBytes :: inline (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> void {
        sel := sel_registerName2("getBytes:bytesPerRow:fromRegion:mipmapLevel:");
        return xx (cast((*MTLTexture, Selector, *void, NSUInteger, MTLRegion, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pixelBytes, bytesPerRow, region, level);
    }

    replaceRegion :: inline (self: *MTLTexture, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> void {
        sel := sel_registerName2("replaceRegion:mipmapLevel:withBytes:bytesPerRow:");
        return xx (cast((*MTLTexture, Selector, MTLRegion, NSUInteger, *void, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, region, level, pixelBytes, bytesPerRow);
    }

    newTextureViewWithPixelFormat :: inline (self: *MTLTexture, pixelFormat: MTLPixelFormat) -> *MTLTexture {
        sel := sel_registerName2("newTextureViewWithPixelFormat:");
        return xx (cast((*MTLTexture, Selector, MTLPixelFormat) -> *MTLTexture #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    newTextureViewWithPixelFormat :: inline (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture {
        sel := sel_registerName2("newTextureViewWithPixelFormat:textureType:levels:slices:");
        return xx (cast((*MTLTexture, Selector, MTLPixelFormat, MTLTextureType, NSRange, NSRange) -> *MTLTexture #c_call)objc_msgSend)(self, sel, pixelFormat, textureType, levelRange, sliceRange);
    }

    newSharedTextureHandle :: inline (self: *MTLTexture) -> *MTLSharedTextureHandle {
        sel := sel_registerName2("newSharedTextureHandle");
        return xx (cast((*MTLTexture, Selector) -> *MTLSharedTextureHandle #c_call)objc_msgSend)(self, sel);
    }

    newTextureViewWithDescriptor :: inline (self: *MTLTexture, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture {
        sel := sel_registerName2("newTextureViewWithDescriptor:");
        return xx (cast((*MTLTexture, Selector, *MTLTextureViewDescriptor) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newRemoteTextureViewForDevice :: inline (self: *MTLTexture, device: *MTLDevice) -> *MTLTexture {
        sel := sel_registerName2("newRemoteTextureViewForDevice:");
        return xx (cast((*MTLTexture, Selector, *MTLDevice) -> *MTLTexture #c_call)objc_msgSend)(self, sel, device);
    }

    newTextureViewWithPixelFormat :: inline (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture {
        sel := sel_registerName2("newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:");
        return xx (cast((*MTLTexture, Selector, MTLPixelFormat, MTLTextureType, NSRange, NSRange, MTLTextureSwizzleChannels) -> *MTLTexture #c_call)objc_msgSend)(self, sel, pixelFormat, textureType, levelRange, sliceRange, swizzle);
    }

    rootResource :: inline (self: *MTLTexture) -> *MTLResource_1 {
        sel := sel_registerName2("rootResource");
        return xx (cast((*MTLTexture, Selector) -> *MTLResource_1 #c_call)objc_msgSend)(self, sel);
    }

    parentTexture :: inline (self: *MTLTexture) -> *MTLTexture {
        sel := sel_registerName2("parentTexture");
        return xx (cast((*MTLTexture, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }

    parentRelativeLevel :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("parentRelativeLevel");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    parentRelativeSlice :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("parentRelativeSlice");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    buffer :: inline (self: *MTLTexture) -> *MTLBuffer {
        sel := sel_registerName2("buffer");
        return xx (cast((*MTLTexture, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }

    bufferOffset :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("bufferOffset");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    bufferBytesPerRow :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("bufferBytesPerRow");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    iosurface :: inline (self: *MTLTexture) -> IOSurfaceRef {
        sel := sel_registerName2("iosurface");
        return xx (cast((*MTLTexture, Selector) -> IOSurfaceRef #c_call)objc_msgSend)(self, sel);
    }

    iosurfacePlane :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("iosurfacePlane");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    textureType :: inline (self: *MTLTexture) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLTexture, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }

    pixelFormat :: inline (self: *MTLTexture) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTLTexture, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }

    width :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("width");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    height :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("height");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    depth :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("depth");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    mipmapLevelCount :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("mipmapLevelCount");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    sampleCount :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    arrayLength :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    usage :: inline (self: *MTLTexture) -> MTLTextureUsage {
        sel := sel_registerName2("usage");
        return xx (cast((*MTLTexture, Selector) -> MTLTextureUsage #c_call)objc_msgSend)(self, sel);
    }

    isShareable :: inline (self: *MTLTexture) -> BOOL {
        sel := sel_registerName2("isShareable");
        return xx (cast((*MTLTexture, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    isFramebufferOnly :: inline (self: *MTLTexture) -> BOOL {
        sel := sel_registerName2("isFramebufferOnly");
        return xx (cast((*MTLTexture, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    firstMipmapInTail :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("firstMipmapInTail");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    tailSizeInBytes :: inline (self: *MTLTexture) -> NSUInteger {
        sel := sel_registerName2("tailSizeInBytes");
        return xx (cast((*MTLTexture, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    isSparse :: inline (self: *MTLTexture) -> BOOL {
        sel := sel_registerName2("isSparse");
        return xx (cast((*MTLTexture, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    allowGPUOptimizedContents :: inline (self: *MTLTexture) -> BOOL {
        sel := sel_registerName2("allowGPUOptimizedContents");
        return xx (cast((*MTLTexture, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    compressionType :: inline (self: *MTLTexture) -> MTLTextureCompressionType {
        sel := sel_registerName2("compressionType");
        return xx (cast((*MTLTexture, Selector) -> MTLTextureCompressionType #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLTexture) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLTexture, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    remoteStorageTexture :: inline (self: *MTLTexture) -> *MTLTexture {
        sel := sel_registerName2("remoteStorageTexture");
        return xx (cast((*MTLTexture, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }

    swizzle :: inline (self: *MTLTexture) -> MTLTextureSwizzleChannels {
        sel := sel_registerName2("swizzle");
        return xx (cast((*MTLTexture, Selector) -> MTLTextureSwizzleChannels #c_call)objc_msgSend)(self, sel);
    }

    sparseTextureTier :: inline (self: *MTLTexture) -> MTLTextureSparseTier {
        sel := sel_registerName2("sparseTextureTier");
        return xx (cast((*MTLTexture, Selector) -> MTLTextureSparseTier #c_call)objc_msgSend)(self, sel);
    }
}

MTLIndexType :: enum NSUInteger {
    UInt16 :: 0;
    UInt32 :: 1;
}

MTLBindingType :: enum NSInteger {
    Buffer                         :: 0;
    ThreadgroupMemory              :: 1;
    Texture                        :: 2;
    Sampler                        :: 3;
    ImageblockData                 :: 16;
    Imageblock                     :: 17;
    VisibleFunctionTable           :: 24;
    PrimitiveAccelerationStructure :: 25;
    InstanceAccelerationStructure  :: 26;
    IntersectionFunctionTable      :: 27;
    ObjectPayload                  :: 34;
    Tensor                         :: 37;
}

MTLArgumentType :: enum NSUInteger {
    Buffer                         :: 0;
    ThreadgroupMemory              :: 1;
    Texture                        :: 2;
    Sampler                        :: 3;

    ImageblockData                 :: 16;
    Imageblock                     :: 17;
    VisibleFunctionTable           :: 24;
    PrimitiveAccelerationStructure :: 25;
    InstanceAccelerationStructure  :: 26;
    IntersectionFunctionTable      :: 27;
}

MTLBindingAccess :: enum NSUInteger {
    ReadOnly                   :: 0;
    ReadWrite                  :: 1;
    WriteOnly                  :: 2;
    MTLArgumentAccessReadOnly  :: 0;
    MTLArgumentAccessReadWrite :: 1;
    MTLArgumentAccessWriteOnly :: 2;
}

MTLArgumentAccess :: MTLBindingAccess;

MTLType :: struct #type_info_none {
    dataType :: inline (self: *MTLType) -> MTLDataType {
        sel := sel_registerName2("dataType");
        return xx (cast((*MTLType, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
}

MTLStructMember :: struct #type_info_none {
    structType :: inline (self: *MTLStructMember) -> *MTLStructType {
        sel := sel_registerName2("structType");
        return xx (cast((*MTLStructMember, Selector) -> *MTLStructType #c_call)objc_msgSend)(self, sel);
    }
    arrayType :: inline (self: *MTLStructMember) -> *MTLArrayType {
        sel := sel_registerName2("arrayType");
        return xx (cast((*MTLStructMember, Selector) -> *MTLArrayType #c_call)objc_msgSend)(self, sel);
    }

    textureReferenceType :: inline (self: *MTLStructMember) -> *MTLTextureReferenceType {
        sel := sel_registerName2("textureReferenceType");
        return xx (cast((*MTLStructMember, Selector) -> *MTLTextureReferenceType #c_call)objc_msgSend)(self, sel);
    }
    pointerType :: inline (self: *MTLStructMember) -> *MTLPointerType {
        sel := sel_registerName2("pointerType");
        return xx (cast((*MTLStructMember, Selector) -> *MTLPointerType #c_call)objc_msgSend)(self, sel);
    }

    tensorReferenceType :: inline (self: *MTLStructMember) -> *MTLTensorReferenceType {
        sel := sel_registerName2("tensorReferenceType");
        return xx (cast((*MTLStructMember, Selector) -> *MTLTensorReferenceType #c_call)objc_msgSend)(self, sel);
    }

    name :: inline (self: *MTLStructMember) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLStructMember, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    offset :: inline (self: *MTLStructMember) -> NSUInteger {
        sel := sel_registerName2("offset");
        return xx (cast((*MTLStructMember, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    dataType :: inline (self: *MTLStructMember) -> MTLDataType {
        sel := sel_registerName2("dataType");
        return xx (cast((*MTLStructMember, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }

    argumentIndex :: inline (self: *MTLStructMember) -> NSUInteger {
        sel := sel_registerName2("argumentIndex");
        return xx (cast((*MTLStructMember, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLStructType :: struct #type_info_none {
    #as using mtltype: MTLType;

    memberByName :: inline (self: *MTLStructType, name: *NSString) -> *MTLStructMember {
        sel := sel_registerName2("memberByName:");
        return xx (cast((*MTLStructType, Selector, *NSString) -> *MTLStructMember #c_call)objc_msgSend)(self, sel, name);
    }

    members :: inline (self: *MTLStructType) -> *NSArray(*MTLStructMember) {
        sel := sel_registerName2("members");
        return xx (cast((*MTLStructType, Selector) -> *NSArray(*MTLStructMember) #c_call)objc_msgSend)(self, sel);
    }
}

MTLArrayType :: struct #type_info_none {
    #as using mtltype: MTLType;

    elementStructType :: inline (self: *MTLArrayType) -> *MTLStructType {
        sel := sel_registerName2("elementStructType");
        return xx (cast((*MTLArrayType, Selector) -> *MTLStructType #c_call)objc_msgSend)(self, sel);
    }
    elementArrayType :: inline (self: *MTLArrayType) -> *MTLArrayType {
        sel := sel_registerName2("elementArrayType");
        return xx (cast((*MTLArrayType, Selector) -> *MTLArrayType #c_call)objc_msgSend)(self, sel);
    }
    elementTextureReferenceType :: inline (self: *MTLArrayType) -> *MTLTextureReferenceType {
        sel := sel_registerName2("elementTextureReferenceType");
        return xx (cast((*MTLArrayType, Selector) -> *MTLTextureReferenceType #c_call)objc_msgSend)(self, sel);
    }
    elementPointerType :: inline (self: *MTLArrayType) -> *MTLPointerType {
        sel := sel_registerName2("elementPointerType");
        return xx (cast((*MTLArrayType, Selector) -> *MTLPointerType #c_call)objc_msgSend)(self, sel);
    }

    elementTensorReferenceType :: inline (self: *MTLArrayType) -> *MTLTensorReferenceType {
        sel := sel_registerName2("elementTensorReferenceType");
        return xx (cast((*MTLArrayType, Selector) -> *MTLTensorReferenceType #c_call)objc_msgSend)(self, sel);
    }

    elementType :: inline (self: *MTLArrayType) -> MTLDataType {
        sel := sel_registerName2("elementType");
        return xx (cast((*MTLArrayType, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }

    arrayLength :: inline (self: *MTLArrayType) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLArrayType, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    stride :: inline (self: *MTLArrayType) -> NSUInteger {
        sel := sel_registerName2("stride");
        return xx (cast((*MTLArrayType, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    argumentIndexStride :: inline (self: *MTLArrayType) -> NSUInteger {
        sel := sel_registerName2("argumentIndexStride");
        return xx (cast((*MTLArrayType, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLPointerType :: struct #type_info_none {
    #as using mtltype: MTLType;

    elementStructType :: inline (self: *MTLPointerType) -> *MTLStructType {
        sel := sel_registerName2("elementStructType");
        return xx (cast((*MTLPointerType, Selector) -> *MTLStructType #c_call)objc_msgSend)(self, sel);
    }
    elementArrayType :: inline (self: *MTLPointerType) -> *MTLArrayType {
        sel := sel_registerName2("elementArrayType");
        return xx (cast((*MTLPointerType, Selector) -> *MTLArrayType #c_call)objc_msgSend)(self, sel);
    }

    elementType :: inline (self: *MTLPointerType) -> MTLDataType {
        sel := sel_registerName2("elementType");
        return xx (cast((*MTLPointerType, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    access :: inline (self: *MTLPointerType) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLPointerType, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
    alignment :: inline (self: *MTLPointerType) -> NSUInteger {
        sel := sel_registerName2("alignment");
        return xx (cast((*MTLPointerType, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    dataSize :: inline (self: *MTLPointerType) -> NSUInteger {
        sel := sel_registerName2("dataSize");
        return xx (cast((*MTLPointerType, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    elementIsArgumentBuffer :: inline (self: *MTLPointerType) -> BOOL {
        sel := sel_registerName2("elementIsArgumentBuffer");
        return xx (cast((*MTLPointerType, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLTextureReferenceType :: struct #type_info_none {
    #as using mtltype: MTLType;

    textureDataType :: inline (self: *MTLTextureReferenceType) -> MTLDataType {
        sel := sel_registerName2("textureDataType");
        return xx (cast((*MTLTextureReferenceType, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    textureType :: inline (self: *MTLTextureReferenceType) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLTextureReferenceType, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    access :: inline (self: *MTLTextureReferenceType) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLTextureReferenceType, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
    isDepthTexture :: inline (self: *MTLTextureReferenceType) -> BOOL {
        sel := sel_registerName2("isDepthTexture");
        return xx (cast((*MTLTextureReferenceType, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLTensorReferenceType :: struct #type_info_none {
    #as using mtltype: MTLType;

    tensorDataType :: inline (self: *MTLTensorReferenceType) -> MTLTensorDataType {
        sel := sel_registerName2("tensorDataType");
        return xx (cast((*MTLTensorReferenceType, Selector) -> MTLTensorDataType #c_call)objc_msgSend)(self, sel);
    }

    indexType :: inline (self: *MTLTensorReferenceType) -> MTLDataType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLTensorReferenceType, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }

    dimensions :: inline (self: *MTLTensorReferenceType) -> *MTLTensorExtents {
        sel := sel_registerName2("dimensions");
        return xx (cast((*MTLTensorReferenceType, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }

    access :: inline (self: *MTLTensorReferenceType) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLTensorReferenceType, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
}

MTLArgument :: struct #type_info_none {
    name :: inline (self: *MTLArgument) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLArgument, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    type :: inline (self: *MTLArgument) -> MTLArgumentType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLArgument, Selector) -> MTLArgumentType #c_call)objc_msgSend)(self, sel);
    }
    access :: inline (self: *MTLArgument) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLArgument, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
    index :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("index");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    isActive :: inline (self: *MTLArgument) -> BOOL {
        sel := sel_registerName2("isActive");
        return xx (cast((*MTLArgument, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    bufferAlignment :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("bufferAlignment");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    bufferDataSize :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("bufferDataSize");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    bufferDataType :: inline (self: *MTLArgument) -> MTLDataType {
        sel := sel_registerName2("bufferDataType");
        return xx (cast((*MTLArgument, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    bufferStructType :: inline (self: *MTLArgument) -> *MTLStructType {
        sel := sel_registerName2("bufferStructType");
        return xx (cast((*MTLArgument, Selector) -> *MTLStructType #c_call)objc_msgSend)(self, sel);
    }
    bufferPointerType :: inline (self: *MTLArgument) -> *MTLPointerType {
        sel := sel_registerName2("bufferPointerType");
        return xx (cast((*MTLArgument, Selector) -> *MTLPointerType #c_call)objc_msgSend)(self, sel);
    }

    threadgroupMemoryAlignment :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryAlignment");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    threadgroupMemoryDataSize :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryDataSize");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    textureType :: inline (self: *MTLArgument) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLArgument, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    textureDataType :: inline (self: *MTLArgument) -> MTLDataType {
        sel := sel_registerName2("textureDataType");
        return xx (cast((*MTLArgument, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    isDepthTexture :: inline (self: *MTLArgument) -> BOOL {
        sel := sel_registerName2("isDepthTexture");
        return xx (cast((*MTLArgument, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    arrayLength :: inline (self: *MTLArgument) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLArgument, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLBinding :: struct #type_info_none {
    name :: inline (self: *MTLBinding) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLBinding, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    type :: inline (self: *MTLBinding) -> MTLBindingType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLBinding, Selector) -> MTLBindingType #c_call)objc_msgSend)(self, sel);
    }
    access :: inline (self: *MTLBinding) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLBinding, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
    index :: inline (self: *MTLBinding) -> NSUInteger {
        sel := sel_registerName2("index");
        return xx (cast((*MTLBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    isUsed :: inline (self: *MTLBinding) -> BOOL {
        sel := sel_registerName2("isUsed");
        return xx (cast((*MTLBinding, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    isArgument :: inline (self: *MTLBinding) -> BOOL {
        sel := sel_registerName2("isArgument");
        return xx (cast((*MTLBinding, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLBufferBinding :: struct #type_info_none {
    #as using mtlbinding: MTLBinding;
    bufferAlignment :: inline (self: *MTLBufferBinding) -> NSUInteger {
        sel := sel_registerName2("bufferAlignment");
        return xx (cast((*MTLBufferBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    bufferDataSize :: inline (self: *MTLBufferBinding) -> NSUInteger {
        sel := sel_registerName2("bufferDataSize");
        return xx (cast((*MTLBufferBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    bufferDataType :: inline (self: *MTLBufferBinding) -> MTLDataType {
        sel := sel_registerName2("bufferDataType");
        return xx (cast((*MTLBufferBinding, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    bufferStructType :: inline (self: *MTLBufferBinding) -> *MTLStructType {
        sel := sel_registerName2("bufferStructType");
        return xx (cast((*MTLBufferBinding, Selector) -> *MTLStructType #c_call)objc_msgSend)(self, sel);
    }
    bufferPointerType :: inline (self: *MTLBufferBinding) -> *MTLPointerType {
        sel := sel_registerName2("bufferPointerType");
        return xx (cast((*MTLBufferBinding, Selector) -> *MTLPointerType #c_call)objc_msgSend)(self, sel);
    }
}

MTLThreadgroupBinding :: struct #type_info_none {
    #as using mtlbinding: MTLBinding;
    threadgroupMemoryAlignment :: inline (self: *MTLThreadgroupBinding) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryAlignment");
        return xx (cast((*MTLThreadgroupBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    threadgroupMemoryDataSize :: inline (self: *MTLThreadgroupBinding) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryDataSize");
        return xx (cast((*MTLThreadgroupBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLTextureBinding :: struct #type_info_none {
    #as using mtlbinding: MTLBinding;
    textureType :: inline (self: *MTLTextureBinding) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLTextureBinding, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    textureDataType :: inline (self: *MTLTextureBinding) -> MTLDataType {
        sel := sel_registerName2("textureDataType");
        return xx (cast((*MTLTextureBinding, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    isDepthTexture :: inline (self: *MTLTextureBinding) -> BOOL {
        sel := sel_registerName2("isDepthTexture");
        return xx (cast((*MTLTextureBinding, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    arrayLength :: inline (self: *MTLTextureBinding) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLTextureBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLObjectPayloadBinding :: struct #type_info_none {
    #as using mtlbinding: MTLBinding;
    objectPayloadAlignment :: inline (self: *MTLObjectPayloadBinding) -> NSUInteger {
        sel := sel_registerName2("objectPayloadAlignment");
        return xx (cast((*MTLObjectPayloadBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    objectPayloadDataSize :: inline (self: *MTLObjectPayloadBinding) -> NSUInteger {
        sel := sel_registerName2("objectPayloadDataSize");
        return xx (cast((*MTLObjectPayloadBinding, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLTensorBinding :: struct #type_info_none {
    #as using mtlbinding: MTLBinding;

    tensorDataType :: inline (self: *MTLTensorBinding) -> MTLTensorDataType {
        sel := sel_registerName2("tensorDataType");
        return xx (cast((*MTLTensorBinding, Selector) -> MTLTensorDataType #c_call)objc_msgSend)(self, sel);
    }

    indexType :: inline (self: *MTLTensorBinding) -> MTLDataType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLTensorBinding, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }

    dimensions :: inline (self: *MTLTensorBinding) -> *MTLTensorExtents {
        sel := sel_registerName2("dimensions");
        return xx (cast((*MTLTensorBinding, Selector) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionConstantValues :: struct #type_info_none {
    setConstantValue :: inline (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, index: NSUInteger) -> void {
        sel := sel_registerName2("setConstantValue:type:atIndex:");
        return xx (cast((*MTLFunctionConstantValues, Selector, *void, MTLDataType, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, value, type, index);
    }
    setConstantValues :: inline (self: *MTLFunctionConstantValues, values: *void, type: MTLDataType, range: NSRange) -> void {
        sel := sel_registerName2("setConstantValues:type:withRange:");
        return xx (cast((*MTLFunctionConstantValues, Selector, *void, MTLDataType, NSRange) -> void #c_call)objc_msgSend)(self, sel, values, type, range);
    }

    setConstantValue :: inline (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, name: *NSString) -> void {
        sel := sel_registerName2("setConstantValue:type:withName:");
        return xx (cast((*MTLFunctionConstantValues, Selector, *void, MTLDataType, *NSString) -> void #c_call)objc_msgSend)(self, sel, value, type, name);
    }

    reset :: inline (self: *MTLFunctionConstantValues) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLFunctionConstantValues, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionOptions :: NSUInteger;
MTLFunctionOption :: enum MTLFunctionOptions {
    None                                :: 0;

    CompileToBinary                     :: 1;

    StoreFunctionInMetalPipelinesScript :: 2;
    StoreFunctionInMetalScript          :: 2;

    FailOnBinaryArchiveMiss             :: 4;

    PipelineIndependent                 :: 8;
}

MTLFunctionDescriptor :: struct #type_info_none {
    functionDescriptor :: inline () -> *MTLFunctionDescriptor {
        class := objc_getClass("MTLFunctionDescriptor");
        sel := sel_registerName2("functionDescriptor");
        return xx (cast((Class, Selector) -> *MTLFunctionDescriptor #c_call)objc_msgSend)(class, sel);
    }

    name :: inline (self: *MTLFunctionDescriptor) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLFunctionDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setName :: inline (self: *MTLFunctionDescriptor, name: *NSString) -> void {
        sel := sel_registerName2("setName:");
        return xx (cast((*MTLFunctionDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, name);
    }

    specializedName :: inline (self: *MTLFunctionDescriptor) -> *NSString {
        sel := sel_registerName2("specializedName");
        return xx (cast((*MTLFunctionDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setSpecializedName :: inline (self: *MTLFunctionDescriptor, specializedName: *NSString) -> void {
        sel := sel_registerName2("setSpecializedName:");
        return xx (cast((*MTLFunctionDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, specializedName);
    }

    constantValues :: inline (self: *MTLFunctionDescriptor) -> *MTLFunctionConstantValues {
        sel := sel_registerName2("constantValues");
        return xx (cast((*MTLFunctionDescriptor, Selector) -> *MTLFunctionConstantValues #c_call)objc_msgSend)(self, sel);
    }
    setConstantValues :: inline (self: *MTLFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        sel := sel_registerName2("setConstantValues:");
        return xx (cast((*MTLFunctionDescriptor, Selector, *MTLFunctionConstantValues) -> void #c_call)objc_msgSend)(self, sel, constantValues);
    }

    options :: inline (self: *MTLFunctionDescriptor) -> MTLFunctionOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTLFunctionDescriptor, Selector) -> MTLFunctionOptions #c_call)objc_msgSend)(self, sel);
    }
    setOptions :: inline (self: *MTLFunctionDescriptor, options: MTLFunctionOptions) -> void {
        sel := sel_registerName2("setOptions:");
        return xx (cast((*MTLFunctionDescriptor, Selector, MTLFunctionOptions) -> void #c_call)objc_msgSend)(self, sel, options);
    }

    binaryArchives :: inline (self: *MTLFunctionDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLFunctionDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLFunctionDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLFunctionDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }
}

MTLIntersectionFunctionDescriptor :: struct #type_info_none {
    #as using mtlfunctiondescriptor: MTLFunctionDescriptor;
}

MTLAutoreleasedRenderPipelineReflection :: *MTLRenderPipelineReflection;
MTLAutoreleasedComputePipelineReflection :: *MTLComputePipelineReflection;

MTLNewLibraryCompletionHandler :: Block;

MTLNewRenderPipelineStateCompletionHandler :: Block;

MTLNewRenderPipelineStateWithReflectionCompletionHandler :: Block;

MTLNewComputePipelineStateCompletionHandler :: Block;

MTLNewComputePipelineStateWithReflectionCompletionHandler :: Block;

MTLNewDynamicLibraryCompletionHandler :: Block;

MTLAutoreleasedArgument :: *MTLArgument;

MTLPatchType :: enum NSUInteger {
    None     :: 0;
    Triangle :: 1;
    Quad     :: 2;
}

MTLVertexAttribute :: struct #type_info_none {
    name :: inline (self: *MTLVertexAttribute) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLVertexAttribute, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    attributeIndex :: inline (self: *MTLVertexAttribute) -> NSUInteger {
        sel := sel_registerName2("attributeIndex");
        return xx (cast((*MTLVertexAttribute, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    attributeType :: inline (self: *MTLVertexAttribute) -> MTLDataType {
        sel := sel_registerName2("attributeType");
        return xx (cast((*MTLVertexAttribute, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    isActive :: inline (self: *MTLVertexAttribute) -> BOOL {
        sel := sel_registerName2("isActive");
        return xx (cast((*MTLVertexAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    isPatchData :: inline (self: *MTLVertexAttribute) -> BOOL {
        sel := sel_registerName2("isPatchData");
        return xx (cast((*MTLVertexAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    isPatchControlPointData :: inline (self: *MTLVertexAttribute) -> BOOL {
        sel := sel_registerName2("isPatchControlPointData");
        return xx (cast((*MTLVertexAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLAttribute :: struct #type_info_none {
    name :: inline (self: *MTLAttribute) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLAttribute, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    attributeIndex :: inline (self: *MTLAttribute) -> NSUInteger {
        sel := sel_registerName2("attributeIndex");
        return xx (cast((*MTLAttribute, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    attributeType :: inline (self: *MTLAttribute) -> MTLDataType {
        sel := sel_registerName2("attributeType");
        return xx (cast((*MTLAttribute, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    isActive :: inline (self: *MTLAttribute) -> BOOL {
        sel := sel_registerName2("isActive");
        return xx (cast((*MTLAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    isPatchData :: inline (self: *MTLAttribute) -> BOOL {
        sel := sel_registerName2("isPatchData");
        return xx (cast((*MTLAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    isPatchControlPointData :: inline (self: *MTLAttribute) -> BOOL {
        sel := sel_registerName2("isPatchControlPointData");
        return xx (cast((*MTLAttribute, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionType :: enum NSUInteger {
    Vertex       :: 1;
    Fragment     :: 2;
    Kernel       :: 3;
    Visible      :: 5;
    Intersection :: 6;
    Mesh         :: 7;
    Object       :: 8;
}

MTLFunctionConstant :: struct #type_info_none {
    name :: inline (self: *MTLFunctionConstant) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLFunctionConstant, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    type :: inline (self: *MTLFunctionConstant) -> MTLDataType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLFunctionConstant, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    index :: inline (self: *MTLFunctionConstant) -> NSUInteger {
        sel := sel_registerName2("index");
        return xx (cast((*MTLFunctionConstant, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    required :: inline (self: *MTLFunctionConstant) -> BOOL {
        sel := sel_registerName2("required");
        return xx (cast((*MTLFunctionConstant, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunction :: struct #type_info_none {
    newArgumentEncoderWithBufferIndex :: inline (self: *MTLFunction, bufferIndex: NSUInteger) -> *MTLArgumentEncoder {
        sel := sel_registerName2("newArgumentEncoderWithBufferIndex:");
        return xx (cast((*MTLFunction, Selector, NSUInteger) -> *MTLArgumentEncoder #c_call)objc_msgSend)(self, sel, bufferIndex);
    }

    newArgumentEncoderWithBufferIndex :: inline (self: *MTLFunction, bufferIndex: NSUInteger, reflection: **MTLArgument) -> *MTLArgumentEncoder {
        sel := sel_registerName2("newArgumentEncoderWithBufferIndex:reflection:");
        return xx (cast((*MTLFunction, Selector, NSUInteger, **MTLArgument) -> *MTLArgumentEncoder #c_call)objc_msgSend)(self, sel, bufferIndex, reflection);
    }

    label :: inline (self: *MTLFunction) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLFunction, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLFunction, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLFunction, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLFunction) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLFunction, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    functionType :: inline (self: *MTLFunction) -> MTLFunctionType {
        sel := sel_registerName2("functionType");
        return xx (cast((*MTLFunction, Selector) -> MTLFunctionType #c_call)objc_msgSend)(self, sel);
    }

    patchType :: inline (self: *MTLFunction) -> MTLPatchType {
        sel := sel_registerName2("patchType");
        return xx (cast((*MTLFunction, Selector) -> MTLPatchType #c_call)objc_msgSend)(self, sel);
    }

    patchControlPointCount :: inline (self: *MTLFunction) -> NSInteger {
        sel := sel_registerName2("patchControlPointCount");
        return xx (cast((*MTLFunction, Selector) -> NSInteger #c_call)objc_msgSend)(self, sel);
    }

    vertexAttributes :: inline (self: *MTLFunction) -> *NSArray(*MTLVertexAttribute) {
        sel := sel_registerName2("vertexAttributes");
        return xx (cast((*MTLFunction, Selector) -> *NSArray(*MTLVertexAttribute) #c_call)objc_msgSend)(self, sel);
    }

    stageInputAttributes :: inline (self: *MTLFunction) -> *NSArray(*MTLAttribute) {
        sel := sel_registerName2("stageInputAttributes");
        return xx (cast((*MTLFunction, Selector) -> *NSArray(*MTLAttribute) #c_call)objc_msgSend)(self, sel);
    }

    name :: inline (self: *MTLFunction) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLFunction, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    functionConstantsDictionary :: inline (self: *MTLFunction) -> *NSDictionary(*NSString, *MTLFunctionConstant) {
        sel := sel_registerName2("functionConstantsDictionary");
        return xx (cast((*MTLFunction, Selector) -> *NSDictionary(*NSString, *MTLFunctionConstant) #c_call)objc_msgSend)(self, sel);
    }

    options :: inline (self: *MTLFunction) -> MTLFunctionOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTLFunction, Selector) -> MTLFunctionOptions #c_call)objc_msgSend)(self, sel);
    }
}

MTLLanguageVersion :: enum NSUInteger {
    _1_0 :: 65536;
    _1_1 :: 65537;
    _1_2 :: 65538;
    _2_0 :: 131072;
    _2_1 :: 131073;
    _2_2 :: 131074;
    _2_3 :: 131075;
    _2_4 :: 131076;
    _3_0 :: 196608;

    _3_1 :: 196609;

    _3_2 :: 196610;

    _4_0 :: 262144;
}

MTLLibraryType :: enum NSInteger {
    Executable :: 0;
    Dynamic    :: 1;
}

MTLLibraryOptimizationLevel :: enum NSInteger {
    Default :: 0;
    Size    :: 1;
}

MTLCompileSymbolVisibility :: enum NSInteger {
    Default :: 0;
    Hidden  :: 1;
}

MTLMathMode :: enum NSInteger {
    Safe    :: 0;
    Relaxed :: 1;
    Fast    :: 2;
}

MTLMathFloatingPointFunctions :: enum NSInteger {
    Fast    :: 0;
    Precise :: 1;
}

MTLCompileOptions :: struct #type_info_none {
    preprocessorMacros :: inline (self: *MTLCompileOptions) -> *NSDictionary(*NSString, *NSObject) {
        sel := sel_registerName2("preprocessorMacros");
        return xx (cast((*MTLCompileOptions, Selector) -> *NSDictionary(*NSString, *NSObject) #c_call)objc_msgSend)(self, sel);
    }
    setPreprocessorMacros :: inline (self: *MTLCompileOptions, preprocessorMacros: *NSDictionary(*NSString, *NSObject)) -> void {
        sel := sel_registerName2("setPreprocessorMacros:");
        return xx (cast((*MTLCompileOptions, Selector, *NSDictionary(*NSString, *NSObject)) -> void #c_call)objc_msgSend)(self, sel, preprocessorMacros);
    }

    fastMathEnabled :: inline (self: *MTLCompileOptions) -> BOOL {
        sel := sel_registerName2("fastMathEnabled");
        return xx (cast((*MTLCompileOptions, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setFastMathEnabled :: inline (self: *MTLCompileOptions, fastMathEnabled: BOOL) -> void {
        sel := sel_registerName2("setFastMathEnabled:");
        return xx (cast((*MTLCompileOptions, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, fastMathEnabled);
    }

    mathMode :: inline (self: *MTLCompileOptions) -> MTLMathMode {
        sel := sel_registerName2("mathMode");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLMathMode #c_call)objc_msgSend)(self, sel);
    }
    setMathMode :: inline (self: *MTLCompileOptions, mathMode: MTLMathMode) -> void {
        sel := sel_registerName2("setMathMode:");
        return xx (cast((*MTLCompileOptions, Selector, MTLMathMode) -> void #c_call)objc_msgSend)(self, sel, mathMode);
    }

    mathFloatingPointFunctions :: inline (self: *MTLCompileOptions) -> MTLMathFloatingPointFunctions {
        sel := sel_registerName2("mathFloatingPointFunctions");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLMathFloatingPointFunctions #c_call)objc_msgSend)(self, sel);
    }
    setMathFloatingPointFunctions :: inline (self: *MTLCompileOptions, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> void {
        sel := sel_registerName2("setMathFloatingPointFunctions:");
        return xx (cast((*MTLCompileOptions, Selector, MTLMathFloatingPointFunctions) -> void #c_call)objc_msgSend)(self, sel, mathFloatingPointFunctions);
    }

    languageVersion :: inline (self: *MTLCompileOptions) -> MTLLanguageVersion {
        sel := sel_registerName2("languageVersion");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLLanguageVersion #c_call)objc_msgSend)(self, sel);
    }
    setLanguageVersion :: inline (self: *MTLCompileOptions, languageVersion: MTLLanguageVersion) -> void {
        sel := sel_registerName2("setLanguageVersion:");
        return xx (cast((*MTLCompileOptions, Selector, MTLLanguageVersion) -> void #c_call)objc_msgSend)(self, sel, languageVersion);
    }

    libraryType :: inline (self: *MTLCompileOptions) -> MTLLibraryType {
        sel := sel_registerName2("libraryType");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLLibraryType #c_call)objc_msgSend)(self, sel);
    }
    setLibraryType :: inline (self: *MTLCompileOptions, libraryType: MTLLibraryType) -> void {
        sel := sel_registerName2("setLibraryType:");
        return xx (cast((*MTLCompileOptions, Selector, MTLLibraryType) -> void #c_call)objc_msgSend)(self, sel, libraryType);
    }

    installName :: inline (self: *MTLCompileOptions) -> *NSString {
        sel := sel_registerName2("installName");
        return xx (cast((*MTLCompileOptions, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setInstallName :: inline (self: *MTLCompileOptions, installName: *NSString) -> void {
        sel := sel_registerName2("setInstallName:");
        return xx (cast((*MTLCompileOptions, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, installName);
    }

    libraries :: inline (self: *MTLCompileOptions) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("libraries");
        return xx (cast((*MTLCompileOptions, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setLibraries :: inline (self: *MTLCompileOptions, libraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setLibraries:");
        return xx (cast((*MTLCompileOptions, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, libraries);
    }

    preserveInvariance :: inline (self: *MTLCompileOptions) -> BOOL {
        sel := sel_registerName2("preserveInvariance");
        return xx (cast((*MTLCompileOptions, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setPreserveInvariance :: inline (self: *MTLCompileOptions, preserveInvariance: BOOL) -> void {
        sel := sel_registerName2("setPreserveInvariance:");
        return xx (cast((*MTLCompileOptions, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, preserveInvariance);
    }

    optimizationLevel :: inline (self: *MTLCompileOptions) -> MTLLibraryOptimizationLevel {
        sel := sel_registerName2("optimizationLevel");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLLibraryOptimizationLevel #c_call)objc_msgSend)(self, sel);
    }
    setOptimizationLevel :: inline (self: *MTLCompileOptions, optimizationLevel: MTLLibraryOptimizationLevel) -> void {
        sel := sel_registerName2("setOptimizationLevel:");
        return xx (cast((*MTLCompileOptions, Selector, MTLLibraryOptimizationLevel) -> void #c_call)objc_msgSend)(self, sel, optimizationLevel);
    }

    compileSymbolVisibility :: inline (self: *MTLCompileOptions) -> MTLCompileSymbolVisibility {
        sel := sel_registerName2("compileSymbolVisibility");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLCompileSymbolVisibility #c_call)objc_msgSend)(self, sel);
    }
    setCompileSymbolVisibility :: inline (self: *MTLCompileOptions, compileSymbolVisibility: MTLCompileSymbolVisibility) -> void {
        sel := sel_registerName2("setCompileSymbolVisibility:");
        return xx (cast((*MTLCompileOptions, Selector, MTLCompileSymbolVisibility) -> void #c_call)objc_msgSend)(self, sel, compileSymbolVisibility);
    }

    allowReferencingUndefinedSymbols :: inline (self: *MTLCompileOptions) -> BOOL {
        sel := sel_registerName2("allowReferencingUndefinedSymbols");
        return xx (cast((*MTLCompileOptions, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAllowReferencingUndefinedSymbols :: inline (self: *MTLCompileOptions, allowReferencingUndefinedSymbols: BOOL) -> void {
        sel := sel_registerName2("setAllowReferencingUndefinedSymbols:");
        return xx (cast((*MTLCompileOptions, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, allowReferencingUndefinedSymbols);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTLCompileOptions) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTLCompileOptions, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerThreadgroup :: inline (self: *MTLCompileOptions, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerThreadgroup:");
        return xx (cast((*MTLCompileOptions, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTLCompileOptions) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTLCompileOptions, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerThreadgroup :: inline (self: *MTLCompileOptions, requiredThreadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerThreadgroup:");
        return xx (cast((*MTLCompileOptions, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerThreadgroup);
    }

    enableLogging :: inline (self: *MTLCompileOptions) -> BOOL {
        sel := sel_registerName2("enableLogging");
        return xx (cast((*MTLCompileOptions, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setEnableLogging :: inline (self: *MTLCompileOptions, enableLogging: BOOL) -> void {
        sel := sel_registerName2("setEnableLogging:");
        return xx (cast((*MTLCompileOptions, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, enableLogging);
    }
}

MTLFunctionReflection :: struct #type_info_none {
    bindings :: inline (self: *MTLFunctionReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("bindings");
        return xx (cast((*MTLFunctionReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }

    userAnnotation :: inline (self: *MTLFunctionReflection) -> *NSString {
        sel := sel_registerName2("userAnnotation");
        return xx (cast((*MTLFunctionReflection, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLLibraryError :: enum NSUInteger {
    Unsupported      :: 1;
    Internal         :: 2;
    CompileFailure   :: 3;
    CompileWarning   :: 4;
    FunctionNotFound :: 5;
    FileNotFound     :: 6;
}

MTLLibrary :: struct #type_info_none {
    newFunctionWithName :: inline (self: *MTLLibrary, functionName: *NSString) -> *MTLFunction {
        sel := sel_registerName2("newFunctionWithName:");
        return xx (cast((*MTLLibrary, Selector, *NSString) -> *MTLFunction #c_call)objc_msgSend)(self, sel, functionName);
    }

    newFunctionWithName :: inline (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction {
        sel := sel_registerName2("newFunctionWithName:constantValues:error:");
        return xx (cast((*MTLLibrary, Selector, *NSString, *MTLFunctionConstantValues, **NSError) -> *MTLFunction #c_call)objc_msgSend)(self, sel, name, constantValues, error);
    }

    newFunctionWithName :: inline (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, completionHandler: Block) -> void {
        sel := sel_registerName2("newFunctionWithName:constantValues:completionHandler:");
        return xx (cast((*MTLLibrary, Selector, *NSString, *MTLFunctionConstantValues, Block) -> void #c_call)objc_msgSend)(self, sel, name, constantValues, completionHandler);
    }

    reflectionForFunctionWithName :: inline (self: *MTLLibrary, functionName: *NSString) -> *MTLFunctionReflection {
        sel := sel_registerName2("reflectionForFunctionWithName:");
        return xx (cast((*MTLLibrary, Selector, *NSString) -> *MTLFunctionReflection #c_call)objc_msgSend)(self, sel, functionName);
    }

    newFunctionWithDescriptor :: inline (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, completionHandler: Block) -> void {
        sel := sel_registerName2("newFunctionWithDescriptor:completionHandler:");
        return xx (cast((*MTLLibrary, Selector, *MTLFunctionDescriptor, Block) -> void #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    newFunctionWithDescriptor :: inline (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction {
        sel := sel_registerName2("newFunctionWithDescriptor:error:");
        return xx (cast((*MTLLibrary, Selector, *MTLFunctionDescriptor, **NSError) -> *MTLFunction #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newIntersectionFunctionWithDescriptor :: inline (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, completionHandler: Block) -> void {
        sel := sel_registerName2("newIntersectionFunctionWithDescriptor:completionHandler:");
        return xx (cast((*MTLLibrary, Selector, *MTLIntersectionFunctionDescriptor, Block) -> void #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    newIntersectionFunctionWithDescriptor :: inline (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction {
        sel := sel_registerName2("newIntersectionFunctionWithDescriptor:error:");
        return xx (cast((*MTLLibrary, Selector, *MTLIntersectionFunctionDescriptor, **NSError) -> *MTLFunction #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    label :: inline (self: *MTLLibrary) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLLibrary, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLLibrary, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLLibrary, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLLibrary) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLLibrary, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    functionNames :: inline (self: *MTLLibrary) -> *NSArray(*NSString) {
        sel := sel_registerName2("functionNames");
        return xx (cast((*MTLLibrary, Selector) -> *NSArray(*NSString) #c_call)objc_msgSend)(self, sel);
    }

    type :: inline (self: *MTLLibrary) -> MTLLibraryType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLLibrary, Selector) -> MTLLibraryType #c_call)objc_msgSend)(self, sel);
    }

    installName :: inline (self: *MTLLibrary) -> *NSString {
        sel := sel_registerName2("installName");
        return xx (cast((*MTLLibrary, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLCommonCounter :: *NSString;
MTLCommonCounterTimestamp: MTLCommonCounter;
MTLCommonCounterTessellationInputPatches: MTLCommonCounter;
MTLCommonCounterVertexInvocations: MTLCommonCounter;
MTLCommonCounterPostTessellationVertexInvocations: MTLCommonCounter;
MTLCommonCounterClipperInvocations: MTLCommonCounter;
MTLCommonCounterClipperPrimitivesOut: MTLCommonCounter;
MTLCommonCounterFragmentInvocations: MTLCommonCounter;
MTLCommonCounterFragmentsPassed: MTLCommonCounter;
MTLCommonCounterComputeKernelInvocations: MTLCommonCounter;
MTLCommonCounterTotalCycles: MTLCommonCounter;
MTLCommonCounterVertexCycles: MTLCommonCounter;
MTLCommonCounterTessellationCycles: MTLCommonCounter;
MTLCommonCounterPostTessellationVertexCycles: MTLCommonCounter;
MTLCommonCounterFragmentCycles: MTLCommonCounter;
MTLCommonCounterRenderTargetWriteCycles: MTLCommonCounter;

MTLCommonCounterSet :: *NSString;
MTLCommonCounterSetTimestamp: MTLCommonCounterSet;
MTLCommonCounterSetStageUtilization: MTLCommonCounterSet;
MTLCommonCounterSetStatistic: MTLCommonCounterSet;

MTLCounterResultTimestamp :: struct #type_info_none {
    timestamp: u64;
}

MTLCounterResultStageUtilization :: struct #type_info_none {
    totalCycles:                  u64;
    vertexCycles:                 u64;
    tessellationCycles:           u64;
    postTessellationVertexCycles: u64;
    fragmentCycles:               u64;
    renderTargetCycles:           u64;
}

MTLCounterResultStatistic :: struct #type_info_none {
    tessellationInputPatches:          u64;
    vertexInvocations:                 u64;
    postTessellationVertexInvocations: u64;
    clipperInvocations:                u64;
    clipperPrimitivesOut:              u64;
    fragmentInvocations:               u64;
    fragmentsPassed:                   u64;
    computeKernelInvocations:          u64;
}

MTLCounter :: struct #type_info_none {
    name :: inline (self: *MTLCounter) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLCounter, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLCounterSet :: struct #type_info_none {
    name :: inline (self: *MTLCounterSet) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLCounterSet, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    counters :: inline (self: *MTLCounterSet) -> *NSArray(*MTLCounter) {
        sel := sel_registerName2("counters");
        return xx (cast((*MTLCounterSet, Selector) -> *NSArray(*MTLCounter) #c_call)objc_msgSend)(self, sel);
    }
}

MTLCounterSampleBufferDescriptor :: struct #type_info_none {
    counterSet :: inline (self: *MTLCounterSampleBufferDescriptor) -> *MTLCounterSet {
        sel := sel_registerName2("counterSet");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector) -> *MTLCounterSet #c_call)objc_msgSend)(self, sel);
    }
    setCounterSet :: inline (self: *MTLCounterSampleBufferDescriptor, counterSet: *MTLCounterSet) -> void {
        sel := sel_registerName2("setCounterSet:");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector, *MTLCounterSet) -> void #c_call)objc_msgSend)(self, sel, counterSet);
    }

    label :: inline (self: *MTLCounterSampleBufferDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLCounterSampleBufferDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    storageMode :: inline (self: *MTLCounterSampleBufferDescriptor) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }
    setStorageMode :: inline (self: *MTLCounterSampleBufferDescriptor, storageMode: MTLStorageMode) -> void {
        sel := sel_registerName2("setStorageMode:");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector, MTLStorageMode) -> void #c_call)objc_msgSend)(self, sel, storageMode);
    }

    sampleCount :: inline (self: *MTLCounterSampleBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSampleCount :: inline (self: *MTLCounterSampleBufferDescriptor, sampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setSampleCount:");
        return xx (cast((*MTLCounterSampleBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampleCount);
    }
}

MTLCounterSampleBuffer :: struct #type_info_none {
    resolveCounterRange :: inline (self: *MTLCounterSampleBuffer, range: NSRange) -> *NSData {
        sel := sel_registerName2("resolveCounterRange:");
        return xx (cast((*MTLCounterSampleBuffer, Selector, NSRange) -> *NSData #c_call)objc_msgSend)(self, sel, range);
    }

    device :: inline (self: *MTLCounterSampleBuffer) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLCounterSampleBuffer, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLCounterSampleBuffer) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCounterSampleBuffer, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    sampleCount :: inline (self: *MTLCounterSampleBuffer) -> NSUInteger {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLCounterSampleBuffer, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLCounterSampleBufferError :: enum NSInteger {
    OutOfMemory :: 0;
    Invalid     :: 1;
    Internal    :: 2;
}

MTL4CompilerTaskStatus :: enum NSInteger {
    None      :: 0;

    Scheduled :: 1;

    Compiling :: 2;

    Finished  :: 3;
}

MTL4CompilerTask :: struct #type_info_none {
    waitUntilCompleted :: inline (self: *MTL4CompilerTask) -> void {
        sel := sel_registerName2("waitUntilCompleted");
        return xx (cast((*MTL4CompilerTask, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    compiler :: inline (self: *MTL4CompilerTask) -> *MTL4Compiler {
        sel := sel_registerName2("compiler");
        return xx (cast((*MTL4CompilerTask, Selector) -> *MTL4Compiler #c_call)objc_msgSend)(self, sel);
    }

    status :: inline (self: *MTL4CompilerTask) -> MTL4CompilerTaskStatus {
        sel := sel_registerName2("status");
        return xx (cast((*MTL4CompilerTask, Selector) -> MTL4CompilerTaskStatus #c_call)objc_msgSend)(self, sel);
    }
}

MTL4CompilerDescriptor :: struct #type_info_none {
    label :: inline (self: *MTL4CompilerDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CompilerDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CompilerDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CompilerDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    pipelineDataSetSerializer :: inline (self: *MTL4CompilerDescriptor) -> *MTL4PipelineDataSetSerializer {
        sel := sel_registerName2("pipelineDataSetSerializer");
        return xx (cast((*MTL4CompilerDescriptor, Selector) -> *MTL4PipelineDataSetSerializer #c_call)objc_msgSend)(self, sel);
    }
    setPipelineDataSetSerializer :: inline (self: *MTL4CompilerDescriptor, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> void {
        sel := sel_registerName2("setPipelineDataSetSerializer:");
        return xx (cast((*MTL4CompilerDescriptor, Selector, *MTL4PipelineDataSetSerializer) -> void #c_call)objc_msgSend)(self, sel, pipelineDataSetSerializer);
    }
}

MTL4CompilerTaskOptions :: struct #type_info_none {
    lookupArchives :: inline (self: *MTL4CompilerTaskOptions) -> *NSArray(*MTL4Archive) {
        sel := sel_registerName2("lookupArchives");
        return xx (cast((*MTL4CompilerTaskOptions, Selector) -> *NSArray(*MTL4Archive) #c_call)objc_msgSend)(self, sel);
    }
    setLookupArchives :: inline (self: *MTL4CompilerTaskOptions, lookupArchives: *NSArray(*MTL4Archive)) -> void {
        sel := sel_registerName2("setLookupArchives:");
        return xx (cast((*MTL4CompilerTaskOptions, Selector, *NSArray(*MTL4Archive)) -> void #c_call)objc_msgSend)(self, sel, lookupArchives);
    }
}

MTL4NewBinaryFunctionCompletionHandler :: Block;

MTL4NewMachineLearningPipelineStateCompletionHandler :: Block;

MTL4Compiler :: struct #type_info_none {
    newLibraryWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithDescriptor:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4LibraryDescriptor, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newDynamicLibrary :: inline (self: *MTL4Compiler, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        sel := sel_registerName2("newDynamicLibrary:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTLLibrary, **NSError) -> *MTLDynamicLibrary #c_call)objc_msgSend)(self, sel, library, error);
    }

    newDynamicLibraryWithURL :: inline (self: *MTL4Compiler, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        sel := sel_registerName2("newDynamicLibraryWithURL:error:");
        return xx (cast((*MTL4Compiler, Selector, *NSURL, **NSError) -> *MTLDynamicLibrary #c_call)objc_msgSend)(self, sel, url, error);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:compilerTaskOptions:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4ComputePipelineDescriptor, *MTL4CompilerTaskOptions, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, error);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:dynamicLinkingDescriptor:compilerTaskOptions:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4ComputePipelineDescriptor, *MTL4PipelineStageDynamicLinkingDescriptor, *MTL4CompilerTaskOptions, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:compilerTaskOptions:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTL4CompilerTaskOptions, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:dynamicLinkingDescriptor:compilerTaskOptions:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTL4RenderPipelineDynamicLinkingDescriptor, *MTL4CompilerTaskOptions, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateBySpecializationWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateBySpecializationWithDescriptor:pipeline:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTLRenderPipelineState, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, pipeline, error);
    }

    newBinaryFunctionWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction {
        sel := sel_registerName2("newBinaryFunctionWithDescriptor:compilerTaskOptions:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4BinaryFunctionDescriptor, *MTL4CompilerTaskOptions, **NSError) -> *MTL4BinaryFunction #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, error);
    }

    newLibraryWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newLibraryWithDescriptor:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4LibraryDescriptor, MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    newDynamicLibrary :: inline (self: *MTL4Compiler, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newDynamicLibrary:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTLLibrary, MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, library, completionHandler);
    }

    newDynamicLibraryWithURL :: inline (self: *MTL4Compiler, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newDynamicLibraryWithURL:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *NSURL, MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, url, completionHandler);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:compilerTaskOptions:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4ComputePipelineDescriptor, *MTL4CompilerTaskOptions, MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, completionHandler);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:dynamicLinkingDescriptor:compilerTaskOptions:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4ComputePipelineDescriptor, *MTL4PipelineStageDynamicLinkingDescriptor, *MTL4CompilerTaskOptions, MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:compilerTaskOptions:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTL4CompilerTaskOptions, MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:dynamicLinkingDescriptor:compilerTaskOptions:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTL4RenderPipelineDynamicLinkingDescriptor, *MTL4CompilerTaskOptions, MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateBySpecializationWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newRenderPipelineStateBySpecializationWithDescriptor:pipeline:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4PipelineDescriptor, *MTLRenderPipelineState, MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, pipeline, completionHandler);
    }

    newBinaryFunctionWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newBinaryFunctionWithDescriptor:compilerTaskOptions:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4BinaryFunctionDescriptor, *MTL4CompilerTaskOptions, MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, compilerTaskOptions, completionHandler);
    }

    newMachineLearningPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState {
        sel := sel_registerName2("newMachineLearningPipelineStateWithDescriptor:error:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4MachineLearningPipelineDescriptor, **NSError) -> *MTL4MachineLearningPipelineState #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newMachineLearningPipelineStateWithDescriptor :: inline (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        sel := sel_registerName2("newMachineLearningPipelineStateWithDescriptor:completionHandler:");
        return xx (cast((*MTL4Compiler, Selector, *MTL4MachineLearningPipelineDescriptor, MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    device :: inline (self: *MTL4Compiler) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4Compiler, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4Compiler) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4Compiler, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    pipelineDataSetSerializer :: inline (self: *MTL4Compiler) -> *MTL4PipelineDataSetSerializer {
        sel := sel_registerName2("pipelineDataSetSerializer");
        return xx (cast((*MTL4Compiler, Selector) -> *MTL4PipelineDataSetSerializer #c_call)objc_msgSend)(self, sel);
    }
}

MTL4TimestampHeapEntry :: struct #type_info_none {
    timestamp: u64;
}

MTL4CounterHeapType :: enum NSInteger {
    Invalid   :: 0;

    Timestamp :: 1;
}

MTL4TimestampGranularity :: enum NSInteger {
    Relaxed :: 0;

    Precise :: 1;
}

MTL4CounterHeapDescriptor :: struct #type_info_none {
    type :: inline (self: *MTL4CounterHeapDescriptor) -> MTL4CounterHeapType {
        sel := sel_registerName2("type");
        return xx (cast((*MTL4CounterHeapDescriptor, Selector) -> MTL4CounterHeapType #c_call)objc_msgSend)(self, sel);
    }
    setType :: inline (self: *MTL4CounterHeapDescriptor, type: MTL4CounterHeapType) -> void {
        sel := sel_registerName2("setType:");
        return xx (cast((*MTL4CounterHeapDescriptor, Selector, MTL4CounterHeapType) -> void #c_call)objc_msgSend)(self, sel, type);
    }

    count :: inline (self: *MTL4CounterHeapDescriptor) -> NSUInteger {
        sel := sel_registerName2("count");
        return xx (cast((*MTL4CounterHeapDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setCount :: inline (self: *MTL4CounterHeapDescriptor, count: NSUInteger) -> void {
        sel := sel_registerName2("setCount:");
        return xx (cast((*MTL4CounterHeapDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, count);
    }
}

MTL4CounterHeap :: struct #type_info_none {
    resolveCounterRange :: inline (self: *MTL4CounterHeap, range: NSRange) -> *NSData {
        sel := sel_registerName2("resolveCounterRange:");
        return xx (cast((*MTL4CounterHeap, Selector, NSRange) -> *NSData #c_call)objc_msgSend)(self, sel, range);
    }

    invalidateCounterRange :: inline (self: *MTL4CounterHeap, range: NSRange) -> void {
        sel := sel_registerName2("invalidateCounterRange:");
        return xx (cast((*MTL4CounterHeap, Selector, NSRange) -> void #c_call)objc_msgSend)(self, sel, range);
    }

    label :: inline (self: *MTL4CounterHeap) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CounterHeap, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CounterHeap, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CounterHeap, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    count :: inline (self: *MTL4CounterHeap) -> NSUInteger {
        sel := sel_registerName2("count");
        return xx (cast((*MTL4CounterHeap, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    type :: inline (self: *MTL4CounterHeap) -> MTL4CounterHeapType {
        sel := sel_registerName2("type");
        return xx (cast((*MTL4CounterHeap, Selector) -> MTL4CounterHeapType #c_call)objc_msgSend)(self, sel);
    }
}

MTLIOCompressionMethod :: enum NSInteger {
    Zlib     :: 0;
    LZFSE    :: 1;
    LZ4      :: 2;
    LZMA     :: 3;
    LZBitmap :: 4;
}

MTLDeviceNotificationName :: *NSString;

MTLDeviceNotificationHandler :: Block;

MTLFeatureSet :: enum NSUInteger {
    iOS_GPUFamily1_v1           :: 0;
    iOS_GPUFamily2_v1           :: 1;

    iOS_GPUFamily1_v2           :: 2;
    iOS_GPUFamily2_v2           :: 3;
    iOS_GPUFamily3_v1           :: 4;

    iOS_GPUFamily1_v3           :: 5;
    iOS_GPUFamily2_v3           :: 6;
    iOS_GPUFamily3_v2           :: 7;

    iOS_GPUFamily1_v4           :: 8;
    iOS_GPUFamily2_v4           :: 9;
    iOS_GPUFamily3_v3           :: 10;
    iOS_GPUFamily4_v1           :: 11;

    iOS_GPUFamily1_v5           :: 12;
    iOS_GPUFamily2_v5           :: 13;
    iOS_GPUFamily3_v4           :: 14;
    iOS_GPUFamily4_v2           :: 15;
    iOS_GPUFamily5_v1           :: 16;

    macOS_GPUFamily1_v1         :: 10000;
    OSX_GPUFamily1_v1           :: 10000;

    macOS_GPUFamily1_v2         :: 10001;
    OSX_GPUFamily1_v2           :: 10001;
    macOS_ReadWriteTextureTier2 :: 10002;
    OSX_ReadWriteTextureTier2   :: 10002;

    macOS_GPUFamily1_v3         :: 10003;

    macOS_GPUFamily1_v4         :: 10004;
    macOS_GPUFamily2_v1         :: 10005;

    tvOS_GPUFamily1_v1          :: 30000;
    TVOS_GPUFamily1_v1          :: 30000;

    tvOS_GPUFamily1_v2          :: 30001;

    tvOS_GPUFamily1_v3          :: 30002;
    tvOS_GPUFamily2_v1          :: 30003;

    tvOS_GPUFamily1_v4          :: 30004;
    tvOS_GPUFamily2_v2          :: 30005;
}

MTLGPUFamily :: enum NSInteger {
    Apple1       :: 1001;
    Apple2       :: 1002;
    Apple3       :: 1003;
    Apple4       :: 1004;
    Apple5       :: 1005;
    Apple6       :: 1006;
    Apple7       :: 1007;
    Apple8       :: 1008;
    Apple9       :: 1009;
    Apple10      :: 1010;

    Mac1         :: 2001;
    Mac2         :: 2002;

    Common1      :: 3001;
    Common2      :: 3002;
    Common3      :: 3003;

    MacCatalyst1 :: 4001;
    MacCatalyst2 :: 4002;

    Metal3       :: 5001;
    Metal4       :: 5002;
}

MTLDeviceLocation :: enum NSUInteger {
    BuiltIn     :: 0;
    Slot        :: 1;
    External    :: 2;
    Unspecified :: 18446744073709551615;
}

MTLPipelineOption :: NSUInteger;
MTLPipelineOption_1 :: enum MTLPipelineOption {
    None                    :: 0;
    ArgumentInfo            :: 1;
    BindingInfo             :: 1;
    BufferTypeInfo          :: 2;
    FailOnBinaryArchiveMiss :: 4;
}

MTLReadWriteTextureTier :: enum NSUInteger {
    None :: 0;
    _1   :: 1;
    _2   :: 2;
}

MTLArgumentBuffersTier :: enum NSUInteger {
    _1 :: 0;
    _2 :: 1;
}

MTLSparseTextureRegionAlignmentMode :: enum NSUInteger {
    Outward :: 0;
    Inward  :: 1;
}

MTLAccelerationStructureSizes :: struct #type_info_none {
    accelerationStructureSize: NSUInteger;

    buildScratchBufferSize:    NSUInteger;

    refitScratchBufferSize:    NSUInteger;
}

MTLCounterSamplingPoint :: enum NSUInteger {
    AtStageBoundary        :: 0;
    AtDrawBoundary         :: 1;
    AtDispatchBoundary     :: 2;
    AtTileDispatchBoundary :: 3;
    AtBlitBoundary         :: 4;
}

MTLSizeAndAlign :: struct #type_info_none {
    size:  NSUInteger;
    align: NSUInteger;
}

MTLArgumentDescriptor :: struct #type_info_none {
    argumentDescriptor :: inline () -> *MTLArgumentDescriptor {
        class := objc_getClass("MTLArgumentDescriptor");
        sel := sel_registerName2("argumentDescriptor");
        return xx (cast((Class, Selector) -> *MTLArgumentDescriptor #c_call)objc_msgSend)(class, sel);
    }

    dataType :: inline (self: *MTLArgumentDescriptor) -> MTLDataType {
        sel := sel_registerName2("dataType");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> MTLDataType #c_call)objc_msgSend)(self, sel);
    }
    setDataType :: inline (self: *MTLArgumentDescriptor, dataType: MTLDataType) -> void {
        sel := sel_registerName2("setDataType:");
        return xx (cast((*MTLArgumentDescriptor, Selector, MTLDataType) -> void #c_call)objc_msgSend)(self, sel, dataType);
    }

    index :: inline (self: *MTLArgumentDescriptor) -> NSUInteger {
        sel := sel_registerName2("index");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndex :: inline (self: *MTLArgumentDescriptor, index: NSUInteger) -> void {
        sel := sel_registerName2("setIndex:");
        return xx (cast((*MTLArgumentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, index);
    }

    arrayLength :: inline (self: *MTLArgumentDescriptor) -> NSUInteger {
        sel := sel_registerName2("arrayLength");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setArrayLength :: inline (self: *MTLArgumentDescriptor, arrayLength: NSUInteger) -> void {
        sel := sel_registerName2("setArrayLength:");
        return xx (cast((*MTLArgumentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, arrayLength);
    }

    access :: inline (self: *MTLArgumentDescriptor) -> MTLBindingAccess {
        sel := sel_registerName2("access");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> MTLBindingAccess #c_call)objc_msgSend)(self, sel);
    }
    setAccess :: inline (self: *MTLArgumentDescriptor, access: MTLBindingAccess) -> void {
        sel := sel_registerName2("setAccess:");
        return xx (cast((*MTLArgumentDescriptor, Selector, MTLBindingAccess) -> void #c_call)objc_msgSend)(self, sel, access);
    }

    textureType :: inline (self: *MTLArgumentDescriptor) -> MTLTextureType {
        sel := sel_registerName2("textureType");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> MTLTextureType #c_call)objc_msgSend)(self, sel);
    }
    setTextureType :: inline (self: *MTLArgumentDescriptor, textureType: MTLTextureType) -> void {
        sel := sel_registerName2("setTextureType:");
        return xx (cast((*MTLArgumentDescriptor, Selector, MTLTextureType) -> void #c_call)objc_msgSend)(self, sel, textureType);
    }

    constantBlockAlignment :: inline (self: *MTLArgumentDescriptor) -> NSUInteger {
        sel := sel_registerName2("constantBlockAlignment");
        return xx (cast((*MTLArgumentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setConstantBlockAlignment :: inline (self: *MTLArgumentDescriptor, constantBlockAlignment: NSUInteger) -> void {
        sel := sel_registerName2("setConstantBlockAlignment:");
        return xx (cast((*MTLArgumentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, constantBlockAlignment);
    }
}

MTLArchitecture :: struct #type_info_none {
    name :: inline (self: *MTLArchitecture) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLArchitecture, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLDevice :: struct #type_info_none {
    newLogStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState {
        sel := sel_registerName2("newLogStateWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLLogStateDescriptor, **NSError) -> *MTLLogState #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newCommandQueue :: inline (self: *MTLDevice) -> *MTLCommandQueue {
        sel := sel_registerName2("newCommandQueue");
        return xx (cast((*MTLDevice, Selector) -> *MTLCommandQueue #c_call)objc_msgSend)(self, sel);
    }

    newCommandQueueWithMaxCommandBufferCount :: inline (self: *MTLDevice, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue {
        sel := sel_registerName2("newCommandQueueWithMaxCommandBufferCount:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> *MTLCommandQueue #c_call)objc_msgSend)(self, sel, maxCommandBufferCount);
    }

    newCommandQueueWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue {
        sel := sel_registerName2("newCommandQueueWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLCommandQueueDescriptor) -> *MTLCommandQueue #c_call)objc_msgSend)(self, sel, descriptor);
    }

    heapTextureSizeAndAlignWithDescriptor :: inline (self: *MTLDevice, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign {
        sel := sel_registerName2("heapTextureSizeAndAlignWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLTextureDescriptor) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel, desc);
    }

    heapBufferSizeAndAlignWithLength :: inline (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign {
        sel := sel_registerName2("heapBufferSizeAndAlignWithLength:options:");
        return xx (cast((*MTLDevice, Selector, NSUInteger, MTLResourceOptions) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel, length, options);
    }

    newHeapWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLHeapDescriptor) -> *MTLHeap {
        sel := sel_registerName2("newHeapWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLHeapDescriptor) -> *MTLHeap #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newBufferWithLength :: inline (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithLength:options:");
        return xx (cast((*MTLDevice, Selector, NSUInteger, MTLResourceOptions) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, length, options);
    }

    newBufferWithBytes :: inline (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithBytes:length:options:");
        return xx (cast((*MTLDevice, Selector, *void, NSUInteger, MTLResourceOptions) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, pointer, length, options);
    }

    newBufferWithBytesNoCopy :: inline (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions, deallocator: Block) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithBytesNoCopy:length:options:deallocator:");
        return xx (cast((*MTLDevice, Selector, *void, NSUInteger, MTLResourceOptions, Block) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, pointer, length, options, deallocator);
    }

    newDepthStencilStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState {
        sel := sel_registerName2("newDepthStencilStateWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLDepthStencilDescriptor) -> *MTLDepthStencilState #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newTextureWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        sel := sel_registerName2("newTextureWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLTextureDescriptor) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newTextureWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture {
        sel := sel_registerName2("newTextureWithDescriptor:iosurface:plane:");
        return xx (cast((*MTLDevice, Selector, *MTLTextureDescriptor, IOSurfaceRef, NSUInteger) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor, iosurface, plane);
    }

    newSharedTextureWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        sel := sel_registerName2("newSharedTextureWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLTextureDescriptor) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newSharedTextureWithHandle :: inline (self: *MTLDevice, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture {
        sel := sel_registerName2("newSharedTextureWithHandle:");
        return xx (cast((*MTLDevice, Selector, *MTLSharedTextureHandle) -> *MTLTexture #c_call)objc_msgSend)(self, sel, sharedHandle);
    }

    newSamplerStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState {
        sel := sel_registerName2("newSamplerStateWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLSamplerDescriptor) -> *MTLSamplerState #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newDefaultLibrary :: inline (self: *MTLDevice) -> *MTLLibrary {
        sel := sel_registerName2("newDefaultLibrary");
        return xx (cast((*MTLDevice, Selector) -> *MTLLibrary #c_call)objc_msgSend)(self, sel);
    }

    newDefaultLibraryWithBundle :: inline (self: *MTLDevice, bundle: *NSBundle, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newDefaultLibraryWithBundle:error:");
        return xx (cast((*MTLDevice, Selector, *NSBundle, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, bundle, error);
    }

    newLibraryWithFile :: inline (self: *MTLDevice, filepath: *NSString, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithFile:error:");
        return xx (cast((*MTLDevice, Selector, *NSString, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, filepath, error);
    }

    newLibraryWithURL :: inline (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithURL:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, url, error);
    }

    newLibraryWithData :: inline (self: *MTLDevice, data: dispatch_data_t, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithData:error:");
        return xx (cast((*MTLDevice, Selector, dispatch_data_t, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, data, error);
    }

    newLibraryWithSource :: inline (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithSource:options:error:");
        return xx (cast((*MTLDevice, Selector, *NSString, *MTLCompileOptions, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, source, options, error);
    }

    newLibraryWithSource :: inline (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        sel := sel_registerName2("newLibraryWithSource:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *NSString, *MTLCompileOptions, MTLNewLibraryCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, source, options, completionHandler);
    }

    newLibraryWithStitchedDescriptor :: inline (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary {
        sel := sel_registerName2("newLibraryWithStitchedDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLStitchedLibraryDescriptor, **NSError) -> *MTLLibrary #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newLibraryWithStitchedDescriptor :: inline (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        sel := sel_registerName2("newLibraryWithStitchedDescriptor:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLStitchedLibraryDescriptor, MTLNewLibraryCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLRenderPipelineDescriptor, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:options:reflection:error:");
        return xx (cast((*MTLDevice, Selector, *MTLRenderPipelineDescriptor, MTLPipelineOption, **MTLRenderPipelineReflection, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> void {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLRenderPipelineDescriptor, MTLNewRenderPipelineStateCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, completionHandler);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLRenderPipelineDescriptor, MTLPipelineOption, MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, options, completionHandler);
    }

    newComputePipelineStateWithFunction :: inline (self: *MTLDevice, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithFunction:error:");
        return xx (cast((*MTLDevice, Selector, *MTLFunction, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, computeFunction, error);
    }

    newComputePipelineStateWithFunction :: inline (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithFunction:options:reflection:error:");
        return xx (cast((*MTLDevice, Selector, *MTLFunction, MTLPipelineOption, **MTLComputePipelineReflection, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, computeFunction, options, reflection, error);
    }

    newComputePipelineStateWithFunction :: inline (self: *MTLDevice, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> void {
        sel := sel_registerName2("newComputePipelineStateWithFunction:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLFunction, MTLNewComputePipelineStateCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, computeFunction, completionHandler);
    }

    newComputePipelineStateWithFunction :: inline (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        sel := sel_registerName2("newComputePipelineStateWithFunction:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLFunction, MTLPipelineOption, MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, computeFunction, options, completionHandler);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:options:reflection:error:");
        return xx (cast((*MTLDevice, Selector, *MTLComputePipelineDescriptor, MTLPipelineOption, **MTLComputePipelineReflection, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, descriptor, options, reflection, error);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLComputePipelineDescriptor, MTLPipelineOption, MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, options, completionHandler);
    }

    newFence :: inline (self: *MTLDevice) -> *MTLFence {
        sel := sel_registerName2("newFence");
        return xx (cast((*MTLDevice, Selector) -> *MTLFence #c_call)objc_msgSend)(self, sel);
    }

    supportsFeatureSet :: inline (self: *MTLDevice, featureSet: MTLFeatureSet) -> BOOL {
        sel := sel_registerName2("supportsFeatureSet:");
        return xx (cast((*MTLDevice, Selector, MTLFeatureSet) -> BOOL #c_call)objc_msgSend)(self, sel, featureSet);
    }

    supportsFamily :: inline (self: *MTLDevice, gpuFamily: MTLGPUFamily) -> BOOL {
        sel := sel_registerName2("supportsFamily:");
        return xx (cast((*MTLDevice, Selector, MTLGPUFamily) -> BOOL #c_call)objc_msgSend)(self, sel, gpuFamily);
    }

    supportsTextureSampleCount :: inline (self: *MTLDevice, sampleCount: NSUInteger) -> BOOL {
        sel := sel_registerName2("supportsTextureSampleCount:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> BOOL #c_call)objc_msgSend)(self, sel, sampleCount);
    }

    minimumLinearTextureAlignmentForPixelFormat :: inline (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        sel := sel_registerName2("minimumLinearTextureAlignmentForPixelFormat:");
        return xx (cast((*MTLDevice, Selector, MTLPixelFormat) -> NSUInteger #c_call)objc_msgSend)(self, sel, format);
    }

    minimumTextureBufferAlignmentForPixelFormat :: inline (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        sel := sel_registerName2("minimumTextureBufferAlignmentForPixelFormat:");
        return xx (cast((*MTLDevice, Selector, MTLPixelFormat) -> NSUInteger #c_call)objc_msgSend)(self, sel, format);
    }

    newRenderPipelineStateWithTileDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithTileDescriptor:options:reflection:error:");
        return xx (cast((*MTLDevice, Selector, *MTLTileRenderPipelineDescriptor, MTLPipelineOption, **MTLRenderPipelineReflection, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithTileDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        sel := sel_registerName2("newRenderPipelineStateWithTileDescriptor:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLTileRenderPipelineDescriptor, MTLPipelineOption, MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, options, completionHandler);
    }

    newRenderPipelineStateWithMeshDescriptor :: inline (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithMeshDescriptor:options:reflection:error:");
        return xx (cast((*MTLDevice, Selector, *MTLMeshRenderPipelineDescriptor, MTLPipelineOption, **MTLRenderPipelineReflection, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithMeshDescriptor :: inline (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        sel := sel_registerName2("newRenderPipelineStateWithMeshDescriptor:options:completionHandler:");
        return xx (cast((*MTLDevice, Selector, *MTLMeshRenderPipelineDescriptor, MTLPipelineOption, MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call)objc_msgSend)(self, sel, descriptor, options, completionHandler);
    }

    getDefaultSamplePositions :: inline (self: *MTLDevice, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        sel := sel_registerName2("getDefaultSamplePositions:count:");
        return xx (cast((*MTLDevice, Selector, *MTLSamplePosition, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, positions, count);
    }

    newArgumentEncoderWithArguments :: inline (self: *MTLDevice, arguments: *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder {
        sel := sel_registerName2("newArgumentEncoderWithArguments:");
        return xx (cast((*MTLDevice, Selector, *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder #c_call)objc_msgSend)(self, sel, arguments);
    }

    supportsRasterizationRateMapWithLayerCount :: inline (self: *MTLDevice, layerCount: NSUInteger) -> BOOL {
        sel := sel_registerName2("supportsRasterizationRateMapWithLayerCount:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> BOOL #c_call)objc_msgSend)(self, sel, layerCount);
    }

    newRasterizationRateMapWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap {
        sel := sel_registerName2("newRasterizationRateMapWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newIndirectCommandBufferWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer {
        sel := sel_registerName2("newIndirectCommandBufferWithDescriptor:maxCommandCount:options:");
        return xx (cast((*MTLDevice, Selector, *MTLIndirectCommandBufferDescriptor, NSUInteger, MTLResourceOptions) -> *MTLIndirectCommandBuffer #c_call)objc_msgSend)(self, sel, descriptor, maxCount, options);
    }

    newEvent :: inline (self: *MTLDevice) -> *MTLEvent {
        sel := sel_registerName2("newEvent");
        return xx (cast((*MTLDevice, Selector) -> *MTLEvent #c_call)objc_msgSend)(self, sel);
    }

    newSharedEvent :: inline (self: *MTLDevice) -> *MTLSharedEvent {
        sel := sel_registerName2("newSharedEvent");
        return xx (cast((*MTLDevice, Selector) -> *MTLSharedEvent #c_call)objc_msgSend)(self, sel);
    }

    newSharedEventWithHandle :: inline (self: *MTLDevice, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent {
        sel := sel_registerName2("newSharedEventWithHandle:");
        return xx (cast((*MTLDevice, Selector, *MTLSharedEventHandle) -> *MTLSharedEvent #c_call)objc_msgSend)(self, sel, sharedEventHandle);
    }

    newIOHandleWithURL :: inline (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        sel := sel_registerName2("newIOHandleWithURL:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, **NSError) -> *MTLIOFileHandle #c_call)objc_msgSend)(self, sel, url, error);
    }

    newIOCommandQueueWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue {
        sel := sel_registerName2("newIOCommandQueueWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLIOCommandQueueDescriptor, **NSError) -> *MTLIOCommandQueue #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newIOHandleWithURL :: inline (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        sel := sel_registerName2("newIOHandleWithURL:compressionMethod:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, MTLIOCompressionMethod, **NSError) -> *MTLIOFileHandle #c_call)objc_msgSend)(self, sel, url, compressionMethod, error);
    }

    newIOFileHandleWithURL :: inline (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        sel := sel_registerName2("newIOFileHandleWithURL:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, **NSError) -> *MTLIOFileHandle #c_call)objc_msgSend)(self, sel, url, error);
    }

    newIOFileHandleWithURL :: inline (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        sel := sel_registerName2("newIOFileHandleWithURL:compressionMethod:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, MTLIOCompressionMethod, **NSError) -> *MTLIOFileHandle #c_call)objc_msgSend)(self, sel, url, compressionMethod, error);
    }

    sparseTileSizeWithTextureType :: inline (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize {
        sel := sel_registerName2("sparseTileSizeWithTextureType:pixelFormat:sampleCount:");
        return xx (cast((*MTLDevice, Selector, MTLTextureType, MTLPixelFormat, NSUInteger) -> MTLSize #c_call)objc_msgSend)(self, sel, textureType, pixelFormat, sampleCount);
    }

    convertSparsePixelRegions :: inline (self: *MTLDevice, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> void {
        sel := sel_registerName2("convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:");
        return xx (cast((*MTLDevice, Selector, *MTLRegion, *MTLRegion, MTLSize, MTLSparseTextureRegionAlignmentMode, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pixelRegions, tileRegions, tileSize, mode, numRegions);
    }

    convertSparseTileRegions :: inline (self: *MTLDevice, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> void {
        sel := sel_registerName2("convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:");
        return xx (cast((*MTLDevice, Selector, *MTLRegion, *MTLRegion, MTLSize, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, tileRegions, pixelRegions, tileSize, numRegions);
    }

    sparseTileSizeInBytesForSparsePageSize :: inline (self: *MTLDevice, sparsePageSize: MTLSparsePageSize) -> NSUInteger {
        sel := sel_registerName2("sparseTileSizeInBytesForSparsePageSize:");
        return xx (cast((*MTLDevice, Selector, MTLSparsePageSize) -> NSUInteger #c_call)objc_msgSend)(self, sel, sparsePageSize);
    }

    sparseTileSizeWithTextureType :: inline (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize {
        sel := sel_registerName2("sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize:");
        return xx (cast((*MTLDevice, Selector, MTLTextureType, MTLPixelFormat, NSUInteger, MTLSparsePageSize) -> MTLSize #c_call)objc_msgSend)(self, sel, textureType, pixelFormat, sampleCount, sparsePageSize);
    }

    newCounterSampleBufferWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("newCounterSampleBufferWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLCounterSampleBufferDescriptor, **NSError) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    sampleTimestamps :: inline (self: *MTLDevice, cpuTimestamp: *MTLTimestamp, gpuTimestamp: *MTLTimestamp) -> void {
        sel := sel_registerName2("sampleTimestamps:gpuTimestamp:");
        return xx (cast((*MTLDevice, Selector, *MTLTimestamp, *MTLTimestamp) -> void #c_call)objc_msgSend)(self, sel, cpuTimestamp, gpuTimestamp);
    }

    newArgumentEncoderWithBufferBinding :: inline (self: *MTLDevice, bufferBinding: *MTLBufferBinding) -> *MTLArgumentEncoder {
        sel := sel_registerName2("newArgumentEncoderWithBufferBinding:");
        return xx (cast((*MTLDevice, Selector, *MTLBufferBinding) -> *MTLArgumentEncoder #c_call)objc_msgSend)(self, sel, bufferBinding);
    }

    supportsCounterSampling :: inline (self: *MTLDevice, samplingPoint: MTLCounterSamplingPoint) -> BOOL {
        sel := sel_registerName2("supportsCounterSampling:");
        return xx (cast((*MTLDevice, Selector, MTLCounterSamplingPoint) -> BOOL #c_call)objc_msgSend)(self, sel, samplingPoint);
    }

    supportsVertexAmplificationCount :: inline (self: *MTLDevice, count: NSUInteger) -> BOOL {
        sel := sel_registerName2("supportsVertexAmplificationCount:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> BOOL #c_call)objc_msgSend)(self, sel, count);
    }

    newDynamicLibrary :: inline (self: *MTLDevice, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        sel := sel_registerName2("newDynamicLibrary:error:");
        return xx (cast((*MTLDevice, Selector, *MTLLibrary, **NSError) -> *MTLDynamicLibrary #c_call)objc_msgSend)(self, sel, library, error);
    }

    newDynamicLibraryWithURL :: inline (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        sel := sel_registerName2("newDynamicLibraryWithURL:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, **NSError) -> *MTLDynamicLibrary #c_call)objc_msgSend)(self, sel, url, error);
    }

    newBinaryArchiveWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLBinaryArchiveDescriptor, error: **NSError) -> *MTLBinaryArchive {
        sel := sel_registerName2("newBinaryArchiveWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLBinaryArchiveDescriptor, **NSError) -> *MTLBinaryArchive #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    accelerationStructureSizesWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes {
        sel := sel_registerName2("accelerationStructureSizesWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newAccelerationStructureWithSize :: inline (self: *MTLDevice, size: NSUInteger) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithSize:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, size);
    }
    newAccelerationStructureWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, descriptor);
    }

    heapAccelerationStructureSizeAndAlignWithSize :: inline (self: *MTLDevice, size: NSUInteger) -> MTLSizeAndAlign {
        sel := sel_registerName2("heapAccelerationStructureSizeAndAlignWithSize:");
        return xx (cast((*MTLDevice, Selector, NSUInteger) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel, size);
    }

    heapAccelerationStructureSizeAndAlignWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign {
        sel := sel_registerName2("heapAccelerationStructureSizeAndAlignWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newResidencySetWithDescriptor :: inline (self: *MTLDevice, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet {
        sel := sel_registerName2("newResidencySetWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLResidencySetDescriptor, **NSError) -> *MTLResidencySet #c_call)objc_msgSend)(self, sel, desc, error);
    }

    tensorSizeAndAlignWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign {
        sel := sel_registerName2("tensorSizeAndAlignWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTLTensorDescriptor) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newTensorWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor {
        sel := sel_registerName2("newTensorWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLTensorDescriptor, **NSError) -> *MTLTensor #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    functionHandleWithFunction :: inline (self: *MTLDevice, function: *MTLFunction) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithFunction:");
        return xx (cast((*MTLDevice, Selector, *MTLFunction) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function);
    }

    newCommandAllocator :: inline (self: *MTLDevice) -> *MTL4CommandAllocator {
        sel := sel_registerName2("newCommandAllocator");
        return xx (cast((*MTLDevice, Selector) -> *MTL4CommandAllocator #c_call)objc_msgSend)(self, sel);
    }

    newCommandAllocatorWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator {
        sel := sel_registerName2("newCommandAllocatorWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTL4CommandAllocatorDescriptor, **NSError) -> *MTL4CommandAllocator #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newMTL4CommandQueue :: inline (self: *MTLDevice) -> *MTL4CommandQueue {
        sel := sel_registerName2("newMTL4CommandQueue");
        return xx (cast((*MTLDevice, Selector) -> *MTL4CommandQueue #c_call)objc_msgSend)(self, sel);
    }

    newMTL4CommandQueueWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue {
        sel := sel_registerName2("newMTL4CommandQueueWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTL4CommandQueueDescriptor, **NSError) -> *MTL4CommandQueue #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newCommandBuffer :: inline (self: *MTLDevice) -> *MTL4CommandBuffer {
        sel := sel_registerName2("newCommandBuffer");
        return xx (cast((*MTLDevice, Selector) -> *MTL4CommandBuffer #c_call)objc_msgSend)(self, sel);
    }

    newArgumentTableWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable {
        sel := sel_registerName2("newArgumentTableWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTL4ArgumentTableDescriptor, **NSError) -> *MTL4ArgumentTable #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newTextureViewPoolWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool {
        sel := sel_registerName2("newTextureViewPoolWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTLResourceViewPoolDescriptor, **NSError) -> *MTLTextureViewPool #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newCompilerWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler {
        sel := sel_registerName2("newCompilerWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTL4CompilerDescriptor, **NSError) -> *MTL4Compiler #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newArchiveWithURL :: inline (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTL4Archive {
        sel := sel_registerName2("newArchiveWithURL:error:");
        return xx (cast((*MTLDevice, Selector, *NSURL, **NSError) -> *MTL4Archive #c_call)objc_msgSend)(self, sel, url, error);
    }

    newPipelineDataSetSerializerWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer {
        sel := sel_registerName2("newPipelineDataSetSerializerWithDescriptor:");
        return xx (cast((*MTLDevice, Selector, *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newBufferWithLength :: inline (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithLength:options:placementSparsePageSize:");
        return xx (cast((*MTLDevice, Selector, NSUInteger, MTLResourceOptions, MTLSparsePageSize) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, length, options, placementSparsePageSize);
    }

    newCounterHeapWithDescriptor :: inline (self: *MTLDevice, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap {
        sel := sel_registerName2("newCounterHeapWithDescriptor:error:");
        return xx (cast((*MTLDevice, Selector, *MTL4CounterHeapDescriptor, **NSError) -> *MTL4CounterHeap #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    sizeOfCounterHeapEntry :: inline (self: *MTLDevice, type: MTL4CounterHeapType) -> NSUInteger {
        sel := sel_registerName2("sizeOfCounterHeapEntry:");
        return xx (cast((*MTLDevice, Selector, MTL4CounterHeapType) -> NSUInteger #c_call)objc_msgSend)(self, sel, type);
    }

    queryTimestampFrequency :: inline (self: *MTLDevice) -> u64 {
        sel := sel_registerName2("queryTimestampFrequency");
        return xx (cast((*MTLDevice, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    functionHandleWithBinaryFunction :: inline (self: *MTLDevice, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithBinaryFunction:");
        return xx (cast((*MTLDevice, Selector, *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function);
    }

    name :: inline (self: *MTLDevice) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLDevice, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    registryID :: inline (self: *MTLDevice) -> u64 {
        sel := sel_registerName2("registryID");
        return xx (cast((*MTLDevice, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    architecture :: inline (self: *MTLDevice) -> *MTLArchitecture {
        sel := sel_registerName2("architecture");
        return xx (cast((*MTLDevice, Selector) -> *MTLArchitecture #c_call)objc_msgSend)(self, sel);
    }

    maxThreadsPerThreadgroup :: inline (self: *MTLDevice) -> MTLSize {
        sel := sel_registerName2("maxThreadsPerThreadgroup");
        return xx (cast((*MTLDevice, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    isLowPower :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("isLowPower");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    isHeadless :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("isHeadless");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    isRemovable :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("isRemovable");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    hasUnifiedMemory :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("hasUnifiedMemory");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    recommendedMaxWorkingSetSize :: inline (self: *MTLDevice) -> u64 {
        sel := sel_registerName2("recommendedMaxWorkingSetSize");
        return xx (cast((*MTLDevice, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    location :: inline (self: *MTLDevice) -> MTLDeviceLocation {
        sel := sel_registerName2("location");
        return xx (cast((*MTLDevice, Selector) -> MTLDeviceLocation #c_call)objc_msgSend)(self, sel);
    }

    locationNumber :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("locationNumber");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxTransferRate :: inline (self: *MTLDevice) -> u64 {
        sel := sel_registerName2("maxTransferRate");
        return xx (cast((*MTLDevice, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    isDepth24Stencil8PixelFormatSupported :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("isDepth24Stencil8PixelFormatSupported");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    readWriteTextureSupport :: inline (self: *MTLDevice) -> MTLReadWriteTextureTier {
        sel := sel_registerName2("readWriteTextureSupport");
        return xx (cast((*MTLDevice, Selector) -> MTLReadWriteTextureTier #c_call)objc_msgSend)(self, sel);
    }

    argumentBuffersSupport :: inline (self: *MTLDevice) -> MTLArgumentBuffersTier {
        sel := sel_registerName2("argumentBuffersSupport");
        return xx (cast((*MTLDevice, Selector) -> MTLArgumentBuffersTier #c_call)objc_msgSend)(self, sel);
    }

    areRasterOrderGroupsSupported :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("areRasterOrderGroupsSupported");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supports32BitFloatFiltering :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supports32BitFloatFiltering");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supports32BitMSAA :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supports32BitMSAA");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsQueryTextureLOD :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsQueryTextureLOD");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsBCTextureCompression :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsBCTextureCompression");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsPullModelInterpolation :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsPullModelInterpolation");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    areBarycentricCoordsSupported :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("areBarycentricCoordsSupported");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsShaderBarycentricCoordinates :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsShaderBarycentricCoordinates");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    currentAllocatedSize :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("currentAllocatedSize");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxThreadgroupMemoryLength :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("maxThreadgroupMemoryLength");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxArgumentBufferSamplerCount :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("maxArgumentBufferSamplerCount");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    areProgrammableSamplePositionsSupported :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("areProgrammableSamplePositionsSupported");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    peerGroupID :: inline (self: *MTLDevice) -> u64 {
        sel := sel_registerName2("peerGroupID");
        return xx (cast((*MTLDevice, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    peerIndex :: inline (self: *MTLDevice) -> u32 {
        sel := sel_registerName2("peerIndex");
        return xx (cast((*MTLDevice, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }

    peerCount :: inline (self: *MTLDevice) -> u32 {
        sel := sel_registerName2("peerCount");
        return xx (cast((*MTLDevice, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }

    sparseTileSizeInBytes :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("sparseTileSizeInBytes");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxBufferLength :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("maxBufferLength");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    counterSets :: inline (self: *MTLDevice) -> *NSArray(*MTLCounterSet) {
        sel := sel_registerName2("counterSets");
        return xx (cast((*MTLDevice, Selector) -> *NSArray(*MTLCounterSet) #c_call)objc_msgSend)(self, sel);
    }

    supportsDynamicLibraries :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsDynamicLibraries");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsRenderDynamicLibraries :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsRenderDynamicLibraries");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsRaytracing :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsRaytracing");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsFunctionPointers :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsFunctionPointers");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsFunctionPointersFromRender :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsFunctionPointersFromRender");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsRaytracingFromRender :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsRaytracingFromRender");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    supportsPrimitiveMotionBlur :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("supportsPrimitiveMotionBlur");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    shouldMaximizeConcurrentCompilation :: inline (self: *MTLDevice) -> BOOL {
        sel := sel_registerName2("shouldMaximizeConcurrentCompilation");
        return xx (cast((*MTLDevice, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setShouldMaximizeConcurrentCompilation :: inline (self: *MTLDevice, shouldMaximizeConcurrentCompilation: BOOL) -> void {
        sel := sel_registerName2("setShouldMaximizeConcurrentCompilation:");
        return xx (cast((*MTLDevice, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, shouldMaximizeConcurrentCompilation);
    }

    maximumConcurrentCompilationTaskCount :: inline (self: *MTLDevice) -> NSUInteger {
        sel := sel_registerName2("maximumConcurrentCompilationTaskCount");
        return xx (cast((*MTLDevice, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLTimestamp :: u64;

MTLFence :: struct #type_info_none {
    device :: inline (self: *MTLFence) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLFence, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLFence) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLFence, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLFence, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLFence, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLResourceStatePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    sampleBuffer :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("sampleBuffer");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel);
    }
    setSampleBuffer :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        sel := sel_registerName2("setSampleBuffer:");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector, *MTLCounterSampleBuffer) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer);
    }

    startOfEncoderSampleIndex :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfEncoderSampleIndex");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfEncoderSampleIndex :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfEncoderSampleIndex:");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfEncoderSampleIndex");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfEncoderSampleIndex :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfEncoderSampleIndex:");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfEncoderSampleIndex);
    }
}

MTLResourceStatePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLResourceStatePassSampleBufferAttachmentDescriptorArray, Selector, *MTLResourceStatePassSampleBufferAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLResourceStatePassDescriptor :: struct #type_info_none {
    resourceStatePassDescriptor :: inline () -> *MTLResourceStatePassDescriptor {
        class := objc_getClass("MTLResourceStatePassDescriptor");
        sel := sel_registerName2("resourceStatePassDescriptor");
        return xx (cast((Class, Selector) -> *MTLResourceStatePassDescriptor #c_call)objc_msgSend)(class, sel);
    }

    sampleBufferAttachments :: inline (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray {
        sel := sel_registerName2("sampleBufferAttachments");
        return xx (cast((*MTLResourceStatePassDescriptor, Selector) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
}

MTLSparseTextureMappingMode :: enum NSUInteger {
    Map   :: 0;
    Unmap :: 1;
}

MTLMapIndirectArguments :: struct #type_info_none {
    regionOriginX:    u32;
    regionOriginY:    u32;
    regionOriginZ:    u32;
    regionSizeWidth:  u32;
    regionSizeHeight: u32;
    regionSizeDepth:  u32;
    mipMapLevel:      u32;
    sliceId:          u32;
}

MTLResourceStateCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    updateTextureMappings :: inline (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> void {
        sel := sel_registerName2("updateTextureMappings:mode:regions:mipLevels:slices:numRegions:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLTexture, MTLSparseTextureMappingMode, *MTLRegion, *NSUInteger, *NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, mode, regions, mipLevels, slices, numRegions);
    }

    updateTextureMapping :: inline (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        sel := sel_registerName2("updateTextureMapping:mode:region:mipLevel:slice:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLTexture, MTLSparseTextureMappingMode, MTLRegion, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, mode, region, mipLevel, slice);
    }

    updateTextureMapping :: inline (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("updateTextureMapping:mode:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLTexture, MTLSparseTextureMappingMode, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, mode, indirectBuffer, indirectBufferOffset);
    }

    updateFence :: inline (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("updateFence:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    waitForFence :: inline (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("waitForFence:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    moveTextureMappingsFromTexture :: inline (self: *MTLResourceStateCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        sel := sel_registerName2("moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:");
        return xx (cast((*MTLResourceStateCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }
}

MTLClearColor :: struct #type_info_none {
    red:   float64;
    green: float64;
    blue:  float64;
    alpha: float64;
}

MTLLoadAction :: enum NSUInteger {
    DontCare :: 0;
    Load     :: 1;
    Clear    :: 2;
}

MTLStoreAction :: enum NSUInteger {
    DontCare                   :: 0;
    Store                      :: 1;
    MultisampleResolve         :: 2;
    StoreAndMultisampleResolve :: 3;
    Unknown                    :: 4;
    CustomSampleDepthStore     :: 5;
}

MTLStoreActionOptions :: NSUInteger;
MTLStoreActionOption :: enum MTLStoreActionOptions {
    None                  :: 0;
    CustomSamplePositions :: 1;
}

MTLVisibilityResultType :: enum NSInteger {
    Reset      :: 0;

    Accumulate :: 1;
}

MTLRenderPassAttachmentDescriptor :: struct #type_info_none {
    texture :: inline (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        sel := sel_registerName2("texture");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }
    setTexture :: inline (self: *MTLRenderPassAttachmentDescriptor, texture: *MTLTexture) -> void {
        sel := sel_registerName2("setTexture:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    level :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("level");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setLevel :: inline (self: *MTLRenderPassAttachmentDescriptor, level: NSUInteger) -> void {
        sel := sel_registerName2("setLevel:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, level);
    }

    slice :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("slice");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSlice :: inline (self: *MTLRenderPassAttachmentDescriptor, slice: NSUInteger) -> void {
        sel := sel_registerName2("setSlice:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, slice);
    }

    depthPlane :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("depthPlane");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setDepthPlane :: inline (self: *MTLRenderPassAttachmentDescriptor, depthPlane: NSUInteger) -> void {
        sel := sel_registerName2("setDepthPlane:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, depthPlane);
    }

    resolveTexture :: inline (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        sel := sel_registerName2("resolveTexture");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }
    setResolveTexture :: inline (self: *MTLRenderPassAttachmentDescriptor, resolveTexture: *MTLTexture) -> void {
        sel := sel_registerName2("setResolveTexture:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, resolveTexture);
    }

    resolveLevel :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("resolveLevel");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setResolveLevel :: inline (self: *MTLRenderPassAttachmentDescriptor, resolveLevel: NSUInteger) -> void {
        sel := sel_registerName2("setResolveLevel:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resolveLevel);
    }

    resolveSlice :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("resolveSlice");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setResolveSlice :: inline (self: *MTLRenderPassAttachmentDescriptor, resolveSlice: NSUInteger) -> void {
        sel := sel_registerName2("setResolveSlice:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resolveSlice);
    }

    resolveDepthPlane :: inline (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("resolveDepthPlane");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setResolveDepthPlane :: inline (self: *MTLRenderPassAttachmentDescriptor, resolveDepthPlane: NSUInteger) -> void {
        sel := sel_registerName2("setResolveDepthPlane:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resolveDepthPlane);
    }

    loadAction :: inline (self: *MTLRenderPassAttachmentDescriptor) -> MTLLoadAction {
        sel := sel_registerName2("loadAction");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> MTLLoadAction #c_call)objc_msgSend)(self, sel);
    }
    setLoadAction :: inline (self: *MTLRenderPassAttachmentDescriptor, loadAction: MTLLoadAction) -> void {
        sel := sel_registerName2("setLoadAction:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, MTLLoadAction) -> void #c_call)objc_msgSend)(self, sel, loadAction);
    }

    storeAction :: inline (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreAction {
        sel := sel_registerName2("storeAction");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> MTLStoreAction #c_call)objc_msgSend)(self, sel);
    }
    setStoreAction :: inline (self: *MTLRenderPassAttachmentDescriptor, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setStoreAction:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    storeActionOptions :: inline (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreActionOptions {
        sel := sel_registerName2("storeActionOptions");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector) -> MTLStoreActionOptions #c_call)objc_msgSend)(self, sel);
    }
    setStoreActionOptions :: inline (self: *MTLRenderPassAttachmentDescriptor, storeActionOptions: MTLStoreActionOptions) -> void {
        sel := sel_registerName2("setStoreActionOptions:");
        return xx (cast((*MTLRenderPassAttachmentDescriptor, Selector, MTLStoreActionOptions) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions);
    }
}

MTLRenderPassColorAttachmentDescriptor :: struct #type_info_none {
    #as using mtlrenderpassattachmentdescriptor: MTLRenderPassAttachmentDescriptor;

    clearColor :: inline (self: *MTLRenderPassColorAttachmentDescriptor) -> MTLClearColor {
        sel := sel_registerName2("clearColor");
        return xx (cast((*MTLRenderPassColorAttachmentDescriptor, Selector) -> MTLClearColor #c_call)objc_msgSend)(self, sel);
    }
    setClearColor :: inline (self: *MTLRenderPassColorAttachmentDescriptor, clearColor: MTLClearColor) -> void {
        sel := sel_registerName2("setClearColor:");
        return xx (cast((*MTLRenderPassColorAttachmentDescriptor, Selector, MTLClearColor) -> void #c_call)objc_msgSend)(self, sel, clearColor);
    }
}

MTLMultisampleDepthResolveFilter :: enum NSUInteger {
    Sample0 :: 0;
    Min     :: 1;
    Max     :: 2;
}

MTLRenderPassDepthAttachmentDescriptor :: struct #type_info_none {
    #as using mtlrenderpassattachmentdescriptor: MTLRenderPassAttachmentDescriptor;

    clearDepth :: inline (self: *MTLRenderPassDepthAttachmentDescriptor) -> float64 {
        sel := sel_registerName2("clearDepth");
        return xx (cast((*MTLRenderPassDepthAttachmentDescriptor, Selector) -> float64 #c_call)objc_msgSend)(self, sel);
    }
    setClearDepth :: inline (self: *MTLRenderPassDepthAttachmentDescriptor, clearDepth: float64) -> void {
        sel := sel_registerName2("setClearDepth:");
        return xx (cast((*MTLRenderPassDepthAttachmentDescriptor, Selector, float64) -> void #c_call)objc_msgSend)(self, sel, clearDepth);
    }

    depthResolveFilter :: inline (self: *MTLRenderPassDepthAttachmentDescriptor) -> MTLMultisampleDepthResolveFilter {
        sel := sel_registerName2("depthResolveFilter");
        return xx (cast((*MTLRenderPassDepthAttachmentDescriptor, Selector) -> MTLMultisampleDepthResolveFilter #c_call)objc_msgSend)(self, sel);
    }
    setDepthResolveFilter :: inline (self: *MTLRenderPassDepthAttachmentDescriptor, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> void {
        sel := sel_registerName2("setDepthResolveFilter:");
        return xx (cast((*MTLRenderPassDepthAttachmentDescriptor, Selector, MTLMultisampleDepthResolveFilter) -> void #c_call)objc_msgSend)(self, sel, depthResolveFilter);
    }
}

MTLMultisampleStencilResolveFilter :: enum NSUInteger {
    Sample0             :: 0;

    DepthResolvedSample :: 1;
}

MTLRenderPassStencilAttachmentDescriptor :: struct #type_info_none {
    #as using mtlrenderpassattachmentdescriptor: MTLRenderPassAttachmentDescriptor;

    clearStencil :: inline (self: *MTLRenderPassStencilAttachmentDescriptor) -> u32 {
        sel := sel_registerName2("clearStencil");
        return xx (cast((*MTLRenderPassStencilAttachmentDescriptor, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }
    setClearStencil :: inline (self: *MTLRenderPassStencilAttachmentDescriptor, clearStencil: u32) -> void {
        sel := sel_registerName2("setClearStencil:");
        return xx (cast((*MTLRenderPassStencilAttachmentDescriptor, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, clearStencil);
    }

    stencilResolveFilter :: inline (self: *MTLRenderPassStencilAttachmentDescriptor) -> MTLMultisampleStencilResolveFilter {
        sel := sel_registerName2("stencilResolveFilter");
        return xx (cast((*MTLRenderPassStencilAttachmentDescriptor, Selector) -> MTLMultisampleStencilResolveFilter #c_call)objc_msgSend)(self, sel);
    }
    setStencilResolveFilter :: inline (self: *MTLRenderPassStencilAttachmentDescriptor, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> void {
        sel := sel_registerName2("setStencilResolveFilter:");
        return xx (cast((*MTLRenderPassStencilAttachmentDescriptor, Selector, MTLMultisampleStencilResolveFilter) -> void #c_call)objc_msgSend)(self, sel, stencilResolveFilter);
    }
}

MTLRenderPassColorAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLRenderPassColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLRenderPassColorAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLRenderPassColorAttachmentDescriptorArray, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLRenderPassColorAttachmentDescriptorArray, Selector, *MTLRenderPassColorAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLRenderPassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    sampleBuffer :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("sampleBuffer");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel);
    }
    setSampleBuffer :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        sel := sel_registerName2("setSampleBuffer:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector, *MTLCounterSampleBuffer) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer);
    }

    startOfVertexSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfVertexSampleIndex");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfVertexSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfVertexSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfVertexSampleIndex:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfVertexSampleIndex);
    }

    endOfVertexSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfVertexSampleIndex");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfVertexSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfVertexSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfVertexSampleIndex:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfVertexSampleIndex);
    }

    startOfFragmentSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfFragmentSampleIndex");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfFragmentSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfFragmentSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfFragmentSampleIndex:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfFragmentSampleIndex);
    }

    endOfFragmentSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfFragmentSampleIndex");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfFragmentSampleIndex :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfFragmentSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfFragmentSampleIndex:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfFragmentSampleIndex);
    }
}

MTLRenderPassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLRenderPassSampleBufferAttachmentDescriptorArray, Selector, *MTLRenderPassSampleBufferAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLRenderPassDescriptor :: struct #type_info_none {
    renderPassDescriptor :: inline () -> *MTLRenderPassDescriptor {
        class := objc_getClass("MTLRenderPassDescriptor");
        sel := sel_registerName2("renderPassDescriptor");
        return xx (cast((Class, Selector) -> *MTLRenderPassDescriptor #c_call)objc_msgSend)(class, sel);
    }

    setSamplePositions :: inline (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        sel := sel_registerName2("setSamplePositions:count:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLSamplePosition, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, positions, count);
    }

    getSamplePositions :: inline (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        sel := sel_registerName2("getSamplePositions:count:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLSamplePosition, NSUInteger) -> NSUInteger #c_call)objc_msgSend)(self, sel, positions, count);
    }

    colorAttachments :: inline (self: *MTLRenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    depthAttachment :: inline (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        sel := sel_registerName2("depthAttachment");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLRenderPassDepthAttachmentDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setDepthAttachment :: inline (self: *MTLRenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        sel := sel_registerName2("setDepthAttachment:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call)objc_msgSend)(self, sel, depthAttachment);
    }

    stencilAttachment :: inline (self: *MTLRenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        sel := sel_registerName2("stencilAttachment");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLRenderPassStencilAttachmentDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setStencilAttachment :: inline (self: *MTLRenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        sel := sel_registerName2("setStencilAttachment:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call)objc_msgSend)(self, sel, stencilAttachment);
    }

    visibilityResultBuffer :: inline (self: *MTLRenderPassDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("visibilityResultBuffer");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setVisibilityResultBuffer :: inline (self: *MTLRenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setVisibilityResultBuffer:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, visibilityResultBuffer);
    }

    renderTargetArrayLength :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetArrayLength");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetArrayLength :: inline (self: *MTLRenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetArrayLength:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetArrayLength);
    }

    imageblockSampleLength :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("imageblockSampleLength");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setImageblockSampleLength :: inline (self: *MTLRenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        sel := sel_registerName2("setImageblockSampleLength:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, imageblockSampleLength);
    }

    threadgroupMemoryLength :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryLength");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setThreadgroupMemoryLength :: inline (self: *MTLRenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, threadgroupMemoryLength);
    }

    tileWidth :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("tileWidth");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTileWidth :: inline (self: *MTLRenderPassDescriptor, tileWidth: NSUInteger) -> void {
        sel := sel_registerName2("setTileWidth:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, tileWidth);
    }

    tileHeight :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("tileHeight");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTileHeight :: inline (self: *MTLRenderPassDescriptor, tileHeight: NSUInteger) -> void {
        sel := sel_registerName2("setTileHeight:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, tileHeight);
    }

    defaultRasterSampleCount :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("defaultRasterSampleCount");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setDefaultRasterSampleCount :: inline (self: *MTLRenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setDefaultRasterSampleCount:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, defaultRasterSampleCount);
    }

    renderTargetWidth :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetWidth");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetWidth :: inline (self: *MTLRenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetWidth:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetWidth);
    }

    renderTargetHeight :: inline (self: *MTLRenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetHeight");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetHeight :: inline (self: *MTLRenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetHeight:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetHeight);
    }

    rasterizationRateMap :: inline (self: *MTLRenderPassDescriptor) -> *MTLRasterizationRateMap {
        sel := sel_registerName2("rasterizationRateMap");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLRasterizationRateMap #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationRateMap :: inline (self: *MTLRenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        sel := sel_registerName2("setRasterizationRateMap:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, *MTLRasterizationRateMap) -> void #c_call)objc_msgSend)(self, sel, rasterizationRateMap);
    }

    sampleBufferAttachments :: inline (self: *MTLRenderPassDescriptor) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray {
        sel := sel_registerName2("sampleBufferAttachments");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    visibilityResultType :: inline (self: *MTLRenderPassDescriptor) -> MTLVisibilityResultType {
        sel := sel_registerName2("visibilityResultType");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> MTLVisibilityResultType #c_call)objc_msgSend)(self, sel);
    }
    setVisibilityResultType :: inline (self: *MTLRenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        sel := sel_registerName2("setVisibilityResultType:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, MTLVisibilityResultType) -> void #c_call)objc_msgSend)(self, sel, visibilityResultType);
    }

    supportColorAttachmentMapping :: inline (self: *MTLRenderPassDescriptor) -> BOOL {
        sel := sel_registerName2("supportColorAttachmentMapping");
        return xx (cast((*MTLRenderPassDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportColorAttachmentMapping :: inline (self: *MTLRenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        sel := sel_registerName2("setSupportColorAttachmentMapping:");
        return xx (cast((*MTLRenderPassDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportColorAttachmentMapping);
    }
}

MTLBlitPassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    sampleBuffer :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("sampleBuffer");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel);
    }
    setSampleBuffer :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        sel := sel_registerName2("setSampleBuffer:");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector, *MTLCounterSampleBuffer) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer);
    }

    startOfEncoderSampleIndex :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfEncoderSampleIndex");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfEncoderSampleIndex :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfEncoderSampleIndex:");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfEncoderSampleIndex");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfEncoderSampleIndex :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfEncoderSampleIndex:");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfEncoderSampleIndex);
    }
}

MTLBlitPassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLBlitPassSampleBufferAttachmentDescriptorArray, Selector, *MTLBlitPassSampleBufferAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLBlitPassDescriptor :: struct #type_info_none {
    blitPassDescriptor :: inline () -> *MTLBlitPassDescriptor {
        class := objc_getClass("MTLBlitPassDescriptor");
        sel := sel_registerName2("blitPassDescriptor");
        return xx (cast((Class, Selector) -> *MTLBlitPassDescriptor #c_call)objc_msgSend)(class, sel);
    }

    sampleBufferAttachments :: inline (self: *MTLBlitPassDescriptor) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray {
        sel := sel_registerName2("sampleBufferAttachments");
        return xx (cast((*MTLBlitPassDescriptor, Selector) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
}

MTLBlitOption :: NSUInteger;
MTLBlitOption_1 :: enum MTLBlitOption {
    None                    :: 0;
    DepthFromDepthStencil   :: 1;
    StencilFromDepthStencil :: 2;
    RowLinearPVRTC          :: 4;
}

MTLBlitCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    synchronizeResource :: inline (self: *MTLBlitCommandEncoder, resource: *MTLResource_1) -> void {
        sel := sel_registerName2("synchronizeResource:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLResource_1) -> void #c_call)objc_msgSend)(self, sel, resource);
    }

    synchronizeTexture :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        sel := sel_registerName2("synchronizeTexture:slice:level:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level);
    }

    copyFromTexture :: inline (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer :: inline (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer :: inline (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLBlitOption) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

    copyFromTexture :: inline (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

    copyFromTexture :: inline (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLBlitOption) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

    generateMipmapsForTexture :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("generateMipmapsForTexture:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    fillBuffer :: inline (self: *MTLBlitCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        sel := sel_registerName2("fillBuffer:range:value:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLBuffer, NSRange, u8) -> void #c_call)objc_msgSend)(self, sel, buffer, range, value);
    }

    copyFromTexture :: inline (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, *MTLTexture, NSUInteger, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

    copyFromTexture :: inline (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        sel := sel_registerName2("copyFromTexture:toTexture:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, destinationTexture);
    }

    copyFromBuffer :: inline (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

    updateFence :: inline (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("updateFence:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    waitForFence :: inline (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("waitForFence:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    getTextureAccessCounters :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: BOOL, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("getTextureAccessCounters:region:mipLevel:slice:resetCounters:countersBuffer:countersBufferOffset:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, MTLRegion, NSUInteger, NSUInteger, BOOL, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, region, mipLevel, slice, resetCounters, countersBuffer, countersBufferOffset);
    }

    resetTextureAccessCounters :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        sel := sel_registerName2("resetTextureAccessCounters:region:mipLevel:slice:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, MTLRegion, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, region, mipLevel, slice);
    }

    optimizeContentsForGPUAccess :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("optimizeContentsForGPUAccess:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    optimizeContentsForGPUAccess :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        sel := sel_registerName2("optimizeContentsForGPUAccess:slice:level:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level);
    }

    optimizeContentsForCPUAccess :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("optimizeContentsForCPUAccess:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    optimizeContentsForCPUAccess :: inline (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        sel := sel_registerName2("optimizeContentsForCPUAccess:slice:level:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level);
    }

    resetCommandsInBuffer :: inline (self: *MTLBlitCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("resetCommandsInBuffer:withRange:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffer, range);
    }

    copyIndirectCommandBuffer :: inline (self: *MTLBlitCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        sel := sel_registerName2("copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange, *MTLIndirectCommandBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, source, sourceRange, destination, destinationIndex);
    }

    optimizeIndirectCommandBuffer :: inline (self: *MTLBlitCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("optimizeIndirectCommandBuffer:withRange:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, range);
    }

    sampleCountersInBuffer :: inline (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        sel := sel_registerName2("sampleCountersInBuffer:atSampleIndex:withBarrier:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLCounterSampleBuffer, NSUInteger, BOOL) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer, sampleIndex, barrier);
    }

    resolveCounters :: inline (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> void {
        sel := sel_registerName2("resolveCounters:inRange:destinationBuffer:destinationOffset:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLCounterSampleBuffer, NSRange, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer, range, destinationBuffer, destinationOffset);
    }

    copyFromTensor :: inline (self: *MTLBlitCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        sel := sel_registerName2("copyFromTensor:sourceOrigin:sourceDimensions:toTensor:destinationOrigin:destinationDimensions:");
        return xx (cast((*MTLBlitCommandEncoder, Selector, *MTLTensor, *MTLTensorExtents, *MTLTensorExtents, *MTLTensor, *MTLTensorExtents, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }
}

MTLCommandBufferStatus :: enum NSUInteger {
    NotEnqueued :: 0;
    Enqueued    :: 1;
    Committed   :: 2;
    Scheduled   :: 3;
    Completed   :: 4;
    Error       :: 5;
}

MTLCommandBufferError :: enum NSUInteger {
    None            :: 0;
    Internal        :: 1;
    Timeout         :: 2;
    PageFault       :: 3;
    Blacklisted     :: 4;
    AccessRevoked   :: 4;
    NotPermitted    :: 7;
    OutOfMemory     :: 8;
    InvalidResource :: 9;
    Memoryless      :: 10;
    DeviceRemoved   :: 11;
    StackOverflow   :: 12;
}

MTLCommandBufferErrorOption :: NSUInteger;
MTLCommandBufferErrorOption_1 :: enum MTLCommandBufferErrorOption {
    None                   :: 0;
    EncoderExecutionStatus :: 1;
}

MTLCommandEncoderErrorState :: enum NSInteger {
    Unknown   :: 0;
    Completed :: 1;
    Affected  :: 2;
    Pending   :: 3;
    Faulted   :: 4;
}

MTLCommandBufferDescriptor :: struct #type_info_none {
    retainedReferences :: inline (self: *MTLCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("retainedReferences");
        return xx (cast((*MTLCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setRetainedReferences :: inline (self: *MTLCommandBufferDescriptor, retainedReferences: BOOL) -> void {
        sel := sel_registerName2("setRetainedReferences:");
        return xx (cast((*MTLCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, retainedReferences);
    }

    errorOptions :: inline (self: *MTLCommandBufferDescriptor) -> MTLCommandBufferErrorOption {
        sel := sel_registerName2("errorOptions");
        return xx (cast((*MTLCommandBufferDescriptor, Selector) -> MTLCommandBufferErrorOption #c_call)objc_msgSend)(self, sel);
    }
    setErrorOptions :: inline (self: *MTLCommandBufferDescriptor, errorOptions: MTLCommandBufferErrorOption) -> void {
        sel := sel_registerName2("setErrorOptions:");
        return xx (cast((*MTLCommandBufferDescriptor, Selector, MTLCommandBufferErrorOption) -> void #c_call)objc_msgSend)(self, sel, errorOptions);
    }

    logState :: inline (self: *MTLCommandBufferDescriptor) -> *MTLLogState {
        sel := sel_registerName2("logState");
        return xx (cast((*MTLCommandBufferDescriptor, Selector) -> *MTLLogState #c_call)objc_msgSend)(self, sel);
    }
    setLogState :: inline (self: *MTLCommandBufferDescriptor, logState: *MTLLogState) -> void {
        sel := sel_registerName2("setLogState:");
        return xx (cast((*MTLCommandBufferDescriptor, Selector, *MTLLogState) -> void #c_call)objc_msgSend)(self, sel, logState);
    }
}

MTLCommandBufferEncoderInfo :: struct #type_info_none {
    label :: inline (self: *MTLCommandBufferEncoderInfo) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCommandBufferEncoderInfo, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    debugSignposts :: inline (self: *MTLCommandBufferEncoderInfo) -> *NSArray(*NSString) {
        sel := sel_registerName2("debugSignposts");
        return xx (cast((*MTLCommandBufferEncoderInfo, Selector) -> *NSArray(*NSString) #c_call)objc_msgSend)(self, sel);
    }

    errorState :: inline (self: *MTLCommandBufferEncoderInfo) -> MTLCommandEncoderErrorState {
        sel := sel_registerName2("errorState");
        return xx (cast((*MTLCommandBufferEncoderInfo, Selector) -> MTLCommandEncoderErrorState #c_call)objc_msgSend)(self, sel);
    }
}

MTLCommandBufferHandler :: Block;

MTLDispatchType :: enum NSUInteger {
    Serial     :: 0;
    Concurrent :: 1;
}

MTLCommandBuffer :: struct #type_info_none {
    enqueue :: inline (self: *MTLCommandBuffer) -> void {
        sel := sel_registerName2("enqueue");
        return xx (cast((*MTLCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    commit :: inline (self: *MTLCommandBuffer) -> void {
        sel := sel_registerName2("commit");
        return xx (cast((*MTLCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    addScheduledHandler :: inline (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        sel := sel_registerName2("addScheduledHandler:");
        return xx (cast((*MTLCommandBuffer, Selector, MTLCommandBufferHandler) -> void #c_call)objc_msgSend)(self, sel, block);
    }

    presentDrawable :: inline (self: *MTLCommandBuffer, drawable: *MTLDrawable) -> void {
        sel := sel_registerName2("presentDrawable:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLDrawable) -> void #c_call)objc_msgSend)(self, sel, drawable);
    }

    presentDrawable :: inline (self: *MTLCommandBuffer, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        sel := sel_registerName2("presentDrawable:atTime:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLDrawable, CFTimeInterval) -> void #c_call)objc_msgSend)(self, sel, drawable, presentationTime);
    }

    presentDrawable_afterMinimumDuration :: inline (self: *MTLCommandBuffer, drawable: *MTLDrawable, duration: CFTimeInterval) -> void {
        sel := sel_registerName2("presentDrawable:afterMinimumDuration:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLDrawable, CFTimeInterval) -> void #c_call)objc_msgSend)(self, sel, drawable, duration);
    }

    waitUntilScheduled :: inline (self: *MTLCommandBuffer) -> void {
        sel := sel_registerName2("waitUntilScheduled");
        return xx (cast((*MTLCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    addCompletedHandler :: inline (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        sel := sel_registerName2("addCompletedHandler:");
        return xx (cast((*MTLCommandBuffer, Selector, MTLCommandBufferHandler) -> void #c_call)objc_msgSend)(self, sel, block);
    }

    waitUntilCompleted :: inline (self: *MTLCommandBuffer) -> void {
        sel := sel_registerName2("waitUntilCompleted");
        return xx (cast((*MTLCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    blitCommandEncoder :: inline (self: *MTLCommandBuffer) -> *MTLBlitCommandEncoder {
        sel := sel_registerName2("blitCommandEncoder");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLBlitCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    renderCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder {
        sel := sel_registerName2("renderCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder #c_call)objc_msgSend)(self, sel, renderPassDescriptor);
    }

    computeCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder {
        sel := sel_registerName2("computeCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder #c_call)objc_msgSend)(self, sel, computePassDescriptor);
    }

    blitCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder {
        sel := sel_registerName2("blitCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder #c_call)objc_msgSend)(self, sel, blitPassDescriptor);
    }

    computeCommandEncoder :: inline (self: *MTLCommandBuffer) -> *MTLComputeCommandEncoder {
        sel := sel_registerName2("computeCommandEncoder");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLComputeCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    computeCommandEncoderWithDispatchType :: inline (self: *MTLCommandBuffer, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder {
        sel := sel_registerName2("computeCommandEncoderWithDispatchType:");
        return xx (cast((*MTLCommandBuffer, Selector, MTLDispatchType) -> *MTLComputeCommandEncoder #c_call)objc_msgSend)(self, sel, dispatchType);
    }

    encodeWaitForEvent :: inline (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        sel := sel_registerName2("encodeWaitForEvent:value:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    encodeSignalEvent :: inline (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        sel := sel_registerName2("encodeSignalEvent:value:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    parallelRenderCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder {
        sel := sel_registerName2("parallelRenderCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder #c_call)objc_msgSend)(self, sel, renderPassDescriptor);
    }

    resourceStateCommandEncoder :: inline (self: *MTLCommandBuffer) -> *MTLResourceStateCommandEncoder {
        sel := sel_registerName2("resourceStateCommandEncoder");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLResourceStateCommandEncoder #c_call)objc_msgSend)(self, sel);
    }
    resourceStateCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, resourceStatePassDescriptor: *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder {
        sel := sel_registerName2("resourceStateCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder #c_call)objc_msgSend)(self, sel, resourceStatePassDescriptor);
    }

    accelerationStructureCommandEncoder :: inline (self: *MTLCommandBuffer) -> *MTLAccelerationStructureCommandEncoder {
        sel := sel_registerName2("accelerationStructureCommandEncoder");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLAccelerationStructureCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    accelerationStructureCommandEncoderWithDescriptor :: inline (self: *MTLCommandBuffer, descriptor: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder {
        sel := sel_registerName2("accelerationStructureCommandEncoderWithDescriptor:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder #c_call)objc_msgSend)(self, sel, descriptor);
    }

    pushDebugGroup :: inline (self: *MTLCommandBuffer, _string: *NSString) -> void {
        sel := sel_registerName2("pushDebugGroup:");
        return xx (cast((*MTLCommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    popDebugGroup :: inline (self: *MTLCommandBuffer) -> void {
        sel := sel_registerName2("popDebugGroup");
        return xx (cast((*MTLCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    useResidencySet :: inline (self: *MTLCommandBuffer, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("useResidencySet:");
        return xx (cast((*MTLCommandBuffer, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    useResidencySets :: inline (self: *MTLCommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("useResidencySets:count:");
        return xx (cast((*MTLCommandBuffer, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    device :: inline (self: *MTLCommandBuffer) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    commandQueue :: inline (self: *MTLCommandBuffer) -> *MTLCommandQueue {
        sel := sel_registerName2("commandQueue");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLCommandQueue #c_call)objc_msgSend)(self, sel);
    }

    retainedReferences :: inline (self: *MTLCommandBuffer) -> BOOL {
        sel := sel_registerName2("retainedReferences");
        return xx (cast((*MTLCommandBuffer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    errorOptions :: inline (self: *MTLCommandBuffer) -> MTLCommandBufferErrorOption {
        sel := sel_registerName2("errorOptions");
        return xx (cast((*MTLCommandBuffer, Selector) -> MTLCommandBufferErrorOption #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLCommandBuffer) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCommandBuffer, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLCommandBuffer, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLCommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    kernelStartTime :: inline (self: *MTLCommandBuffer) -> CFTimeInterval {
        sel := sel_registerName2("kernelStartTime");
        return xx (cast((*MTLCommandBuffer, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }
    kernelEndTime :: inline (self: *MTLCommandBuffer) -> CFTimeInterval {
        sel := sel_registerName2("kernelEndTime");
        return xx (cast((*MTLCommandBuffer, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }

    logs :: inline (self: *MTLCommandBuffer) -> *MTLLogContainer {
        sel := sel_registerName2("logs");
        return xx (cast((*MTLCommandBuffer, Selector) -> *MTLLogContainer #c_call)objc_msgSend)(self, sel);
    }

    GPUStartTime :: inline (self: *MTLCommandBuffer) -> CFTimeInterval #no_context {
        sel := sel_registerName2("GPUStartTime");
        return xx (cast((*MTLCommandBuffer, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }

    GPUEndTime :: inline (self: *MTLCommandBuffer) -> CFTimeInterval #no_context {
        sel := sel_registerName2("GPUEndTime");
        return xx (cast((*MTLCommandBuffer, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }

    status :: inline (self: *MTLCommandBuffer) -> MTLCommandBufferStatus {
        sel := sel_registerName2("status");
        return xx (cast((*MTLCommandBuffer, Selector) -> MTLCommandBufferStatus #c_call)objc_msgSend)(self, sel);
    }

    error :: inline (self: *MTLCommandBuffer) -> *NSError {
        sel := sel_registerName2("error");
        return xx (cast((*MTLCommandBuffer, Selector) -> *NSError #c_call)objc_msgSend)(self, sel);
    }
}

MTLComputePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    sampleBuffer :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("sampleBuffer");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel);
    }
    setSampleBuffer :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        sel := sel_registerName2("setSampleBuffer:");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector, *MTLCounterSampleBuffer) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer);
    }

    startOfEncoderSampleIndex :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfEncoderSampleIndex");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfEncoderSampleIndex :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfEncoderSampleIndex:");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfEncoderSampleIndex");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfEncoderSampleIndex :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfEncoderSampleIndex:");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfEncoderSampleIndex);
    }
}

MTLComputePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLComputePassSampleBufferAttachmentDescriptorArray, Selector, *MTLComputePassSampleBufferAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLComputePassDescriptor :: struct #type_info_none {
    computePassDescriptor :: inline () -> *MTLComputePassDescriptor {
        class := objc_getClass("MTLComputePassDescriptor");
        sel := sel_registerName2("computePassDescriptor");
        return xx (cast((Class, Selector) -> *MTLComputePassDescriptor #c_call)objc_msgSend)(class, sel);
    }

    dispatchType :: inline (self: *MTLComputePassDescriptor) -> MTLDispatchType {
        sel := sel_registerName2("dispatchType");
        return xx (cast((*MTLComputePassDescriptor, Selector) -> MTLDispatchType #c_call)objc_msgSend)(self, sel);
    }
    setDispatchType :: inline (self: *MTLComputePassDescriptor, dispatchType: MTLDispatchType) -> void {
        sel := sel_registerName2("setDispatchType:");
        return xx (cast((*MTLComputePassDescriptor, Selector, MTLDispatchType) -> void #c_call)objc_msgSend)(self, sel, dispatchType);
    }

    sampleBufferAttachments :: inline (self: *MTLComputePassDescriptor) -> *MTLComputePassSampleBufferAttachmentDescriptorArray {
        sel := sel_registerName2("sampleBufferAttachments");
        return xx (cast((*MTLComputePassDescriptor, Selector) -> *MTLComputePassSampleBufferAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
}

MTLDispatchThreadgroupsIndirectArguments :: struct #type_info_none {
    threadgroupsPerGrid: [3] u32;
}

MTLDispatchThreadsIndirectArguments :: struct #type_info_none {
    threadsPerGrid:        [3] u32;
    threadsPerThreadgroup: [3] u32;
}

MTLStageInRegionIndirectArguments :: struct #type_info_none {
    stageInOrigin: [3] u32;
    stageInSize:   [3] u32;
}

MTLComputeCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    setComputePipelineState :: inline (self: *MTLComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        sel := sel_registerName2("setComputePipelineState:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLComputePipelineState) -> void #c_call)objc_msgSend)(self, sel, state);
    }

    setBytes :: inline (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBytes:length:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setBuffer :: inline (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBuffer:offset:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setBufferOffset :: inline (self: *MTLComputeCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBufferOffset:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setBuffers :: inline (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setBuffers:offsets:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setBuffer :: inline (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBuffer:offset:attributeStride:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, stride, index);
    }

    setBuffers :: inline (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setBuffers:offsets:attributeStrides:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLBuffer, *NSUInteger, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, strides, range);
    }

    setBufferOffset :: inline (self: *MTLComputeCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBufferOffset:attributeStride:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, stride, index);
    }

    setBytes :: inline (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBytes:length:attributeStride:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *void, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, stride, index);
    }

    setVisibleFunctionTable :: inline (self: *MTLComputeCommandEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setVisibleFunctionTable:atBufferIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, visibleFunctionTable, bufferIndex);
    }

    setVisibleFunctionTables :: inline (self: *MTLComputeCommandEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setVisibleFunctionTables:withBufferRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, visibleFunctionTables, range);
    }

    setIntersectionFunctionTable :: inline (self: *MTLComputeCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setIntersectionFunctionTable:atBufferIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLIntersectionFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTable, bufferIndex);
    }

    setIntersectionFunctionTables :: inline (self: *MTLComputeCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setIntersectionFunctionTables:withBufferRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLIntersectionFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTables, range);
    }

    setAccelerationStructure :: inline (self: *MTLComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setAccelerationStructure:atBufferIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLAccelerationStructure, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, bufferIndex);
    }

    setTexture :: inline (self: *MTLComputeCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setTexture:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setTextures :: inline (self: *MTLComputeCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setTextures:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setSamplerState :: inline (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setSamplerState:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setSamplerStates :: inline (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setSamplerStates:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setSamplerState :: inline (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setSamplerStates :: inline (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setThreadgroupMemoryLength :: inline (self: *MTLComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }

    setImageblockWidth :: inline (self: *MTLComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        sel := sel_registerName2("setImageblockWidth:height:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, width, height);
    }

    setStageInRegion :: inline (self: *MTLComputeCommandEncoder, region: MTLRegion) -> void {
        sel := sel_registerName2("setStageInRegion:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, MTLRegion) -> void #c_call)objc_msgSend)(self, sel, region);
    }

    setStageInRegionWithIndirectBuffer :: inline (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setStageInRegionWithIndirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer, indirectBufferOffset);
    }

    dispatchThreadgroups :: inline (self: *MTLComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadgroups:threadsPerThreadgroup:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroupsWithIndirectBuffer :: inline (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, MTLSize) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer, indirectBufferOffset, threadsPerThreadgroup);
    }

    dispatchThreads :: inline (self: *MTLComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreads:threadsPerThreadgroup:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerThreadgroup);
    }

    updateFence :: inline (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("updateFence:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    waitForFence :: inline (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("waitForFence:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    useResource :: inline (self: *MTLComputeCommandEncoder, resource: *MTLResource_1, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResource:usage:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLResource_1, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resource, usage);
    }

    useResources :: inline (self: *MTLComputeCommandEncoder, resources: **MTLResource_1, count: NSUInteger, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResources:count:usage:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLResource_1, NSUInteger, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resources, count, usage);
    }

    useHeap :: inline (self: *MTLComputeCommandEncoder, heap: *MTLHeap) -> void {
        sel := sel_registerName2("useHeap:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLHeap) -> void #c_call)objc_msgSend)(self, sel, heap);
    }

    useHeaps :: inline (self: *MTLComputeCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        sel := sel_registerName2("useHeaps:count:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, heaps, count);
    }

    executeCommandsInBuffer :: inline (self: *MTLComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:withRange:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer :: inline (self: *MTLComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

    memoryBarrierWithScope :: inline (self: *MTLComputeCommandEncoder, scope: MTLBarrierScope) -> void {
        sel := sel_registerName2("memoryBarrierWithScope:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, MTLBarrierScope) -> void #c_call)objc_msgSend)(self, sel, scope);
    }

    memoryBarrierWithResources :: inline (self: *MTLComputeCommandEncoder, resources: **MTLResource_1, count: NSUInteger) -> void {
        sel := sel_registerName2("memoryBarrierWithResources:count:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, **MTLResource_1, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resources, count);
    }

    sampleCountersInBuffer :: inline (self: *MTLComputeCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        sel := sel_registerName2("sampleCountersInBuffer:atSampleIndex:withBarrier:");
        return xx (cast((*MTLComputeCommandEncoder, Selector, *MTLCounterSampleBuffer, NSUInteger, BOOL) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer, sampleIndex, barrier);
    }

    dispatchType :: inline (self: *MTLComputeCommandEncoder) -> MTLDispatchType {
        sel := sel_registerName2("dispatchType");
        return xx (cast((*MTLComputeCommandEncoder, Selector) -> MTLDispatchType #c_call)objc_msgSend)(self, sel);
    }
}

MTLCommandQueue :: struct #type_info_none {
    commandBuffer :: inline (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        sel := sel_registerName2("commandBuffer");
        return xx (cast((*MTLCommandQueue, Selector) -> *MTLCommandBuffer #c_call)objc_msgSend)(self, sel);
    }

    commandBufferWithDescriptor :: inline (self: *MTLCommandQueue, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer {
        sel := sel_registerName2("commandBufferWithDescriptor:");
        return xx (cast((*MTLCommandQueue, Selector, *MTLCommandBufferDescriptor) -> *MTLCommandBuffer #c_call)objc_msgSend)(self, sel, descriptor);
    }

    commandBufferWithUnretainedReferences :: inline (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        sel := sel_registerName2("commandBufferWithUnretainedReferences");
        return xx (cast((*MTLCommandQueue, Selector) -> *MTLCommandBuffer #c_call)objc_msgSend)(self, sel);
    }

    insertDebugCaptureBoundary :: inline (self: *MTLCommandQueue) -> void {
        sel := sel_registerName2("insertDebugCaptureBoundary");
        return xx (cast((*MTLCommandQueue, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    addResidencySet :: inline (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("addResidencySet:");
        return xx (cast((*MTLCommandQueue, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    addResidencySets :: inline (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("addResidencySets:count:");
        return xx (cast((*MTLCommandQueue, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    removeResidencySet :: inline (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("removeResidencySet:");
        return xx (cast((*MTLCommandQueue, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    removeResidencySets :: inline (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("removeResidencySets:count:");
        return xx (cast((*MTLCommandQueue, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    label :: inline (self: *MTLCommandQueue) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCommandQueue, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLCommandQueue, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLCommandQueue, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLCommandQueue) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLCommandQueue, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }
}

MTLCommandQueueDescriptor :: struct #type_info_none {
    maxCommandBufferCount :: inline (self: *MTLCommandQueueDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCommandBufferCount");
        return xx (cast((*MTLCommandQueueDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCommandBufferCount :: inline (self: *MTLCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCommandBufferCount:");
        return xx (cast((*MTLCommandQueueDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCommandBufferCount);
    }

    logState :: inline (self: *MTLCommandQueueDescriptor) -> *MTLLogState {
        sel := sel_registerName2("logState");
        return xx (cast((*MTLCommandQueueDescriptor, Selector) -> *MTLLogState #c_call)objc_msgSend)(self, sel);
    }
    setLogState :: inline (self: *MTLCommandQueueDescriptor, logState: *MTLLogState) -> void {
        sel := sel_registerName2("setLogState:");
        return xx (cast((*MTLCommandQueueDescriptor, Selector, *MTLLogState) -> void #c_call)objc_msgSend)(self, sel, logState);
    }
}

NSDeviceCertification :: NSInteger;

NSProcessPerformanceProfile :: NSInteger;

MTLCompareFunction :: enum NSUInteger {
    Never        :: 0;
    Less         :: 1;
    Equal        :: 2;
    LessEqual    :: 3;
    Greater      :: 4;
    NotEqual     :: 5;
    GreaterEqual :: 6;
    Always       :: 7;
}

MTLStencilOperation :: enum NSUInteger {
    Keep           :: 0;
    Zero           :: 1;
    Replace        :: 2;
    IncrementClamp :: 3;
    DecrementClamp :: 4;
    Invert         :: 5;
    IncrementWrap  :: 6;
    DecrementWrap  :: 7;
}

MTLStencilDescriptor :: struct #type_info_none {
    stencilCompareFunction :: inline (self: *MTLStencilDescriptor) -> MTLCompareFunction {
        sel := sel_registerName2("stencilCompareFunction");
        return xx (cast((*MTLStencilDescriptor, Selector) -> MTLCompareFunction #c_call)objc_msgSend)(self, sel);
    }
    setStencilCompareFunction :: inline (self: *MTLStencilDescriptor, stencilCompareFunction: MTLCompareFunction) -> void {
        sel := sel_registerName2("setStencilCompareFunction:");
        return xx (cast((*MTLStencilDescriptor, Selector, MTLCompareFunction) -> void #c_call)objc_msgSend)(self, sel, stencilCompareFunction);
    }

    stencilFailureOperation :: inline (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        sel := sel_registerName2("stencilFailureOperation");
        return xx (cast((*MTLStencilDescriptor, Selector) -> MTLStencilOperation #c_call)objc_msgSend)(self, sel);
    }
    setStencilFailureOperation :: inline (self: *MTLStencilDescriptor, stencilFailureOperation: MTLStencilOperation) -> void {
        sel := sel_registerName2("setStencilFailureOperation:");
        return xx (cast((*MTLStencilDescriptor, Selector, MTLStencilOperation) -> void #c_call)objc_msgSend)(self, sel, stencilFailureOperation);
    }

    depthFailureOperation :: inline (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        sel := sel_registerName2("depthFailureOperation");
        return xx (cast((*MTLStencilDescriptor, Selector) -> MTLStencilOperation #c_call)objc_msgSend)(self, sel);
    }
    setDepthFailureOperation :: inline (self: *MTLStencilDescriptor, depthFailureOperation: MTLStencilOperation) -> void {
        sel := sel_registerName2("setDepthFailureOperation:");
        return xx (cast((*MTLStencilDescriptor, Selector, MTLStencilOperation) -> void #c_call)objc_msgSend)(self, sel, depthFailureOperation);
    }

    depthStencilPassOperation :: inline (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        sel := sel_registerName2("depthStencilPassOperation");
        return xx (cast((*MTLStencilDescriptor, Selector) -> MTLStencilOperation #c_call)objc_msgSend)(self, sel);
    }
    setDepthStencilPassOperation :: inline (self: *MTLStencilDescriptor, depthStencilPassOperation: MTLStencilOperation) -> void {
        sel := sel_registerName2("setDepthStencilPassOperation:");
        return xx (cast((*MTLStencilDescriptor, Selector, MTLStencilOperation) -> void #c_call)objc_msgSend)(self, sel, depthStencilPassOperation);
    }

    readMask :: inline (self: *MTLStencilDescriptor) -> u32 {
        sel := sel_registerName2("readMask");
        return xx (cast((*MTLStencilDescriptor, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }
    setReadMask :: inline (self: *MTLStencilDescriptor, readMask: u32) -> void {
        sel := sel_registerName2("setReadMask:");
        return xx (cast((*MTLStencilDescriptor, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, readMask);
    }
    writeMask :: inline (self: *MTLStencilDescriptor) -> u32 {
        sel := sel_registerName2("writeMask");
        return xx (cast((*MTLStencilDescriptor, Selector) -> u32 #c_call)objc_msgSend)(self, sel);
    }
    setWriteMask :: inline (self: *MTLStencilDescriptor, writeMask: u32) -> void {
        sel := sel_registerName2("setWriteMask:");
        return xx (cast((*MTLStencilDescriptor, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, writeMask);
    }
}

MTLDepthStencilDescriptor :: struct #type_info_none {
    depthCompareFunction :: inline (self: *MTLDepthStencilDescriptor) -> MTLCompareFunction {
        sel := sel_registerName2("depthCompareFunction");
        return xx (cast((*MTLDepthStencilDescriptor, Selector) -> MTLCompareFunction #c_call)objc_msgSend)(self, sel);
    }
    setDepthCompareFunction :: inline (self: *MTLDepthStencilDescriptor, depthCompareFunction: MTLCompareFunction) -> void {
        sel := sel_registerName2("setDepthCompareFunction:");
        return xx (cast((*MTLDepthStencilDescriptor, Selector, MTLCompareFunction) -> void #c_call)objc_msgSend)(self, sel, depthCompareFunction);
    }

    isDepthWriteEnabled :: inline (self: *MTLDepthStencilDescriptor) -> BOOL {
        sel := sel_registerName2("isDepthWriteEnabled");
        return xx (cast((*MTLDepthStencilDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setDepthWriteEnabled :: inline (self: *MTLDepthStencilDescriptor, depthWriteEnabled: BOOL) -> void {
        sel := sel_registerName2("setDepthWriteEnabled:");
        return xx (cast((*MTLDepthStencilDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, depthWriteEnabled);
    }

    frontFaceStencil :: inline (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        sel := sel_registerName2("frontFaceStencil");
        return xx (cast((*MTLDepthStencilDescriptor, Selector) -> *MTLStencilDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFrontFaceStencil :: inline (self: *MTLDepthStencilDescriptor, frontFaceStencil: *MTLStencilDescriptor) -> void {
        sel := sel_registerName2("setFrontFaceStencil:");
        return xx (cast((*MTLDepthStencilDescriptor, Selector, *MTLStencilDescriptor) -> void #c_call)objc_msgSend)(self, sel, frontFaceStencil);
    }
    backFaceStencil :: inline (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        sel := sel_registerName2("backFaceStencil");
        return xx (cast((*MTLDepthStencilDescriptor, Selector) -> *MTLStencilDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setBackFaceStencil :: inline (self: *MTLDepthStencilDescriptor, backFaceStencil: *MTLStencilDescriptor) -> void {
        sel := sel_registerName2("setBackFaceStencil:");
        return xx (cast((*MTLDepthStencilDescriptor, Selector, *MTLStencilDescriptor) -> void #c_call)objc_msgSend)(self, sel, backFaceStencil);
    }

    label :: inline (self: *MTLDepthStencilDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLDepthStencilDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLDepthStencilDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLDepthStencilDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLDepthStencilState :: struct #type_info_none {
    label :: inline (self: *MTLDepthStencilState) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLDepthStencilState, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLDepthStencilState) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLDepthStencilState, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLDepthStencilState) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLDepthStencilState, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLDrawablePresentedHandler :: Block;

MTLDrawable :: struct #type_info_none {
    present :: inline (self: *MTLDrawable) -> void {
        sel := sel_registerName2("present");
        return xx (cast((*MTLDrawable, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    presentAtTime :: inline (self: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        sel := sel_registerName2("presentAtTime:");
        return xx (cast((*MTLDrawable, Selector, CFTimeInterval) -> void #c_call)objc_msgSend)(self, sel, presentationTime);
    }

    presentAfterMinimumDuration :: inline (self: *MTLDrawable, duration: CFTimeInterval) -> void {
        sel := sel_registerName2("presentAfterMinimumDuration:");
        return xx (cast((*MTLDrawable, Selector, CFTimeInterval) -> void #c_call)objc_msgSend)(self, sel, duration);
    }

    addPresentedHandler :: inline (self: *MTLDrawable, block: MTLDrawablePresentedHandler) -> void {
        sel := sel_registerName2("addPresentedHandler:");
        return xx (cast((*MTLDrawable, Selector, MTLDrawablePresentedHandler) -> void #c_call)objc_msgSend)(self, sel, block);
    }

    presentedTime :: inline (self: *MTLDrawable) -> CFTimeInterval {
        sel := sel_registerName2("presentedTime");
        return xx (cast((*MTLDrawable, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }

    drawableID :: inline (self: *MTLDrawable) -> NSUInteger {
        sel := sel_registerName2("drawableID");
        return xx (cast((*MTLDrawable, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLVertexFormat :: enum NSUInteger {
    Invalid               :: 0;

    UChar2                :: 1;
    UChar3                :: 2;
    UChar4                :: 3;

    Char2                 :: 4;
    Char3                 :: 5;
    Char4                 :: 6;

    UChar2Normalized      :: 7;
    UChar3Normalized      :: 8;
    UChar4Normalized      :: 9;

    Char2Normalized       :: 10;
    Char3Normalized       :: 11;
    Char4Normalized       :: 12;

    UShort2               :: 13;
    UShort3               :: 14;
    UShort4               :: 15;

    Short2                :: 16;
    Short3                :: 17;
    Short4                :: 18;

    UShort2Normalized     :: 19;
    UShort3Normalized     :: 20;
    UShort4Normalized     :: 21;

    Short2Normalized      :: 22;
    Short3Normalized      :: 23;
    Short4Normalized      :: 24;

    Half2                 :: 25;
    Half3                 :: 26;
    Half4                 :: 27;

    Float                 :: 28;
    Float2                :: 29;
    Float3                :: 30;
    Float4                :: 31;

    Int                   :: 32;
    Int2                  :: 33;
    Int3                  :: 34;
    Int4                  :: 35;

    UInt                  :: 36;
    UInt2                 :: 37;
    UInt3                 :: 38;
    UInt4                 :: 39;

    Int1010102Normalized  :: 40;
    UInt1010102Normalized :: 41;

    UChar4Normalized_BGRA :: 42;

    UChar                 :: 45;
    Char                  :: 46;
    UCharNormalized       :: 47;
    CharNormalized        :: 48;

    UShort                :: 49;
    Short                 :: 50;
    UShortNormalized      :: 51;
    ShortNormalized       :: 52;

    Half                  :: 53;

    FloatRG11B10          :: 54;
    FloatRGB9E5           :: 55;
}

MTLVertexStepFunction :: enum NSUInteger {
    Constant             :: 0;
    PerVertex            :: 1;
    PerInstance          :: 2;
    PerPatch             :: 3;
    PerPatchControlPoint :: 4;
}

MTLBufferLayoutStrideDynamic: NSUInteger : 18446744073709551615;

MTLVertexBufferLayoutDescriptor :: struct #type_info_none {
    stride :: inline (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        sel := sel_registerName2("stride");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStride :: inline (self: *MTLVertexBufferLayoutDescriptor, stride: NSUInteger) -> void {
        sel := sel_registerName2("setStride:");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, stride);
    }
    stepFunction :: inline (self: *MTLVertexBufferLayoutDescriptor) -> MTLVertexStepFunction {
        sel := sel_registerName2("stepFunction");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector) -> MTLVertexStepFunction #c_call)objc_msgSend)(self, sel);
    }
    setStepFunction :: inline (self: *MTLVertexBufferLayoutDescriptor, stepFunction: MTLVertexStepFunction) -> void {
        sel := sel_registerName2("setStepFunction:");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector, MTLVertexStepFunction) -> void #c_call)objc_msgSend)(self, sel, stepFunction);
    }
    stepRate :: inline (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        sel := sel_registerName2("stepRate");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStepRate :: inline (self: *MTLVertexBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        sel := sel_registerName2("setStepRate:");
        return xx (cast((*MTLVertexBufferLayoutDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, stepRate);
    }
}

MTLVertexBufferLayoutDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLVertexBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLVertexBufferLayoutDescriptorArray, Selector, NSUInteger) -> *MTLVertexBufferLayoutDescriptor #c_call)objc_msgSend)(self, sel, index);
    }
    setObject :: inline (self: *MTLVertexBufferLayoutDescriptorArray, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLVertexBufferLayoutDescriptorArray, Selector, *MTLVertexBufferLayoutDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bufferDesc, index);
    }
}

MTLVertexAttributeDescriptor :: struct #type_info_none {
    format :: inline (self: *MTLVertexAttributeDescriptor) -> MTLVertexFormat {
        sel := sel_registerName2("format");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector) -> MTLVertexFormat #c_call)objc_msgSend)(self, sel);
    }
    setFormat :: inline (self: *MTLVertexAttributeDescriptor, format: MTLVertexFormat) -> void {
        sel := sel_registerName2("setFormat:");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector, MTLVertexFormat) -> void #c_call)objc_msgSend)(self, sel, format);
    }
    offset :: inline (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        sel := sel_registerName2("offset");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setOffset :: inline (self: *MTLVertexAttributeDescriptor, offset: NSUInteger) -> void {
        sel := sel_registerName2("setOffset:");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset);
    }
    bufferIndex :: inline (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        sel := sel_registerName2("bufferIndex");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBufferIndex :: inline (self: *MTLVertexAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setBufferIndex:");
        return xx (cast((*MTLVertexAttributeDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bufferIndex);
    }
}

MTLVertexAttributeDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLVertexAttributeDescriptorArray, index: NSUInteger) -> *MTLVertexAttributeDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLVertexAttributeDescriptorArray, Selector, NSUInteger) -> *MTLVertexAttributeDescriptor #c_call)objc_msgSend)(self, sel, index);
    }
    setObject :: inline (self: *MTLVertexAttributeDescriptorArray, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLVertexAttributeDescriptorArray, Selector, *MTLVertexAttributeDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attributeDesc, index);
    }
}

MTLVertexDescriptor :: struct #type_info_none {
    vertexDescriptor :: inline () -> *MTLVertexDescriptor {
        class := objc_getClass("MTLVertexDescriptor");
        sel := sel_registerName2("vertexDescriptor");
        return xx (cast((Class, Selector) -> *MTLVertexDescriptor #c_call)objc_msgSend)(class, sel);
    }

    reset :: inline (self: *MTLVertexDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLVertexDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    layouts :: inline (self: *MTLVertexDescriptor) -> *MTLVertexBufferLayoutDescriptorArray {
        sel := sel_registerName2("layouts");
        return xx (cast((*MTLVertexDescriptor, Selector) -> *MTLVertexBufferLayoutDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
    attributes :: inline (self: *MTLVertexDescriptor) -> *MTLVertexAttributeDescriptorArray {
        sel := sel_registerName2("attributes");
        return xx (cast((*MTLVertexDescriptor, Selector) -> *MTLVertexAttributeDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
}

MTLAttributeFormat :: enum NSUInteger {
    Invalid               :: 0;

    UChar2                :: 1;
    UChar3                :: 2;
    UChar4                :: 3;

    Char2                 :: 4;
    Char3                 :: 5;
    Char4                 :: 6;

    UChar2Normalized      :: 7;
    UChar3Normalized      :: 8;
    UChar4Normalized      :: 9;

    Char2Normalized       :: 10;
    Char3Normalized       :: 11;
    Char4Normalized       :: 12;

    UShort2               :: 13;
    UShort3               :: 14;
    UShort4               :: 15;

    Short2                :: 16;
    Short3                :: 17;
    Short4                :: 18;

    UShort2Normalized     :: 19;
    UShort3Normalized     :: 20;
    UShort4Normalized     :: 21;

    Short2Normalized      :: 22;
    Short3Normalized      :: 23;
    Short4Normalized      :: 24;

    Half2                 :: 25;
    Half3                 :: 26;
    Half4                 :: 27;

    Float                 :: 28;
    Float2                :: 29;
    Float3                :: 30;
    Float4                :: 31;

    Int                   :: 32;
    Int2                  :: 33;
    Int3                  :: 34;
    Int4                  :: 35;

    UInt                  :: 36;
    UInt2                 :: 37;
    UInt3                 :: 38;
    UInt4                 :: 39;

    Int1010102Normalized  :: 40;
    UInt1010102Normalized :: 41;

    UChar4Normalized_BGRA :: 42;

    UChar                 :: 45;
    Char                  :: 46;
    UCharNormalized       :: 47;
    CharNormalized        :: 48;

    UShort                :: 49;
    Short                 :: 50;
    UShortNormalized      :: 51;
    ShortNormalized       :: 52;

    Half                  :: 53;

    FloatRG11B10          :: 54;
    FloatRGB9E5           :: 55;
}

MTLStepFunction :: enum NSUInteger {
    Constant                     :: 0;

    PerVertex                    :: 1;
    PerInstance                  :: 2;
    PerPatch                     :: 3;
    PerPatchControlPoint         :: 4;

    ThreadPositionInGridX        :: 5;
    ThreadPositionInGridY        :: 6;
    ThreadPositionInGridXIndexed :: 7;
    ThreadPositionInGridYIndexed :: 8;
}

MTLBufferLayoutDescriptor :: struct #type_info_none {
    stride :: inline (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        sel := sel_registerName2("stride");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStride :: inline (self: *MTLBufferLayoutDescriptor, stride: NSUInteger) -> void {
        sel := sel_registerName2("setStride:");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, stride);
    }
    stepFunction :: inline (self: *MTLBufferLayoutDescriptor) -> MTLStepFunction {
        sel := sel_registerName2("stepFunction");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector) -> MTLStepFunction #c_call)objc_msgSend)(self, sel);
    }
    setStepFunction :: inline (self: *MTLBufferLayoutDescriptor, stepFunction: MTLStepFunction) -> void {
        sel := sel_registerName2("setStepFunction:");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector, MTLStepFunction) -> void #c_call)objc_msgSend)(self, sel, stepFunction);
    }
    stepRate :: inline (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        sel := sel_registerName2("stepRate");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStepRate :: inline (self: *MTLBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        sel := sel_registerName2("setStepRate:");
        return xx (cast((*MTLBufferLayoutDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, stepRate);
    }
}

MTLBufferLayoutDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLBufferLayoutDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLBufferLayoutDescriptorArray, Selector, NSUInteger) -> *MTLBufferLayoutDescriptor #c_call)objc_msgSend)(self, sel, index);
    }
    setObject :: inline (self: *MTLBufferLayoutDescriptorArray, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLBufferLayoutDescriptorArray, Selector, *MTLBufferLayoutDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bufferDesc, index);
    }
}

MTLAttributeDescriptor :: struct #type_info_none {
    format :: inline (self: *MTLAttributeDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("format");
        return xx (cast((*MTLAttributeDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setFormat :: inline (self: *MTLAttributeDescriptor, format: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setFormat:");
        return xx (cast((*MTLAttributeDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, format);
    }
    offset :: inline (self: *MTLAttributeDescriptor) -> NSUInteger {
        sel := sel_registerName2("offset");
        return xx (cast((*MTLAttributeDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setOffset :: inline (self: *MTLAttributeDescriptor, offset: NSUInteger) -> void {
        sel := sel_registerName2("setOffset:");
        return xx (cast((*MTLAttributeDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset);
    }
    bufferIndex :: inline (self: *MTLAttributeDescriptor) -> NSUInteger {
        sel := sel_registerName2("bufferIndex");
        return xx (cast((*MTLAttributeDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBufferIndex :: inline (self: *MTLAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setBufferIndex:");
        return xx (cast((*MTLAttributeDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bufferIndex);
    }
}

MTLAttributeDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLAttributeDescriptorArray, index: NSUInteger) -> *MTLAttributeDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLAttributeDescriptorArray, Selector, NSUInteger) -> *MTLAttributeDescriptor #c_call)objc_msgSend)(self, sel, index);
    }
    setObject :: inline (self: *MTLAttributeDescriptorArray, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLAttributeDescriptorArray, Selector, *MTLAttributeDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attributeDesc, index);
    }
}

MTLStageInputOutputDescriptor :: struct #type_info_none {
    stageInputOutputDescriptor :: inline () -> *MTLStageInputOutputDescriptor {
        class := objc_getClass("MTLStageInputOutputDescriptor");
        sel := sel_registerName2("stageInputOutputDescriptor");
        return xx (cast((Class, Selector) -> *MTLStageInputOutputDescriptor #c_call)objc_msgSend)(class, sel);
    }

    reset :: inline (self: *MTLStageInputOutputDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    layouts :: inline (self: *MTLStageInputOutputDescriptor) -> *MTLBufferLayoutDescriptorArray {
        sel := sel_registerName2("layouts");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector) -> *MTLBufferLayoutDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
    attributes :: inline (self: *MTLStageInputOutputDescriptor) -> *MTLAttributeDescriptorArray {
        sel := sel_registerName2("attributes");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector) -> *MTLAttributeDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    indexType :: inline (self: *MTLStageInputOutputDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTLStageInputOutputDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }
    indexBufferIndex :: inline (self: *MTLStageInputOutputDescriptor) -> NSUInteger {
        sel := sel_registerName2("indexBufferIndex");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndexBufferIndex :: inline (self: *MTLStageInputOutputDescriptor, indexBufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setIndexBufferIndex:");
        return xx (cast((*MTLStageInputOutputDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indexBufferIndex);
    }
}

MTLMutability :: enum NSUInteger {
    Default   :: 0;
    Mutable   :: 1;
    Immutable :: 2;
}

MTLShaderValidation :: enum NSInteger {
    Default  :: 0;
    Enabled  :: 1;
    Disabled :: 2;
}

MTLPipelineBufferDescriptor :: struct #type_info_none {
    mutability :: inline (self: *MTLPipelineBufferDescriptor) -> MTLMutability {
        sel := sel_registerName2("mutability");
        return xx (cast((*MTLPipelineBufferDescriptor, Selector) -> MTLMutability #c_call)objc_msgSend)(self, sel);
    }
    setMutability :: inline (self: *MTLPipelineBufferDescriptor, mutability: MTLMutability) -> void {
        sel := sel_registerName2("setMutability:");
        return xx (cast((*MTLPipelineBufferDescriptor, Selector, MTLMutability) -> void #c_call)objc_msgSend)(self, sel, mutability);
    }
}

MTLPipelineBufferDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLPipelineBufferDescriptorArray, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLPipelineBufferDescriptorArray, Selector, NSUInteger) -> *MTLPipelineBufferDescriptor #c_call)objc_msgSend)(self, sel, bufferIndex);
    }

    setObject :: inline (self: *MTLPipelineBufferDescriptorArray, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLPipelineBufferDescriptorArray, Selector, *MTLPipelineBufferDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, bufferIndex);
    }
}

MTLLinkedFunctions :: struct #type_info_none {
    linkedFunctions :: inline () -> *MTLLinkedFunctions {
        class := objc_getClass("MTLLinkedFunctions");
        sel := sel_registerName2("linkedFunctions");
        return xx (cast((Class, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(class, sel);
    }

    functions :: inline (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("functions");
        return xx (cast((*MTLLinkedFunctions, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setFunctions :: inline (self: *MTLLinkedFunctions, functions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setFunctions:");
        return xx (cast((*MTLLinkedFunctions, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, functions);
    }

    binaryFunctions :: inline (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("binaryFunctions");
        return xx (cast((*MTLLinkedFunctions, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryFunctions :: inline (self: *MTLLinkedFunctions, binaryFunctions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setBinaryFunctions:");
        return xx (cast((*MTLLinkedFunctions, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, binaryFunctions);
    }

    groups :: inline (self: *MTLLinkedFunctions) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) {
        sel := sel_registerName2("groups");
        return xx (cast((*MTLLinkedFunctions, Selector) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) #c_call)objc_msgSend)(self, sel);
    }
    setGroups :: inline (self: *MTLLinkedFunctions, groups: *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void {
        sel := sel_registerName2("setGroups:");
        return xx (cast((*MTLLinkedFunctions, Selector, *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void #c_call)objc_msgSend)(self, sel, groups);
    }

    privateFunctions :: inline (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("privateFunctions");
        return xx (cast((*MTLLinkedFunctions, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setPrivateFunctions :: inline (self: *MTLLinkedFunctions, privateFunctions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setPrivateFunctions:");
        return xx (cast((*MTLLinkedFunctions, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, privateFunctions);
    }
}

MTLComputePipelineReflection :: struct #type_info_none {
    bindings :: inline (self: *MTLComputePipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("bindings");
        return xx (cast((*MTLComputePipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    arguments :: inline (self: *MTLComputePipelineReflection) -> *NSArray(*MTLArgument) {
        sel := sel_registerName2("arguments");
        return xx (cast((*MTLComputePipelineReflection, Selector) -> *NSArray(*MTLArgument) #c_call)objc_msgSend)(self, sel);
    }
}

MTLComputePipelineDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTLComputePipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLComputePipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLComputePipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    computeFunction :: inline (self: *MTLComputePipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("computeFunction");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setComputeFunction :: inline (self: *MTLComputePipelineDescriptor, computeFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setComputeFunction:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, computeFunction);
    }

    threadGroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLComputePipelineDescriptor) -> BOOL {
        sel := sel_registerName2("threadGroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setThreadGroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setThreadGroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerThreadgroup :: inline (self: *MTLComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerThreadgroup:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerThreadgroup);
    }

    stageInputDescriptor :: inline (self: *MTLComputePipelineDescriptor) -> *MTLStageInputOutputDescriptor {
        sel := sel_registerName2("stageInputDescriptor");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *MTLStageInputOutputDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setStageInputDescriptor :: inline (self: *MTLComputePipelineDescriptor, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> void {
        sel := sel_registerName2("setStageInputDescriptor:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *MTLStageInputOutputDescriptor) -> void #c_call)objc_msgSend)(self, sel, stageInputDescriptor);
    }

    buffers :: inline (self: *MTLComputePipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("buffers");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    supportIndirectCommandBuffers :: inline (self: *MTLComputePipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTLComputePipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }

    insertLibraries :: inline (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("insertLibraries");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setInsertLibraries :: inline (self: *MTLComputePipelineDescriptor, insertLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setInsertLibraries:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, insertLibraries);
    }

    preloadedLibraries :: inline (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("preloadedLibraries");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setPreloadedLibraries :: inline (self: *MTLComputePipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setPreloadedLibraries:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, preloadedLibraries);
    }

    binaryArchives :: inline (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLComputePipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }

    linkedFunctions :: inline (self: *MTLComputePipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("linkedFunctions");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setLinkedFunctions :: inline (self: *MTLComputePipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setLinkedFunctions:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, linkedFunctions);
    }

    supportAddingBinaryFunctions :: inline (self: *MTLComputePipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportAddingBinaryFunctions");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportAddingBinaryFunctions :: inline (self: *MTLComputePipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        sel := sel_registerName2("setSupportAddingBinaryFunctions:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportAddingBinaryFunctions);
    }

    maxCallStackDepth :: inline (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCallStackDepth");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCallStackDepth :: inline (self: *MTLComputePipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCallStackDepth:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCallStackDepth);
    }

    shaderValidation :: inline (self: *MTLComputePipelineDescriptor) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }
    setShaderValidation :: inline (self: *MTLComputePipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        sel := sel_registerName2("setShaderValidation:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, MTLShaderValidation) -> void #c_call)objc_msgSend)(self, sel, shaderValidation);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTLComputePipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTLComputePipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerThreadgroup :: inline (self: *MTLComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerThreadgroup:");
        return xx (cast((*MTLComputePipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerThreadgroup);
    }
}

MTLComputePipelineState :: struct #type_info_none {
    #as using mtlallocation: MTLAllocation;

    functionHandleWithName :: inline (self: *MTLComputePipelineState, name: *NSString) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithName:");
        return xx (cast((*MTLComputePipelineState, Selector, *NSString) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, name);
    }

    functionHandleWithBinaryFunction :: inline (self: *MTLComputePipelineState, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithBinaryFunction:");
        return xx (cast((*MTLComputePipelineState, Selector, *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function);
    }

    newComputePipelineStateWithBinaryFunctions :: inline (self: *MTLComputePipelineState, additionalBinaryFunctions: *NSArray(*MTL4BinaryFunction), error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithBinaryFunctions:error:");
        return xx (cast((*MTLComputePipelineState, Selector, *NSArray(*MTL4BinaryFunction), **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, additionalBinaryFunctions, error);
    }

    imageblockMemoryLengthForDimensions :: inline (self: *MTLComputePipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        sel := sel_registerName2("imageblockMemoryLengthForDimensions:");
        return xx (cast((*MTLComputePipelineState, Selector, MTLSize) -> NSUInteger #c_call)objc_msgSend)(self, sel, imageblockDimensions);
    }

    functionHandleWithFunction :: inline (self: *MTLComputePipelineState, function: *MTLFunction) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithFunction:");
        return xx (cast((*MTLComputePipelineState, Selector, *MTLFunction) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function);
    }

    newComputePipelineStateWithAdditionalBinaryFunctions :: inline (self: *MTLComputePipelineState, functions: *NSArray(*MTLFunction), error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithAdditionalBinaryFunctions:error:");
        return xx (cast((*MTLComputePipelineState, Selector, *NSArray(*MTLFunction), **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, functions, error);
    }

    newVisibleFunctionTableWithDescriptor :: inline (self: *MTLComputePipelineState, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable {
        sel := sel_registerName2("newVisibleFunctionTableWithDescriptor:");
        return xx (cast((*MTLComputePipelineState, Selector, *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newIntersectionFunctionTableWithDescriptor :: inline (self: *MTLComputePipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable {
        sel := sel_registerName2("newIntersectionFunctionTableWithDescriptor:");
        return xx (cast((*MTLComputePipelineState, Selector, *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable #c_call)objc_msgSend)(self, sel, descriptor);
    }

    label :: inline (self: *MTLComputePipelineState) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLComputePipelineState, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    reflection :: inline (self: *MTLComputePipelineState) -> *MTLComputePipelineReflection {
        sel := sel_registerName2("reflection");
        return xx (cast((*MTLComputePipelineState, Selector) -> *MTLComputePipelineReflection #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLComputePipelineState) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLComputePipelineState, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTLComputePipelineState) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTLComputePipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    threadExecutionWidth :: inline (self: *MTLComputePipelineState) -> NSUInteger {
        sel := sel_registerName2("threadExecutionWidth");
        return xx (cast((*MTLComputePipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    staticThreadgroupMemoryLength :: inline (self: *MTLComputePipelineState) -> NSUInteger {
        sel := sel_registerName2("staticThreadgroupMemoryLength");
        return xx (cast((*MTLComputePipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    supportIndirectCommandBuffers :: inline (self: *MTLComputePipelineState) -> BOOL {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTLComputePipelineState, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLComputePipelineState) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLComputePipelineState, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    shaderValidation :: inline (self: *MTLComputePipelineState) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLComputePipelineState, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTLComputePipelineState) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTLComputePipelineState, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
}

MTLPrimitiveType :: enum NSUInteger {
    Point         :: 0;
    Line          :: 1;
    LineStrip     :: 2;
    Triangle      :: 3;
    TriangleStrip :: 4;
}

MTLVisibilityResultMode :: enum NSUInteger {
    Disabled :: 0;
    Boolean  :: 1;
    Counting :: 2;
}

MTLScissorRect :: struct #type_info_none {
    x:      NSUInteger;
    y:      NSUInteger;
    width:  NSUInteger;
    height: NSUInteger;
}

MTLViewport :: struct #type_info_none {
    originX: float64;
    originY: float64;
    width:   float64;
    height:  float64;
    znear:   float64;
    zfar:    float64;
}

MTLCullMode :: enum NSUInteger {
    None  :: 0;
    Front :: 1;
    Back  :: 2;
}

MTLWinding :: enum NSUInteger {
    Clockwise        :: 0;
    CounterClockwise :: 1;
}

MTLDepthClipMode :: enum NSUInteger {
    Clip  :: 0;
    Clamp :: 1;
}

MTLTriangleFillMode :: enum NSUInteger {
    Fill  :: 0;
    Lines :: 1;
}

MTLDrawPrimitivesIndirectArguments :: struct #type_info_none {
    vertexCount:   u32;
    instanceCount: u32;
    vertexStart:   u32;
    baseInstance:  u32;
}

MTLDrawIndexedPrimitivesIndirectArguments :: struct #type_info_none {
    indexCount:    u32;
    instanceCount: u32;
    indexStart:    u32;
    baseVertex:    s32;
    baseInstance:  u32;
}

MTLVertexAmplificationViewMapping :: struct #type_info_none {
    viewportArrayIndexOffset:     u32;
    renderTargetArrayIndexOffset: u32;
}

MTLDrawPatchIndirectArguments :: struct #type_info_none {
    patchCount:    u32;
    instanceCount: u32;
    patchStart:    u32;
    baseInstance:  u32;
}

MTLQuadTessellationFactorsHalf :: struct #type_info_none {
    edgeTessellationFactor:   [4] u16;
    insideTessellationFactor: [2] u16;
}

MTLTriangleTessellationFactorsHalf :: struct #type_info_none {
    edgeTessellationFactor:   [3] u16;
    insideTessellationFactor: u16;
}

MTLRenderStages :: NSUInteger;
MTLRenderStage :: enum MTLRenderStages {
    Vertex   :: 1;
    Fragment :: 2;
    Tile     :: 4;
    Object   :: 8;
    Mesh     :: 16;
}

MTLRenderCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    setRenderPipelineState :: inline (self: *MTLRenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        sel := sel_registerName2("setRenderPipelineState:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLRenderPipelineState) -> void #c_call)objc_msgSend)(self, sel, pipelineState);
    }

    setVertexBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBytes:length:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setVertexBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBuffer:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setVertexBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBufferOffset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setVertexBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setVertexBuffers:offsets:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setVertexBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBuffer:offset:attributeStride:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, stride, index);
    }

    setVertexBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setVertexBuffers:offsets:attributeStrides:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, strides, range);
    }

    setVertexBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBufferOffset:attributeStride:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, stride, index);
    }

    setVertexBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBytes:length:attributeStride:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, stride, index);
    }

    setVertexTexture :: inline (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexTexture:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setVertexTextures :: inline (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setVertexTextures:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setVertexSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexSamplerState:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setVertexSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setVertexSamplerStates:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setVertexSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setVertexSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setVertexVisibleFunctionTable :: inline (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setVertexVisibleFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionTable, bufferIndex);
    }

    setVertexVisibleFunctionTables :: inline (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setVertexVisibleFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, functionTables, range);
    }

    setVertexIntersectionFunctionTable :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setVertexIntersectionFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLIntersectionFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTable, bufferIndex);
    }

    setVertexIntersectionFunctionTables :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setVertexIntersectionFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLIntersectionFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTables, range);
    }

    setVertexAccelerationStructure :: inline (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setVertexAccelerationStructure:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLAccelerationStructure, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, bufferIndex);
    }

    setViewport :: inline (self: *MTLRenderCommandEncoder, viewport: MTLViewport) -> void {
        sel := sel_registerName2("setViewport:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLViewport) -> void #c_call)objc_msgSend)(self, sel, viewport);
    }

    setViewports :: inline (self: *MTLRenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        sel := sel_registerName2("setViewports:count:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLViewport, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, viewports, count);
    }

    setFrontFacingWinding :: inline (self: *MTLRenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        sel := sel_registerName2("setFrontFacingWinding:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLWinding) -> void #c_call)objc_msgSend)(self, sel, frontFacingWinding);
    }

    setVertexAmplificationCount :: inline (self: *MTLRenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        sel := sel_registerName2("setVertexAmplificationCount:viewMappings:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, *MTLVertexAmplificationViewMapping) -> void #c_call)objc_msgSend)(self, sel, count, viewMappings);
    }

    setCullMode :: inline (self: *MTLRenderCommandEncoder, cullMode: MTLCullMode) -> void {
        sel := sel_registerName2("setCullMode:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLCullMode) -> void #c_call)objc_msgSend)(self, sel, cullMode);
    }

    setDepthClipMode :: inline (self: *MTLRenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        sel := sel_registerName2("setDepthClipMode:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLDepthClipMode) -> void #c_call)objc_msgSend)(self, sel, depthClipMode);
    }

    setDepthBias :: inline (self: *MTLRenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> void {
        sel := sel_registerName2("setDepthBias:slopeScale:clamp:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, float, float, float) -> void #c_call)objc_msgSend)(self, sel, depthBias, slopeScale, clamp);
    }

    setDepthTestMinBound :: inline (self: *MTLRenderCommandEncoder, minBound: float, maxBound: float) -> void {
        sel := sel_registerName2("setDepthTestMinBound:maxBound:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, float, float) -> void #c_call)objc_msgSend)(self, sel, minBound, maxBound);
    }

    setScissorRect :: inline (self: *MTLRenderCommandEncoder, rect: MTLScissorRect) -> void {
        sel := sel_registerName2("setScissorRect:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLScissorRect) -> void #c_call)objc_msgSend)(self, sel, rect);
    }

    setScissorRects :: inline (self: *MTLRenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        sel := sel_registerName2("setScissorRects:count:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLScissorRect, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, scissorRects, count);
    }

    setTriangleFillMode :: inline (self: *MTLRenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        sel := sel_registerName2("setTriangleFillMode:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLTriangleFillMode) -> void #c_call)objc_msgSend)(self, sel, fillMode);
    }

    setFragmentBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentBytes:length:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setFragmentBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentBuffer:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setFragmentBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentBufferOffset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setFragmentBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentBuffers:offsets:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setFragmentTexture :: inline (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentTexture:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setFragmentTextures :: inline (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentTextures:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setFragmentSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentSamplerState:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setFragmentSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentSamplerStates:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setFragmentSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setFragmentSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setFragmentVisibleFunctionTable :: inline (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentVisibleFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionTable, bufferIndex);
    }

    setFragmentVisibleFunctionTables :: inline (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentVisibleFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, functionTables, range);
    }

    setFragmentIntersectionFunctionTable :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentIntersectionFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLIntersectionFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTable, bufferIndex);
    }

    setFragmentIntersectionFunctionTables :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setFragmentIntersectionFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLIntersectionFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTables, range);
    }

    setFragmentAccelerationStructure :: inline (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentAccelerationStructure:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLAccelerationStructure, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, bufferIndex);
    }

    setBlendColorRed :: inline (self: *MTLRenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> void {
        sel := sel_registerName2("setBlendColorRed:green:blue:alpha:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, float, float, float, float) -> void #c_call)objc_msgSend)(self, sel, red, green, blue, alpha);
    }

    setDepthStencilState :: inline (self: *MTLRenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        sel := sel_registerName2("setDepthStencilState:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLDepthStencilState) -> void #c_call)objc_msgSend)(self, sel, depthStencilState);
    }

    setStencilReferenceValue :: inline (self: *MTLRenderCommandEncoder, referenceValue: u32) -> void {
        sel := sel_registerName2("setStencilReferenceValue:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, referenceValue);
    }

    setStencilFrontReferenceValue :: inline (self: *MTLRenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        sel := sel_registerName2("setStencilFrontReferenceValue:backReferenceValue:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, u32, u32) -> void #c_call)objc_msgSend)(self, sel, frontReferenceValue, backReferenceValue);
    }

    setVisibilityResultMode :: inline (self: *MTLRenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        sel := sel_registerName2("setVisibilityResultMode:offset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLVisibilityResultMode, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, mode, offset);
    }

    setColorStoreAction :: inline (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setColorStoreAction:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreAction, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction :: inline (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setDepthStoreAction:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    setStencilStoreAction :: inline (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setStencilStoreAction:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    setColorStoreActionOptions :: inline (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setColorStoreActionOptions:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreActionOptions, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions, colorAttachmentIndex);
    }

    setDepthStoreActionOptions :: inline (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        sel := sel_registerName2("setDepthStoreActionOptions:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreActionOptions) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions);
    }

    setStencilStoreActionOptions :: inline (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        sel := sel_registerName2("setStencilStoreActionOptions:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLStoreActionOptions) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions);
    }

    setObjectBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectBytes:length:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setObjectBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectBuffer:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setObjectBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectBufferOffset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setObjectBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setObjectBuffers:offsets:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setObjectTexture :: inline (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectTexture:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setObjectTextures :: inline (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setObjectTextures:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setObjectSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectSamplerState:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setObjectSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setObjectSamplerStates:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setObjectSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setObjectSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setObjectThreadgroupMemoryLength :: inline (self: *MTLRenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }

    setMeshBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshBytes:length:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setMeshBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshBuffer:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setMeshBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshBufferOffset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setMeshBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setMeshBuffers:offsets:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setMeshTexture :: inline (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshTexture:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setMeshTextures :: inline (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setMeshTextures:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setMeshSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshSamplerState:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setMeshSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setMeshSamplerStates:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setMeshSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setMeshSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    drawMeshThreadgroups :: inline (self: *MTLRenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads :: inline (self: *MTLRenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreadgroupsWithIndirectBuffer :: inline (self: *MTLRenderCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer, indirectBufferOffset, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:instanceCount:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount, instanceCount);
    }

    drawPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount);
    }

    drawIndexedPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount);
    }

    drawIndexedPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset);
    }

    drawPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

    drawIndexedPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, *MTLBuffer, NSUInteger, NSUInteger, NSInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
    }

    drawPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indirectBuffer, indirectBufferOffset);
    }

    drawIndexedPrimitives :: inline (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLPrimitiveType, MTLIndexType, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexType, indexBuffer, indexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    textureBarrier :: inline (self: *MTLRenderCommandEncoder) -> void {
        sel := sel_registerName2("textureBarrier");
        return xx (cast((*MTLRenderCommandEncoder, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    updateFence :: inline (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("updateFence:afterStages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLFence, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, fence, stages);
    }

    waitForFence :: inline (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("waitForFence:beforeStages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLFence, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, fence, stages);
    }

    setTessellationFactorBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        sel := sel_registerName2("setTessellationFactorBuffer:offset:instanceStride:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, instanceStride);
    }

    setTessellationFactorScale :: inline (self: *MTLRenderCommandEncoder, scale: float) -> void {
        sel := sel_registerName2("setTessellationFactorScale:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, float) -> void #c_call)objc_msgSend)(self, sel, scale);
    }

    drawPatches :: inline (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, instanceCount, baseInstance);
    }

    drawPatches :: inline (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("drawPatches:patchIndexBuffer:patchIndexBufferOffset:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    drawIndexedPatches :: inline (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, instanceCount, baseInstance);
    }

    drawIndexedPatches :: inline (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPatches:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    setTileBytes :: inline (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileBytes:length:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *void, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, bytes, length, index);
    }

    setTileBuffer :: inline (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileBuffer:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setTileBufferOffset :: inline (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileBufferOffset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset, index);
    }

    setTileBuffers :: inline (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setTileBuffers:offsets:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setTileTexture :: inline (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileTexture:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setTileTextures :: inline (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setTileTextures:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setTileSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileSamplerState:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setTileSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setTileSamplerStates:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    setTileSamplerState :: inline (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> void {
        sel := sel_registerName2("setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLSamplerState, float, float, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setTileSamplerStates :: inline (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> void {
        sel := sel_registerName2("setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLSamplerState, *float, *float, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setTileVisibleFunctionTable :: inline (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setTileVisibleFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionTable, bufferIndex);
    }

    setTileVisibleFunctionTables :: inline (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setTileVisibleFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, functionTables, range);
    }

    setTileIntersectionFunctionTable :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setTileIntersectionFunctionTable:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLIntersectionFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTable, bufferIndex);
    }

    setTileIntersectionFunctionTables :: inline (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setTileIntersectionFunctionTables:withBufferRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLIntersectionFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTables, range);
    }

    setTileAccelerationStructure :: inline (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setTileAccelerationStructure:atBufferIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLAccelerationStructure, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, bufferIndex);
    }

    dispatchThreadsPerTile :: inline (self: *MTLRenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadsPerTile:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerTile);
    }

    setThreadgroupMemoryLength :: inline (self: *MTLRenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:offset:atIndex:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, offset, index);
    }

    useResource :: inline (self: *MTLRenderCommandEncoder, resource: *MTLResource_1, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResource:usage:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLResource_1, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resource, usage);
    }

    useResources :: inline (self: *MTLRenderCommandEncoder, resources: **MTLResource_1, count: NSUInteger, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResources:count:usage:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLResource_1, NSUInteger, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resources, count, usage);
    }

    useResource :: inline (self: *MTLRenderCommandEncoder, resource: *MTLResource_1, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("useResource:usage:stages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLResource_1, MTLResourceUsage, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, resource, usage, stages);
    }

    useResources :: inline (self: *MTLRenderCommandEncoder, resources: **MTLResource_1, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("useResources:count:usage:stages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLResource_1, NSUInteger, MTLResourceUsage, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, resources, count, usage, stages);
    }

    useHeap :: inline (self: *MTLRenderCommandEncoder, heap: *MTLHeap) -> void {
        sel := sel_registerName2("useHeap:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLHeap) -> void #c_call)objc_msgSend)(self, sel, heap);
    }

    useHeaps :: inline (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        sel := sel_registerName2("useHeaps:count:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, heaps, count);
    }

    useHeap :: inline (self: *MTLRenderCommandEncoder, heap: *MTLHeap, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("useHeap:stages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLHeap, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, heap, stages);
    }

    useHeaps :: inline (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("useHeaps:count:stages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLHeap, NSUInteger, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, heaps, count, stages);
    }

    executeCommandsInBuffer :: inline (self: *MTLRenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:withRange:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer :: inline (self: *MTLRenderCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLIndirectCommandBuffer, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

    memoryBarrierWithScope :: inline (self: *MTLRenderCommandEncoder, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> void {
        sel := sel_registerName2("memoryBarrierWithScope:afterStages:beforeStages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, MTLBarrierScope, MTLRenderStages, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, scope, after, before);
    }

    memoryBarrierWithResources :: inline (self: *MTLRenderCommandEncoder, resources: **MTLResource_1, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> void {
        sel := sel_registerName2("memoryBarrierWithResources:count:afterStages:beforeStages:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, **MTLResource_1, NSUInteger, MTLRenderStages, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, resources, count, after, before);
    }

    sampleCountersInBuffer :: inline (self: *MTLRenderCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        sel := sel_registerName2("sampleCountersInBuffer:atSampleIndex:withBarrier:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLCounterSampleBuffer, NSUInteger, BOOL) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer, sampleIndex, barrier);
    }

    setColorAttachmentMap :: inline (self: *MTLRenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        sel := sel_registerName2("setColorAttachmentMap:");
        return xx (cast((*MTLRenderCommandEncoder, Selector, *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call)objc_msgSend)(self, sel, mapping);
    }

    tileWidth :: inline (self: *MTLRenderCommandEncoder) -> NSUInteger {
        sel := sel_registerName2("tileWidth");
        return xx (cast((*MTLRenderCommandEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    tileHeight :: inline (self: *MTLRenderCommandEncoder) -> NSUInteger {
        sel := sel_registerName2("tileHeight");
        return xx (cast((*MTLRenderCommandEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionHandle :: struct #type_info_none {
    functionType :: inline (self: *MTLFunctionHandle) -> MTLFunctionType {
        sel := sel_registerName2("functionType");
        return xx (cast((*MTLFunctionHandle, Selector) -> MTLFunctionType #c_call)objc_msgSend)(self, sel);
    }
    name :: inline (self: *MTLFunctionHandle) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLFunctionHandle, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    device :: inline (self: *MTLFunctionHandle) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLFunctionHandle, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLFunctionHandle) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLFunctionHandle, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLVisibleFunctionTableDescriptor :: struct #type_info_none {
    visibleFunctionTableDescriptor :: inline () -> *MTLVisibleFunctionTableDescriptor {
        class := objc_getClass("MTLVisibleFunctionTableDescriptor");
        sel := sel_registerName2("visibleFunctionTableDescriptor");
        return xx (cast((Class, Selector) -> *MTLVisibleFunctionTableDescriptor #c_call)objc_msgSend)(class, sel);
    }

    functionCount :: inline (self: *MTLVisibleFunctionTableDescriptor) -> NSUInteger {
        sel := sel_registerName2("functionCount");
        return xx (cast((*MTLVisibleFunctionTableDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setFunctionCount :: inline (self: *MTLVisibleFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        sel := sel_registerName2("setFunctionCount:");
        return xx (cast((*MTLVisibleFunctionTableDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionCount);
    }
}

MTLVisibleFunctionTable :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    setFunction :: inline (self: *MTLVisibleFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> void {
        sel := sel_registerName2("setFunction:atIndex:");
        return xx (cast((*MTLVisibleFunctionTable, Selector, *MTLFunctionHandle, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, function, index);
    }

    setFunctions :: inline (self: *MTLVisibleFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> void {
        sel := sel_registerName2("setFunctions:withRange:");
        return xx (cast((*MTLVisibleFunctionTable, Selector, **MTLFunctionHandle, NSRange) -> void #c_call)objc_msgSend)(self, sel, functions, range);
    }

    gpuResourceID :: inline (self: *MTLVisibleFunctionTable) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLVisibleFunctionTable, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLBlendFactor :: enum NSUInteger {
    Zero                     :: 0;
    One                      :: 1;
    SourceColor              :: 2;
    OneMinusSourceColor      :: 3;
    SourceAlpha              :: 4;
    OneMinusSourceAlpha      :: 5;
    DestinationColor         :: 6;
    OneMinusDestinationColor :: 7;
    DestinationAlpha         :: 8;
    OneMinusDestinationAlpha :: 9;
    SourceAlphaSaturated     :: 10;
    BlendColor               :: 11;
    OneMinusBlendColor       :: 12;
    BlendAlpha               :: 13;
    OneMinusBlendAlpha       :: 14;
    Source1Color             :: 15;
    OneMinusSource1Color     :: 16;
    Source1Alpha             :: 17;
    OneMinusSource1Alpha     :: 18;

    Unspecialized            :: 19;
}

MTLBlendOperation :: enum NSUInteger {
    Add             :: 0;
    Subtract        :: 1;
    ReverseSubtract :: 2;
    Min             :: 3;
    Max             :: 4;

    Unspecialized   :: 5;
}

MTLColorWriteMask :: NSUInteger;
MTLColorWriteMask_1 :: enum MTLColorWriteMask {
    None          :: 0;
    Red           :: 8;
    Green         :: 4;
    Blue          :: 2;
    Alpha         :: 1;
    All           :: 15;

    Unspecialized :: 16;
}

MTLPrimitiveTopologyClass :: enum NSUInteger {
    Unspecified :: 0;
    Point       :: 1;
    Line        :: 2;
    Triangle    :: 3;
}

MTLTessellationPartitionMode :: enum NSUInteger {
    Pow2           :: 0;
    Integer        :: 1;
    FractionalOdd  :: 2;
    FractionalEven :: 3;
}

MTLTessellationFactorStepFunction :: enum NSUInteger {
    Constant               :: 0;
    PerPatch               :: 1;
    PerInstance            :: 2;
    PerPatchAndPerInstance :: 3;
}

MTLTessellationFactorFormat :: enum NSUInteger {
    Half :: 0;
}

MTLTessellationControlPointIndexType :: enum NSUInteger {
    None   :: 0;
    UInt16 :: 1;
    UInt32 :: 2;
}

MTLRenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    pixelFormat :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    isBlendingEnabled :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> BOOL {
        sel := sel_registerName2("isBlendingEnabled");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setBlendingEnabled :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, blendingEnabled: BOOL) -> void {
        sel := sel_registerName2("setBlendingEnabled:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, blendingEnabled);
    }

    sourceRGBBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("sourceRGBBlendFactor");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setSourceRGBBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setSourceRGBBlendFactor:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, sourceRGBBlendFactor);
    }

    destinationRGBBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("destinationRGBBlendFactor");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setDestinationRGBBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setDestinationRGBBlendFactor:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, destinationRGBBlendFactor);
    }

    rgbBlendOperation :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        sel := sel_registerName2("rgbBlendOperation");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendOperation #c_call)objc_msgSend)(self, sel);
    }
    setRgbBlendOperation :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        sel := sel_registerName2("setRgbBlendOperation:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendOperation) -> void #c_call)objc_msgSend)(self, sel, rgbBlendOperation);
    }

    sourceAlphaBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("sourceAlphaBlendFactor");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setSourceAlphaBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setSourceAlphaBlendFactor:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, sourceAlphaBlendFactor);
    }

    destinationAlphaBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("destinationAlphaBlendFactor");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setDestinationAlphaBlendFactor :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setDestinationAlphaBlendFactor:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, destinationAlphaBlendFactor);
    }

    alphaBlendOperation :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        sel := sel_registerName2("alphaBlendOperation");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendOperation #c_call)objc_msgSend)(self, sel);
    }
    setAlphaBlendOperation :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        sel := sel_registerName2("setAlphaBlendOperation:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLBlendOperation) -> void #c_call)objc_msgSend)(self, sel, alphaBlendOperation);
    }

    writeMask :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        sel := sel_registerName2("writeMask");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector) -> MTLColorWriteMask #c_call)objc_msgSend)(self, sel);
    }
    setWriteMask :: inline (self: *MTLRenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        sel := sel_registerName2("setWriteMask:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptor, Selector, MTLColorWriteMask) -> void #c_call)objc_msgSend)(self, sel, writeMask);
    }
}

MTLLogicalToPhysicalColorAttachmentMap :: struct #type_info_none {
    setPhysicalIndex :: inline (self: *MTLLogicalToPhysicalColorAttachmentMap, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> void {
        sel := sel_registerName2("setPhysicalIndex:forLogicalIndex:");
        return xx (cast((*MTLLogicalToPhysicalColorAttachmentMap, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, physicalIndex, logicalIndex);
    }

    getPhysicalIndexForLogicalIndex :: inline (self: *MTLLogicalToPhysicalColorAttachmentMap, logicalIndex: NSUInteger) -> NSUInteger {
        sel := sel_registerName2("getPhysicalIndexForLogicalIndex:");
        return xx (cast((*MTLLogicalToPhysicalColorAttachmentMap, Selector, NSUInteger) -> NSUInteger #c_call)objc_msgSend)(self, sel, logicalIndex);
    }

    reset :: inline (self: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLLogicalToPhysicalColorAttachmentMap, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }
}

MTLRenderPipelineReflection :: struct #type_info_none {
    vertexBindings :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("vertexBindings");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    fragmentBindings :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("fragmentBindings");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    tileBindings :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("tileBindings");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    objectBindings :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("objectBindings");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    meshBindings :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("meshBindings");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
    vertexArguments :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        sel := sel_registerName2("vertexArguments");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLArgument) #c_call)objc_msgSend)(self, sel);
    }
    fragmentArguments :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        sel := sel_registerName2("fragmentArguments");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLArgument) #c_call)objc_msgSend)(self, sel);
    }
    tileArguments :: inline (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        sel := sel_registerName2("tileArguments");
        return xx (cast((*MTLRenderPipelineReflection, Selector) -> *NSArray(*MTLArgument) #c_call)objc_msgSend)(self, sel);
    }
}

MTLRenderPipelineDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTLRenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLRenderPipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLRenderPipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    vertexFunction :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("vertexFunction");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setVertexFunction :: inline (self: *MTLRenderPipelineDescriptor, vertexFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setVertexFunction:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, vertexFunction);
    }
    fragmentFunction :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("fragmentFunction");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setFragmentFunction :: inline (self: *MTLRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setFragmentFunction:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, fragmentFunction);
    }

    vertexDescriptor :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLVertexDescriptor {
        sel := sel_registerName2("vertexDescriptor");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLVertexDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setVertexDescriptor :: inline (self: *MTLRenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        sel := sel_registerName2("setVertexDescriptor:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *MTLVertexDescriptor) -> void #c_call)objc_msgSend)(self, sel, vertexDescriptor);
    }

    sampleCount :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSampleCount :: inline (self: *MTLRenderPipelineDescriptor, sampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setSampleCount:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampleCount);
    }
    rasterSampleCount :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTLRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }
    isAlphaToCoverageEnabled :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isAlphaToCoverageEnabled");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToCoverageEnabled :: inline (self: *MTLRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        sel := sel_registerName2("setAlphaToCoverageEnabled:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, alphaToCoverageEnabled);
    }
    isAlphaToOneEnabled :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isAlphaToOneEnabled");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToOneEnabled :: inline (self: *MTLRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        sel := sel_registerName2("setAlphaToOneEnabled:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, alphaToOneEnabled);
    }
    isRasterizationEnabled :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isRasterizationEnabled");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationEnabled :: inline (self: *MTLRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        sel := sel_registerName2("setRasterizationEnabled:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexAmplificationCount");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexAmplificationCount :: inline (self: *MTLRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexAmplificationCount:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexAmplificationCount);
    }

    colorAttachments :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    depthAttachmentPixelFormat :: inline (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("depthAttachmentPixelFormat");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setDepthAttachmentPixelFormat :: inline (self: *MTLRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setDepthAttachmentPixelFormat:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, depthAttachmentPixelFormat);
    }
    stencilAttachmentPixelFormat :: inline (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("stencilAttachmentPixelFormat");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setStencilAttachmentPixelFormat :: inline (self: *MTLRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setStencilAttachmentPixelFormat:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, stencilAttachmentPixelFormat);
    }

    inputPrimitiveTopology :: inline (self: *MTLRenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        sel := sel_registerName2("inputPrimitiveTopology");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLPrimitiveTopologyClass #c_call)objc_msgSend)(self, sel);
    }
    setInputPrimitiveTopology :: inline (self: *MTLRenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        sel := sel_registerName2("setInputPrimitiveTopology:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLPrimitiveTopologyClass) -> void #c_call)objc_msgSend)(self, sel, inputPrimitiveTopology);
    }

    tessellationPartitionMode :: inline (self: *MTLRenderPipelineDescriptor) -> MTLTessellationPartitionMode {
        sel := sel_registerName2("tessellationPartitionMode");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLTessellationPartitionMode #c_call)objc_msgSend)(self, sel);
    }
    setTessellationPartitionMode :: inline (self: *MTLRenderPipelineDescriptor, tessellationPartitionMode: MTLTessellationPartitionMode) -> void {
        sel := sel_registerName2("setTessellationPartitionMode:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLTessellationPartitionMode) -> void #c_call)objc_msgSend)(self, sel, tessellationPartitionMode);
    }
    maxTessellationFactor :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTessellationFactor");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTessellationFactor :: inline (self: *MTLRenderPipelineDescriptor, maxTessellationFactor: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTessellationFactor:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTessellationFactor);
    }
    isTessellationFactorScaleEnabled :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isTessellationFactorScaleEnabled");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setTessellationFactorScaleEnabled :: inline (self: *MTLRenderPipelineDescriptor, tessellationFactorScaleEnabled: BOOL) -> void {
        sel := sel_registerName2("setTessellationFactorScaleEnabled:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, tessellationFactorScaleEnabled);
    }
    tessellationFactorFormat :: inline (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorFormat {
        sel := sel_registerName2("tessellationFactorFormat");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLTessellationFactorFormat #c_call)objc_msgSend)(self, sel);
    }
    setTessellationFactorFormat :: inline (self: *MTLRenderPipelineDescriptor, tessellationFactorFormat: MTLTessellationFactorFormat) -> void {
        sel := sel_registerName2("setTessellationFactorFormat:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLTessellationFactorFormat) -> void #c_call)objc_msgSend)(self, sel, tessellationFactorFormat);
    }
    tessellationControlPointIndexType :: inline (self: *MTLRenderPipelineDescriptor) -> MTLTessellationControlPointIndexType {
        sel := sel_registerName2("tessellationControlPointIndexType");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLTessellationControlPointIndexType #c_call)objc_msgSend)(self, sel);
    }
    setTessellationControlPointIndexType :: inline (self: *MTLRenderPipelineDescriptor, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> void {
        sel := sel_registerName2("setTessellationControlPointIndexType:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLTessellationControlPointIndexType) -> void #c_call)objc_msgSend)(self, sel, tessellationControlPointIndexType);
    }
    tessellationFactorStepFunction :: inline (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorStepFunction {
        sel := sel_registerName2("tessellationFactorStepFunction");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLTessellationFactorStepFunction #c_call)objc_msgSend)(self, sel);
    }
    setTessellationFactorStepFunction :: inline (self: *MTLRenderPipelineDescriptor, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> void {
        sel := sel_registerName2("setTessellationFactorStepFunction:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLTessellationFactorStepFunction) -> void #c_call)objc_msgSend)(self, sel, tessellationFactorStepFunction);
    }
    tessellationOutputWindingOrder :: inline (self: *MTLRenderPipelineDescriptor) -> MTLWinding {
        sel := sel_registerName2("tessellationOutputWindingOrder");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLWinding #c_call)objc_msgSend)(self, sel);
    }
    setTessellationOutputWindingOrder :: inline (self: *MTLRenderPipelineDescriptor, tessellationOutputWindingOrder: MTLWinding) -> void {
        sel := sel_registerName2("setTessellationOutputWindingOrder:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLWinding) -> void #c_call)objc_msgSend)(self, sel, tessellationOutputWindingOrder);
    }

    vertexBuffers :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("vertexBuffers");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
    fragmentBuffers :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("fragmentBuffers");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    supportIndirectCommandBuffers :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTLRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }

    binaryArchives :: inline (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }

    vertexPreloadedLibraries :: inline (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("vertexPreloadedLibraries");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setVertexPreloadedLibraries :: inline (self: *MTLRenderPipelineDescriptor, vertexPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setVertexPreloadedLibraries:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, vertexPreloadedLibraries);
    }

    fragmentPreloadedLibraries :: inline (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("fragmentPreloadedLibraries");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setFragmentPreloadedLibraries :: inline (self: *MTLRenderPipelineDescriptor, fragmentPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setFragmentPreloadedLibraries:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, fragmentPreloadedLibraries);
    }

    vertexLinkedFunctions :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("vertexLinkedFunctions");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setVertexLinkedFunctions :: inline (self: *MTLRenderPipelineDescriptor, vertexLinkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setVertexLinkedFunctions:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, vertexLinkedFunctions);
    }

    fragmentLinkedFunctions :: inline (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("fragmentLinkedFunctions");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setFragmentLinkedFunctions :: inline (self: *MTLRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setFragmentLinkedFunctions:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, fragmentLinkedFunctions);
    }

    supportAddingVertexBinaryFunctions :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportAddingVertexBinaryFunctions");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportAddingVertexBinaryFunctions :: inline (self: *MTLRenderPipelineDescriptor, supportAddingVertexBinaryFunctions: BOOL) -> void {
        sel := sel_registerName2("setSupportAddingVertexBinaryFunctions:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportAddingVertexBinaryFunctions);
    }

    supportAddingFragmentBinaryFunctions :: inline (self: *MTLRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportAddingFragmentBinaryFunctions");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportAddingFragmentBinaryFunctions :: inline (self: *MTLRenderPipelineDescriptor, supportAddingFragmentBinaryFunctions: BOOL) -> void {
        sel := sel_registerName2("setSupportAddingFragmentBinaryFunctions:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportAddingFragmentBinaryFunctions);
    }

    maxVertexCallStackDepth :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexCallStackDepth");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexCallStackDepth :: inline (self: *MTLRenderPipelineDescriptor, maxVertexCallStackDepth: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexCallStackDepth:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexCallStackDepth);
    }

    maxFragmentCallStackDepth :: inline (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxFragmentCallStackDepth");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxFragmentCallStackDepth :: inline (self: *MTLRenderPipelineDescriptor, maxFragmentCallStackDepth: NSUInteger) -> void {
        sel := sel_registerName2("setMaxFragmentCallStackDepth:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxFragmentCallStackDepth);
    }

    shaderValidation :: inline (self: *MTLRenderPipelineDescriptor) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }
    setShaderValidation :: inline (self: *MTLRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        sel := sel_registerName2("setShaderValidation:");
        return xx (cast((*MTLRenderPipelineDescriptor, Selector, MTLShaderValidation) -> void #c_call)objc_msgSend)(self, sel, shaderValidation);
    }
}

MTLRenderPipelineFunctionsDescriptor :: struct #type_info_none {
    vertexAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("vertexAdditionalBinaryFunctions");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setVertexAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setVertexAdditionalBinaryFunctions:");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, vertexAdditionalBinaryFunctions);
    }

    fragmentAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("fragmentAdditionalBinaryFunctions");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setFragmentAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setFragmentAdditionalBinaryFunctions:");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, fragmentAdditionalBinaryFunctions);
    }

    tileAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("tileAdditionalBinaryFunctions");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setTileAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setTileAdditionalBinaryFunctions:");
        return xx (cast((*MTLRenderPipelineFunctionsDescriptor, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, tileAdditionalBinaryFunctions);
    }
}

MTLRenderPipelineState :: struct #type_info_none {
    #as using mtlallocation: MTLAllocation;

    functionHandleWithName :: inline (self: *MTLRenderPipelineState, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithName:stage:");
        return xx (cast((*MTLRenderPipelineState, Selector, *NSString, MTLRenderStages) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, name, stage);
    }

    functionHandleWithBinaryFunction :: inline (self: *MTLRenderPipelineState, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithBinaryFunction:stage:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTL4BinaryFunction, MTLRenderStages) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function, stage);
    }

    newRenderPipelineStateWithBinaryFunctions :: inline (self: *MTLRenderPipelineState, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithBinaryFunctions:error:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTL4RenderPipelineBinaryFunctionsDescriptor, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, binaryFunctionsDescriptor, error);
    }

    newRenderPipelineDescriptorForSpecialization :: inline (self: *MTLRenderPipelineState) -> *MTL4PipelineDescriptor {
        sel := sel_registerName2("newRenderPipelineDescriptorForSpecialization");
        return xx (cast((*MTLRenderPipelineState, Selector) -> *MTL4PipelineDescriptor #c_call)objc_msgSend)(self, sel);
    }

    imageblockMemoryLengthForDimensions :: inline (self: *MTLRenderPipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        sel := sel_registerName2("imageblockMemoryLengthForDimensions:");
        return xx (cast((*MTLRenderPipelineState, Selector, MTLSize) -> NSUInteger #c_call)objc_msgSend)(self, sel, imageblockDimensions);
    }

    functionHandleWithFunction :: inline (self: *MTLRenderPipelineState, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        sel := sel_registerName2("functionHandleWithFunction:stage:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTLFunction, MTLRenderStages) -> *MTLFunctionHandle #c_call)objc_msgSend)(self, sel, function, stage);
    }

    newVisibleFunctionTableWithDescriptor :: inline (self: *MTLRenderPipelineState, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable {
        sel := sel_registerName2("newVisibleFunctionTableWithDescriptor:stage:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTLVisibleFunctionTableDescriptor, MTLRenderStages) -> *MTLVisibleFunctionTable #c_call)objc_msgSend)(self, sel, descriptor, stage);
    }

    newIntersectionFunctionTableWithDescriptor :: inline (self: *MTLRenderPipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable {
        sel := sel_registerName2("newIntersectionFunctionTableWithDescriptor:stage:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTLIntersectionFunctionTableDescriptor, MTLRenderStages) -> *MTLIntersectionFunctionTable #c_call)objc_msgSend)(self, sel, descriptor, stage);
    }

    newRenderPipelineStateWithAdditionalBinaryFunctions :: inline (self: *MTLRenderPipelineState, additionalBinaryFunctions: *MTLRenderPipelineFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithAdditionalBinaryFunctions:error:");
        return xx (cast((*MTLRenderPipelineState, Selector, *MTLRenderPipelineFunctionsDescriptor, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, additionalBinaryFunctions, error);
    }

    label :: inline (self: *MTLRenderPipelineState) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLRenderPipelineState, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    device :: inline (self: *MTLRenderPipelineState) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLRenderPipelineState, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    reflection :: inline (self: *MTLRenderPipelineState) -> *MTLRenderPipelineReflection {
        sel := sel_registerName2("reflection");
        return xx (cast((*MTLRenderPipelineState, Selector) -> *MTLRenderPipelineReflection #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    threadgroupSizeMatchesTileSize :: inline (self: *MTLRenderPipelineState) -> BOOL {
        sel := sel_registerName2("threadgroupSizeMatchesTileSize");
        return xx (cast((*MTLRenderPipelineState, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    imageblockSampleLength :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("imageblockSampleLength");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    supportIndirectCommandBuffers :: inline (self: *MTLRenderPipelineState) -> BOOL {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTLRenderPipelineState, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadsPerObjectThreadgroup :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerObjectThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadsPerMeshThreadgroup :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerMeshThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    objectThreadExecutionWidth :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("objectThreadExecutionWidth");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    meshThreadExecutionWidth :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("meshThreadExecutionWidth");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadgroupsPerMeshGrid :: inline (self: *MTLRenderPipelineState) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadgroupsPerMeshGrid");
        return xx (cast((*MTLRenderPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLRenderPipelineState) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLRenderPipelineState, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    shaderValidation :: inline (self: *MTLRenderPipelineState) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLRenderPipelineState, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }

    requiredThreadsPerTileThreadgroup :: inline (self: *MTLRenderPipelineState) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerTileThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    requiredThreadsPerObjectThreadgroup :: inline (self: *MTLRenderPipelineState) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerObjectThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    requiredThreadsPerMeshThreadgroup :: inline (self: *MTLRenderPipelineState) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerMeshThreadgroup");
        return xx (cast((*MTLRenderPipelineState, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
}

MTLRenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLRenderPipelineColorAttachmentDescriptorArray, Selector, *MTLRenderPipelineColorAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLTileRenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    pixelFormat :: inline (self: *MTLTileRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTLTileRenderPipelineColorAttachmentDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *MTLTileRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*MTLTileRenderPipelineColorAttachmentDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }
}

MTLTileRenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLTileRenderPipelineColorAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLTileRenderPipelineColorAttachmentDescriptorArray, Selector, *MTLTileRenderPipelineColorAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLTileRenderPipelineDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTLTileRenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLTileRenderPipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLTileRenderPipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    tileFunction :: inline (self: *MTLTileRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("tileFunction");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setTileFunction :: inline (self: *MTLTileRenderPipelineDescriptor, tileFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setTileFunction:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, tileFunction);
    }

    rasterSampleCount :: inline (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTLTileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }
    colorAttachments :: inline (self: *MTLTileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    threadgroupSizeMatchesTileSize :: inline (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("threadgroupSizeMatchesTileSize");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setThreadgroupSizeMatchesTileSize :: inline (self: *MTLTileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        sel := sel_registerName2("setThreadgroupSizeMatchesTileSize:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, threadgroupSizeMatchesTileSize);
    }

    tileBuffers :: inline (self: *MTLTileRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("tileBuffers");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerThreadgroup :: inline (self: *MTLTileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerThreadgroup:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerThreadgroup);
    }

    binaryArchives :: inline (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLTileRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }

    preloadedLibraries :: inline (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("preloadedLibraries");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setPreloadedLibraries :: inline (self: *MTLTileRenderPipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setPreloadedLibraries:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, preloadedLibraries);
    }

    linkedFunctions :: inline (self: *MTLTileRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("linkedFunctions");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setLinkedFunctions :: inline (self: *MTLTileRenderPipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setLinkedFunctions:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, linkedFunctions);
    }

    supportAddingBinaryFunctions :: inline (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportAddingBinaryFunctions");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportAddingBinaryFunctions :: inline (self: *MTLTileRenderPipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        sel := sel_registerName2("setSupportAddingBinaryFunctions:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportAddingBinaryFunctions);
    }

    maxCallStackDepth :: inline (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCallStackDepth");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCallStackDepth :: inline (self: *MTLTileRenderPipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCallStackDepth:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCallStackDepth);
    }

    shaderValidation :: inline (self: *MTLTileRenderPipelineDescriptor) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }
    setShaderValidation :: inline (self: *MTLTileRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        sel := sel_registerName2("setShaderValidation:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, MTLShaderValidation) -> void #c_call)objc_msgSend)(self, sel, shaderValidation);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTLTileRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerThreadgroup :: inline (self: *MTLTileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerThreadgroup:");
        return xx (cast((*MTLTileRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerThreadgroup);
    }
}

MTLMeshRenderPipelineDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTLMeshRenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLMeshRenderPipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    objectFunction :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("objectFunction");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setObjectFunction :: inline (self: *MTLMeshRenderPipelineDescriptor, objectFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setObjectFunction:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, objectFunction);
    }

    meshFunction :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("meshFunction");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setMeshFunction :: inline (self: *MTLMeshRenderPipelineDescriptor, meshFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setMeshFunction:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, meshFunction);
    }

    fragmentFunction :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        sel := sel_registerName2("fragmentFunction");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    setFragmentFunction :: inline (self: *MTLMeshRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        sel := sel_registerName2("setFragmentFunction:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLFunction) -> void #c_call)objc_msgSend)(self, sel, fragmentFunction);
    }

    maxTotalThreadsPerObjectThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerObjectThreadgroup");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerObjectThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerObjectThreadgroup:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerObjectThreadgroup);
    }

    maxTotalThreadsPerMeshThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerMeshThreadgroup");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerMeshThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerMeshThreadgroup:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerMeshThreadgroup);
    }

    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("objectThreadgroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLMeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("meshThreadgroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTLMeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    payloadMemoryLength :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("payloadMemoryLength");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPayloadMemoryLength :: inline (self: *MTLMeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        sel := sel_registerName2("setPayloadMemoryLength:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, payloadMemoryLength);
    }

    maxTotalThreadgroupsPerMeshGrid :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadgroupsPerMeshGrid");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadgroupsPerMeshGrid :: inline (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadgroupsPerMeshGrid:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadgroupsPerMeshGrid);
    }

    objectBuffers :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("objectBuffers");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    meshBuffers :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("meshBuffers");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    fragmentBuffers :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        sel := sel_registerName2("fragmentBuffers");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLPipelineBufferDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    rasterSampleCount :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTLMeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }

    isAlphaToCoverageEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isAlphaToCoverageEnabled");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToCoverageEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        sel := sel_registerName2("setAlphaToCoverageEnabled:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, alphaToCoverageEnabled);
    }

    isAlphaToOneEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isAlphaToOneEnabled");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToOneEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        sel := sel_registerName2("setAlphaToOneEnabled:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, alphaToOneEnabled);
    }

    isRasterizationEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isRasterizationEnabled");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationEnabled :: inline (self: *MTLMeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        sel := sel_registerName2("setRasterizationEnabled:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: inline (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexAmplificationCount");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexAmplificationCount :: inline (self: *MTLMeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexAmplificationCount:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexAmplificationCount);
    }

    colorAttachments :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    depthAttachmentPixelFormat :: inline (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("depthAttachmentPixelFormat");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setDepthAttachmentPixelFormat :: inline (self: *MTLMeshRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setDepthAttachmentPixelFormat:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, depthAttachmentPixelFormat);
    }

    stencilAttachmentPixelFormat :: inline (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("stencilAttachmentPixelFormat");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setStencilAttachmentPixelFormat :: inline (self: *MTLMeshRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setStencilAttachmentPixelFormat:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, stencilAttachmentPixelFormat);
    }

    supportIndirectCommandBuffers :: inline (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTLMeshRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }

    binaryArchives :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLMeshRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }

    objectLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("objectLinkedFunctions");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setObjectLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor, objectLinkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setObjectLinkedFunctions:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, objectLinkedFunctions);
    }

    meshLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("meshLinkedFunctions");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setMeshLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor, meshLinkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setMeshLinkedFunctions:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, meshLinkedFunctions);
    }

    fragmentLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        sel := sel_registerName2("fragmentLinkedFunctions");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> *MTLLinkedFunctions #c_call)objc_msgSend)(self, sel);
    }
    setFragmentLinkedFunctions :: inline (self: *MTLMeshRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        sel := sel_registerName2("setFragmentLinkedFunctions:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, *MTLLinkedFunctions) -> void #c_call)objc_msgSend)(self, sel, fragmentLinkedFunctions);
    }

    shaderValidation :: inline (self: *MTLMeshRenderPipelineDescriptor) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }
    setShaderValidation :: inline (self: *MTLMeshRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        sel := sel_registerName2("setShaderValidation:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, MTLShaderValidation) -> void #c_call)objc_msgSend)(self, sel, shaderValidation);
    }

    requiredThreadsPerObjectThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerObjectThreadgroup");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerObjectThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerObjectThreadgroup:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerObjectThreadgroup);
    }

    requiredThreadsPerMeshThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerMeshThreadgroup");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerMeshThreadgroup :: inline (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerMeshThreadgroup:");
        return xx (cast((*MTLMeshRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerMeshThreadgroup);
    }
}

MTLParallelRenderCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    renderCommandEncoder :: inline (self: *MTLParallelRenderCommandEncoder) -> *MTLRenderCommandEncoder {
        sel := sel_registerName2("renderCommandEncoder");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector) -> *MTLRenderCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    setColorStoreAction :: inline (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setColorStoreAction:atIndex:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreAction, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction :: inline (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setDepthStoreAction:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    setStencilStoreAction :: inline (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setStencilStoreAction:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    setColorStoreActionOptions :: inline (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setColorStoreActionOptions:atIndex:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreActionOptions, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions, colorAttachmentIndex);
    }

    setDepthStoreActionOptions :: inline (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        sel := sel_registerName2("setDepthStoreActionOptions:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreActionOptions) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions);
    }

    setStencilStoreActionOptions :: inline (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        sel := sel_registerName2("setStencilStoreActionOptions:");
        return xx (cast((*MTLParallelRenderCommandEncoder, Selector, MTLStoreActionOptions) -> void #c_call)objc_msgSend)(self, sel, storeActionOptions);
    }
}

MTLSamplerMinMagFilter :: enum NSUInteger {
    Nearest :: 0;
    Linear  :: 1;
}

MTLSamplerMipFilter :: enum NSUInteger {
    NotMipmapped :: 0;
    Nearest      :: 1;
    Linear       :: 2;
}

MTLSamplerAddressMode :: enum NSUInteger {
    ClampToEdge        :: 0;
    MirrorClampToEdge  :: 1;
    Repeat             :: 2;
    MirrorRepeat       :: 3;
    ClampToZero        :: 4;
    ClampToBorderColor :: 5;
}

MTLSamplerBorderColor :: enum NSUInteger {
    TransparentBlack :: 0;
    OpaqueBlack      :: 1;
    OpaqueWhite      :: 2;
}

MTLSamplerReductionMode :: enum NSUInteger {
    WeightedAverage :: 0;

    Minimum         :: 1;

    Maximum         :: 2;
}

MTLSamplerDescriptor :: struct #type_info_none {
    minFilter :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        sel := sel_registerName2("minFilter");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerMinMagFilter #c_call)objc_msgSend)(self, sel);
    }
    setMinFilter :: inline (self: *MTLSamplerDescriptor, minFilter: MTLSamplerMinMagFilter) -> void {
        sel := sel_registerName2("setMinFilter:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerMinMagFilter) -> void #c_call)objc_msgSend)(self, sel, minFilter);
    }

    magFilter :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        sel := sel_registerName2("magFilter");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerMinMagFilter #c_call)objc_msgSend)(self, sel);
    }
    setMagFilter :: inline (self: *MTLSamplerDescriptor, magFilter: MTLSamplerMinMagFilter) -> void {
        sel := sel_registerName2("setMagFilter:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerMinMagFilter) -> void #c_call)objc_msgSend)(self, sel, magFilter);
    }

    mipFilter :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerMipFilter {
        sel := sel_registerName2("mipFilter");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerMipFilter #c_call)objc_msgSend)(self, sel);
    }
    setMipFilter :: inline (self: *MTLSamplerDescriptor, mipFilter: MTLSamplerMipFilter) -> void {
        sel := sel_registerName2("setMipFilter:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerMipFilter) -> void #c_call)objc_msgSend)(self, sel, mipFilter);
    }

    maxAnisotropy :: inline (self: *MTLSamplerDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxAnisotropy");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxAnisotropy :: inline (self: *MTLSamplerDescriptor, maxAnisotropy: NSUInteger) -> void {
        sel := sel_registerName2("setMaxAnisotropy:");
        return xx (cast((*MTLSamplerDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxAnisotropy);
    }

    sAddressMode :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        sel := sel_registerName2("sAddressMode");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerAddressMode #c_call)objc_msgSend)(self, sel);
    }
    setSAddressMode :: inline (self: *MTLSamplerDescriptor, sAddressMode: MTLSamplerAddressMode) -> void {
        sel := sel_registerName2("setSAddressMode:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerAddressMode) -> void #c_call)objc_msgSend)(self, sel, sAddressMode);
    }

    tAddressMode :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        sel := sel_registerName2("tAddressMode");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerAddressMode #c_call)objc_msgSend)(self, sel);
    }
    setTAddressMode :: inline (self: *MTLSamplerDescriptor, tAddressMode: MTLSamplerAddressMode) -> void {
        sel := sel_registerName2("setTAddressMode:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerAddressMode) -> void #c_call)objc_msgSend)(self, sel, tAddressMode);
    }

    rAddressMode :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        sel := sel_registerName2("rAddressMode");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerAddressMode #c_call)objc_msgSend)(self, sel);
    }
    setRAddressMode :: inline (self: *MTLSamplerDescriptor, rAddressMode: MTLSamplerAddressMode) -> void {
        sel := sel_registerName2("setRAddressMode:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerAddressMode) -> void #c_call)objc_msgSend)(self, sel, rAddressMode);
    }

    borderColor :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerBorderColor {
        sel := sel_registerName2("borderColor");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerBorderColor #c_call)objc_msgSend)(self, sel);
    }
    setBorderColor :: inline (self: *MTLSamplerDescriptor, borderColor: MTLSamplerBorderColor) -> void {
        sel := sel_registerName2("setBorderColor:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerBorderColor) -> void #c_call)objc_msgSend)(self, sel, borderColor);
    }

    reductionMode :: inline (self: *MTLSamplerDescriptor) -> MTLSamplerReductionMode {
        sel := sel_registerName2("reductionMode");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLSamplerReductionMode #c_call)objc_msgSend)(self, sel);
    }
    setReductionMode :: inline (self: *MTLSamplerDescriptor, reductionMode: MTLSamplerReductionMode) -> void {
        sel := sel_registerName2("setReductionMode:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLSamplerReductionMode) -> void #c_call)objc_msgSend)(self, sel, reductionMode);
    }

    normalizedCoordinates :: inline (self: *MTLSamplerDescriptor) -> BOOL {
        sel := sel_registerName2("normalizedCoordinates");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setNormalizedCoordinates :: inline (self: *MTLSamplerDescriptor, normalizedCoordinates: BOOL) -> void {
        sel := sel_registerName2("setNormalizedCoordinates:");
        return xx (cast((*MTLSamplerDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, normalizedCoordinates);
    }

    lodMinClamp :: inline (self: *MTLSamplerDescriptor) -> float {
        sel := sel_registerName2("lodMinClamp");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setLodMinClamp :: inline (self: *MTLSamplerDescriptor, lodMinClamp: float) -> void {
        sel := sel_registerName2("setLodMinClamp:");
        return xx (cast((*MTLSamplerDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, lodMinClamp);
    }

    lodMaxClamp :: inline (self: *MTLSamplerDescriptor) -> float {
        sel := sel_registerName2("lodMaxClamp");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setLodMaxClamp :: inline (self: *MTLSamplerDescriptor, lodMaxClamp: float) -> void {
        sel := sel_registerName2("setLodMaxClamp:");
        return xx (cast((*MTLSamplerDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, lodMaxClamp);
    }

    lodAverage :: inline (self: *MTLSamplerDescriptor) -> BOOL {
        sel := sel_registerName2("lodAverage");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setLodAverage :: inline (self: *MTLSamplerDescriptor, lodAverage: BOOL) -> void {
        sel := sel_registerName2("setLodAverage:");
        return xx (cast((*MTLSamplerDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, lodAverage);
    }

    lodBias :: inline (self: *MTLSamplerDescriptor) -> float {
        sel := sel_registerName2("lodBias");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setLodBias :: inline (self: *MTLSamplerDescriptor, lodBias: float) -> void {
        sel := sel_registerName2("setLodBias:");
        return xx (cast((*MTLSamplerDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, lodBias);
    }

    compareFunction :: inline (self: *MTLSamplerDescriptor) -> MTLCompareFunction {
        sel := sel_registerName2("compareFunction");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> MTLCompareFunction #c_call)objc_msgSend)(self, sel);
    }
    setCompareFunction :: inline (self: *MTLSamplerDescriptor, compareFunction: MTLCompareFunction) -> void {
        sel := sel_registerName2("setCompareFunction:");
        return xx (cast((*MTLSamplerDescriptor, Selector, MTLCompareFunction) -> void #c_call)objc_msgSend)(self, sel, compareFunction);
    }

    supportArgumentBuffers :: inline (self: *MTLSamplerDescriptor) -> BOOL {
        sel := sel_registerName2("supportArgumentBuffers");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportArgumentBuffers :: inline (self: *MTLSamplerDescriptor, supportArgumentBuffers: BOOL) -> void {
        sel := sel_registerName2("setSupportArgumentBuffers:");
        return xx (cast((*MTLSamplerDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportArgumentBuffers);
    }

    label :: inline (self: *MTLSamplerDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLSamplerDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLSamplerDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLSamplerDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLSamplerState :: struct #type_info_none {
    label :: inline (self: *MTLSamplerState) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLSamplerState, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLSamplerState) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLSamplerState, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLSamplerState) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLSamplerState, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTL4BufferRange :: struct #type_info_none {
    bufferAddress: MTLGPUAddress;

    length:        u64;
}

_MTLPackedFloat3 :: struct {
    union {
        struct {
            x: float;
            y: float;
            z: float;
        }

        elements: [3] float;
    }
}

MTLPackedFloat3 :: _MTLPackedFloat3;

MTLPackedFloatQuaternion :: struct #type_info_none {
    x: float;
    y: float;
    z: float;
    w: float;
}

_MTLPackedFloat4x3 :: struct {
    columns: [4] MTLPackedFloat3;
}

MTLPackedFloat4x3 :: _MTLPackedFloat4x3;

_MTLAxisAlignedBoundingBox :: struct {
    min: MTLPackedFloat3;

    max: MTLPackedFloat3;
}

MTLAxisAlignedBoundingBox :: _MTLAxisAlignedBoundingBox;

MTLComponentTransform :: struct #type_info_none {
    scale:       MTLPackedFloat3;

    shear:       MTLPackedFloat3;

    pivot:       MTLPackedFloat3;

    rotation:    MTLPackedFloatQuaternion;

    translation: MTLPackedFloat3;
}

MTLAccelerationStructureRefitOptions :: NSUInteger;
MTLAccelerationStructureRefitOption :: enum MTLAccelerationStructureRefitOptions {
    VertexData       :: 1;

    PerPrimitiveData :: 2;
}

MTLAccelerationStructureUsage :: NSUInteger;
MTLAccelerationStructureUsage_1 :: enum MTLAccelerationStructureUsage {
    None                   :: 0;

    Refit                  :: 1;

    PreferFastBuild        :: 2;

    ExtendedLimits         :: 4;

    PreferFastIntersection :: 16;

    MinimizeMemory         :: 32;
}

MTLAccelerationStructureInstanceOptions :: u32;
MTLAccelerationStructureInstanceOption :: enum MTLAccelerationStructureInstanceOptions {
    None                                       :: 0;

    DisableTriangleCulling                     :: 1;

    TriangleFrontFacingWindingCounterClockwise :: 2;

    Opaque                                     :: 4;

    NonOpaque                                  :: 8;
}

MTLMatrixLayout :: enum NSInteger {
    ColumnMajor :: 0;

    RowMajor    :: 1;
}

MTLAccelerationStructureDescriptor :: struct #type_info_none {
    usage :: inline (self: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureUsage {
        sel := sel_registerName2("usage");
        return xx (cast((*MTLAccelerationStructureDescriptor, Selector) -> MTLAccelerationStructureUsage #c_call)objc_msgSend)(self, sel);
    }
    setUsage :: inline (self: *MTLAccelerationStructureDescriptor, usage: MTLAccelerationStructureUsage) -> void {
        sel := sel_registerName2("setUsage:");
        return xx (cast((*MTLAccelerationStructureDescriptor, Selector, MTLAccelerationStructureUsage) -> void #c_call)objc_msgSend)(self, sel, usage);
    }
}

MTLAccelerationStructureGeometryDescriptor :: struct #type_info_none {
    intersectionFunctionTableOffset :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("intersectionFunctionTableOffset");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIntersectionFunctionTableOffset :: inline (self: *MTLAccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIntersectionFunctionTableOffset:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTableOffset);
    }

    opaque :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        sel := sel_registerName2("opaque");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setOpaque :: inline (self: *MTLAccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        sel := sel_registerName2("setOpaque:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, opaque);
    }

    allowDuplicateIntersectionFunctionInvocation :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        sel := sel_registerName2("allowDuplicateIntersectionFunctionInvocation");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAllowDuplicateIntersectionFunctionInvocation :: inline (self: *MTLAccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        sel := sel_registerName2("setAllowDuplicateIntersectionFunctionInvocation:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, allowDuplicateIntersectionFunctionInvocation);
    }

    label :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLAccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    primitiveDataBuffer :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("primitiveDataBuffer");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataBuffer :: inline (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setPrimitiveDataBuffer:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, primitiveDataBuffer);
    }

    primitiveDataBufferOffset :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("primitiveDataBufferOffset");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataBufferOffset :: inline (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setPrimitiveDataBufferOffset:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveDataBufferOffset);
    }

    primitiveDataStride :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("primitiveDataStride");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataStride :: inline (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        sel := sel_registerName2("setPrimitiveDataStride:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveDataStride);
    }

    primitiveDataElementSize :: inline (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("primitiveDataElementSize");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataElementSize :: inline (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        sel := sel_registerName2("setPrimitiveDataElementSize:");
        return xx (cast((*MTLAccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveDataElementSize);
    }
}

MTLMotionBorderMode :: enum u32 {
    Clamp  :: 0;

    Vanish :: 1;
}

MTLPrimitiveAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuredescriptor: MTLAccelerationStructureDescriptor;

    descriptor :: inline () -> *MTLPrimitiveAccelerationStructureDescriptor {
        class := objc_getClass("MTLPrimitiveAccelerationStructureDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLPrimitiveAccelerationStructureDescriptor #c_call)objc_msgSend)(class, sel);
    }

    geometryDescriptors :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) {
        sel := sel_registerName2("geometryDescriptors");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) #c_call)objc_msgSend)(self, sel);
    }
    setGeometryDescriptors :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void {
        sel := sel_registerName2("setGeometryDescriptors:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void #c_call)objc_msgSend)(self, sel, geometryDescriptors);
    }

    motionStartBorderMode :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        sel := sel_registerName2("motionStartBorderMode");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> MTLMotionBorderMode #c_call)objc_msgSend)(self, sel);
    }
    setMotionStartBorderMode :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        sel := sel_registerName2("setMotionStartBorderMode:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, MTLMotionBorderMode) -> void #c_call)objc_msgSend)(self, sel, motionStartBorderMode);
    }

    motionEndBorderMode :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        sel := sel_registerName2("motionEndBorderMode");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> MTLMotionBorderMode #c_call)objc_msgSend)(self, sel);
    }
    setMotionEndBorderMode :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        sel := sel_registerName2("setMotionEndBorderMode:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, MTLMotionBorderMode) -> void #c_call)objc_msgSend)(self, sel, motionEndBorderMode);
    }

    motionStartTime :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float {
        sel := sel_registerName2("motionStartTime");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setMotionStartTime :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> void {
        sel := sel_registerName2("setMotionStartTime:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, motionStartTime);
    }

    motionEndTime :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float {
        sel := sel_registerName2("motionEndTime");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setMotionEndTime :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> void {
        sel := sel_registerName2("setMotionEndTime:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, motionEndTime);
    }

    motionKeyframeCount :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionKeyframeCount");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionKeyframeCount :: inline (self: *MTLPrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        sel := sel_registerName2("setMotionKeyframeCount:");
        return xx (cast((*MTLPrimitiveAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionKeyframeCount);
    }
}

MTLAccelerationStructureTriangleGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureTriangleGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureTriangleGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureTriangleGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    vertexBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("vertexBuffer");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setVertexBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setVertexBuffer:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, vertexBuffer);
    }

    vertexBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("vertexBufferOffset");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setVertexBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBufferOffset:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, vertexBufferOffset);
    }

    vertexFormat :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("vertexFormat");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setVertexFormat :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setVertexFormat:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, vertexFormat);
    }

    vertexStride :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("vertexStride");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setVertexStride :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        sel := sel_registerName2("setVertexStride:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, vertexStride);
    }

    indexBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("indexBufferOffset");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndexBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIndexBufferOffset:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indexBufferOffset);
    }

    indexType :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    triangleCount :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("triangleCount");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTriangleCount :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        sel := sel_registerName2("setTriangleCount:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, triangleCount);
    }

    transformationMatrixBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("transformationMatrixBuffer");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBuffer :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setTransformationMatrixBuffer:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBuffer);
    }

    transformationMatrixBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("transformationMatrixBufferOffset");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBufferOffset :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setTransformationMatrixBufferOffset:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBufferOffset);
    }

    transformationMatrixLayout :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("transformationMatrixLayout");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixLayout :: inline (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setTransformationMatrixLayout:");
        return xx (cast((*MTLAccelerationStructureTriangleGeometryDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixLayout);
    }
}

MTLAccelerationStructureBoundingBoxGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureBoundingBoxGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    boundingBoxBuffer :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("boundingBoxBuffer");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxBuffer :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setBoundingBoxBuffer:");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, boundingBoxBuffer);
    }

    boundingBoxBufferOffset :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxBufferOffset");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxBufferOffset :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxBufferOffset:");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxBufferOffset);
    }

    boundingBoxStride :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxStride");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxStride :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxStride:");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxStride);
    }

    boundingBoxCount :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxCount");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxCount :: inline (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxCount:");
        return xx (cast((*MTLAccelerationStructureBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxCount);
    }
}

MTLMotionKeyframeData :: struct #type_info_none {
    data :: inline () -> *MTLMotionKeyframeData {
        class := objc_getClass("MTLMotionKeyframeData");
        sel := sel_registerName2("data");
        return xx (cast((Class, Selector) -> *MTLMotionKeyframeData #c_call)objc_msgSend)(class, sel);
    }

    buffer :: inline (self: *MTLMotionKeyframeData) -> *MTLBuffer {
        sel := sel_registerName2("buffer");
        return xx (cast((*MTLMotionKeyframeData, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setBuffer :: inline (self: *MTLMotionKeyframeData, buffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setBuffer:");
        return xx (cast((*MTLMotionKeyframeData, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, buffer);
    }

    offset :: inline (self: *MTLMotionKeyframeData) -> NSUInteger {
        sel := sel_registerName2("offset");
        return xx (cast((*MTLMotionKeyframeData, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setOffset :: inline (self: *MTLMotionKeyframeData, offset: NSUInteger) -> void {
        sel := sel_registerName2("setOffset:");
        return xx (cast((*MTLMotionKeyframeData, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, offset);
    }
}

MTLAccelerationStructureMotionTriangleGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureMotionTriangleGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    vertexBuffers :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        sel := sel_registerName2("vertexBuffers");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> *NSArray(*MTLMotionKeyframeData) #c_call)objc_msgSend)(self, sel);
    }
    setVertexBuffers :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        sel := sel_registerName2("setVertexBuffers:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, *NSArray(*MTLMotionKeyframeData)) -> void #c_call)objc_msgSend)(self, sel, vertexBuffers);
    }

    vertexFormat :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("vertexFormat");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setVertexFormat :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setVertexFormat:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, vertexFormat);
    }

    vertexStride :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("vertexStride");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setVertexStride :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        sel := sel_registerName2("setVertexStride:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, vertexStride);
    }

    indexBuffer :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexBufferOffset :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("indexBufferOffset");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndexBufferOffset :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIndexBufferOffset:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indexBufferOffset);
    }

    indexType :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    triangleCount :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("triangleCount");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTriangleCount :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        sel := sel_registerName2("setTriangleCount:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, triangleCount);
    }

    transformationMatrixBuffer :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("transformationMatrixBuffer");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBuffer :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setTransformationMatrixBuffer:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBuffer);
    }

    transformationMatrixBufferOffset :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("transformationMatrixBufferOffset");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBufferOffset :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setTransformationMatrixBufferOffset:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBufferOffset);
    }

    transformationMatrixLayout :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("transformationMatrixLayout");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixLayout :: inline (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setTransformationMatrixLayout:");
        return xx (cast((*MTLAccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixLayout);
    }
}

MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    boundingBoxBuffers :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        sel := sel_registerName2("boundingBoxBuffers");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> *NSArray(*MTLMotionKeyframeData) #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxBuffers :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        sel := sel_registerName2("setBoundingBoxBuffers:");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, *NSArray(*MTLMotionKeyframeData)) -> void #c_call)objc_msgSend)(self, sel, boundingBoxBuffers);
    }

    boundingBoxStride :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxStride");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxStride :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxStride:");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxStride);
    }

    boundingBoxCount :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxCount");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxCount :: inline (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxCount:");
        return xx (cast((*MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxCount);
    }
}

MTLCurveType :: enum NSInteger {
    Round :: 0;

    Flat  :: 1;
}

MTLCurveBasis :: enum NSInteger {
    BSpline    :: 0;

    CatmullRom :: 1;

    Linear     :: 2;

    Bezier     :: 3;
}

MTLCurveEndCaps :: enum NSInteger {
    None   :: 0;

    Disk   :: 1;

    Sphere :: 2;
}

MTLAccelerationStructureCurveGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureCurveGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureCurveGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureCurveGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    controlPointBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("controlPointBuffer");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setControlPointBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setControlPointBuffer:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, controlPointBuffer);
    }

    controlPointBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointBufferOffset");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointBufferOffset:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointBufferOffset);
    }

    controlPointCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointCount");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointCount:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointCount);
    }

    controlPointStride :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointStride");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointStride :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointStride:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointStride);
    }

    controlPointFormat :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("controlPointFormat");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setControlPointFormat :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setControlPointFormat:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, controlPointFormat);
    }

    radiusBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("radiusBuffer");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setRadiusBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setRadiusBuffer:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, radiusBuffer);
    }

    radiusBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("radiusBufferOffset");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRadiusBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setRadiusBufferOffset:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, radiusBufferOffset);
    }

    radiusFormat :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("radiusFormat");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setRadiusFormat :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setRadiusFormat:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, radiusFormat);
    }

    radiusStride :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("radiusStride");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRadiusStride :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        sel := sel_registerName2("setRadiusStride:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, radiusStride);
    }

    indexBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("indexBufferOffset");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndexBufferOffset :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIndexBufferOffset:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indexBufferOffset);
    }

    indexType :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    segmentCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentCount");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentCount:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentCount);
    }

    segmentControlPointCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentControlPointCount");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentControlPointCount :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentControlPointCount:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentControlPointCount);
    }

    curveType :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        sel := sel_registerName2("curveType");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveType #c_call)objc_msgSend)(self, sel);
    }
    setCurveType :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        sel := sel_registerName2("setCurveType:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveType) -> void #c_call)objc_msgSend)(self, sel, curveType);
    }

    curveBasis :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        sel := sel_registerName2("curveBasis");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveBasis #c_call)objc_msgSend)(self, sel);
    }
    setCurveBasis :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        sel := sel_registerName2("setCurveBasis:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveBasis) -> void #c_call)objc_msgSend)(self, sel, curveBasis);
    }

    curveEndCaps :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        sel := sel_registerName2("curveEndCaps");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveEndCaps #c_call)objc_msgSend)(self, sel);
    }
    setCurveEndCaps :: inline (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        sel := sel_registerName2("setCurveEndCaps:");
        return xx (cast((*MTLAccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveEndCaps) -> void #c_call)objc_msgSend)(self, sel, curveEndCaps);
    }
}

MTLAccelerationStructureMotionCurveGeometryDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuregeometrydescriptor: MTLAccelerationStructureGeometryDescriptor;

    descriptor :: inline () -> *MTLAccelerationStructureMotionCurveGeometryDescriptor {
        class := objc_getClass("MTLAccelerationStructureMotionCurveGeometryDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructureMotionCurveGeometryDescriptor #c_call)objc_msgSend)(class, sel);
    }

    controlPointBuffers :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        sel := sel_registerName2("controlPointBuffers");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> *NSArray(*MTLMotionKeyframeData) #c_call)objc_msgSend)(self, sel);
    }
    setControlPointBuffers :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        sel := sel_registerName2("setControlPointBuffers:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, *NSArray(*MTLMotionKeyframeData)) -> void #c_call)objc_msgSend)(self, sel, controlPointBuffers);
    }

    controlPointCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointCount");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointCount:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointCount);
    }

    controlPointStride :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointStride");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointStride :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointStride:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointStride);
    }

    controlPointFormat :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("controlPointFormat");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setControlPointFormat :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setControlPointFormat:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, controlPointFormat);
    }

    radiusBuffers :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        sel := sel_registerName2("radiusBuffers");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> *NSArray(*MTLMotionKeyframeData) #c_call)objc_msgSend)(self, sel);
    }
    setRadiusBuffers :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        sel := sel_registerName2("setRadiusBuffers:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, *NSArray(*MTLMotionKeyframeData)) -> void #c_call)objc_msgSend)(self, sel, radiusBuffers);
    }

    radiusFormat :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("radiusFormat");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setRadiusFormat :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setRadiusFormat:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, radiusFormat);
    }

    radiusStride :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("radiusStride");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRadiusStride :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        sel := sel_registerName2("setRadiusStride:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, radiusStride);
    }

    indexBuffer :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexBufferOffset :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("indexBufferOffset");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIndexBufferOffset :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIndexBufferOffset:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indexBufferOffset);
    }

    indexType :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    segmentCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentCount");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentCount:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentCount);
    }

    segmentControlPointCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentControlPointCount");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentControlPointCount :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentControlPointCount:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentControlPointCount);
    }

    curveType :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        sel := sel_registerName2("curveType");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveType #c_call)objc_msgSend)(self, sel);
    }
    setCurveType :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        sel := sel_registerName2("setCurveType:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveType) -> void #c_call)objc_msgSend)(self, sel, curveType);
    }

    curveBasis :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        sel := sel_registerName2("curveBasis");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveBasis #c_call)objc_msgSend)(self, sel);
    }
    setCurveBasis :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        sel := sel_registerName2("setCurveBasis:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveBasis) -> void #c_call)objc_msgSend)(self, sel, curveBasis);
    }

    curveEndCaps :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        sel := sel_registerName2("curveEndCaps");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveEndCaps #c_call)objc_msgSend)(self, sel);
    }
    setCurveEndCaps :: inline (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        sel := sel_registerName2("setCurveEndCaps:");
        return xx (cast((*MTLAccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveEndCaps) -> void #c_call)objc_msgSend)(self, sel, curveEndCaps);
    }
}

MTLAccelerationStructureInstanceDescriptor :: struct #type_info_none {
    transformationMatrix:            MTLPackedFloat4x3;

    options:                         MTLAccelerationStructureInstanceOptions;

    mask:                            u32;

    intersectionFunctionTableOffset: u32;

    accelerationStructureIndex:      u32;
}

MTLAccelerationStructureUserIDInstanceDescriptor :: struct #type_info_none {
    transformationMatrix:            MTLPackedFloat4x3;

    options:                         MTLAccelerationStructureInstanceOptions;

    mask:                            u32;

    intersectionFunctionTableOffset: u32;

    accelerationStructureIndex:      u32;

    userID:                          u32;
}

MTLAccelerationStructureInstanceDescriptorType :: enum NSUInteger {
    Default        :: 0;

    UserID         :: 1;

    Motion         :: 2;

    Indirect       :: 3;

    IndirectMotion :: 4;
}

MTLAccelerationStructureMotionInstanceDescriptor :: struct #type_info_none {
    options:                         MTLAccelerationStructureInstanceOptions;

    mask:                            u32;

    intersectionFunctionTableOffset: u32;

    accelerationStructureIndex:      u32;

    userID:                          u32;

    motionTransformsStartIndex:      u32;

    motionTransformsCount:           u32;

    motionStartBorderMode:           MTLMotionBorderMode;

    motionEndBorderMode:             MTLMotionBorderMode;

    motionStartTime:                 float;

    motionEndTime:                   float;
}

MTLIndirectAccelerationStructureInstanceDescriptor :: struct #type_info_none {
    transformationMatrix:            MTLPackedFloat4x3;

    options:                         MTLAccelerationStructureInstanceOptions;

    mask:                            u32;

    intersectionFunctionTableOffset: u32;

    userID:                          u32;

    accelerationStructureID:         MTLResourceID;
}

MTLIndirectAccelerationStructureMotionInstanceDescriptor :: struct #type_info_none {
    options:                         MTLAccelerationStructureInstanceOptions;

    mask:                            u32;

    intersectionFunctionTableOffset: u32;

    userID:                          u32;

    accelerationStructureID:         MTLResourceID;

    motionTransformsStartIndex:      u32;

    motionTransformsCount:           u32;

    motionStartBorderMode:           MTLMotionBorderMode;

    motionEndBorderMode:             MTLMotionBorderMode;

    motionStartTime:                 float;

    motionEndTime:                   float;
}

MTLTransformType :: enum NSInteger {
    PackedFloat4x3 :: 0;

    Component      :: 1;
}

MTLInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuredescriptor: MTLAccelerationStructureDescriptor;

    descriptor :: inline () -> *MTLInstanceAccelerationStructureDescriptor {
        class := objc_getClass("MTLInstanceAccelerationStructureDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLInstanceAccelerationStructureDescriptor #c_call)objc_msgSend)(class, sel);
    }

    instanceDescriptorBuffer :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("instanceDescriptorBuffer");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBuffer :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setInstanceDescriptorBuffer:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBuffer);
    }

    instanceDescriptorBufferOffset :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorBufferOffset");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBufferOffset :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorBufferOffset:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBufferOffset);
    }

    instanceDescriptorStride :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorStride");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorStride :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorStride:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorStride);
    }

    instanceCount :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceCount");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceCount :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceCount:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceCount);
    }

    instancedAccelerationStructures :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructure) {
        sel := sel_registerName2("instancedAccelerationStructures");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> *NSArray(*MTLAccelerationStructure) #c_call)objc_msgSend)(self, sel);
    }
    setInstancedAccelerationStructures :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instancedAccelerationStructures: *NSArray(*MTLAccelerationStructure)) -> void {
        sel := sel_registerName2("setInstancedAccelerationStructures:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, *NSArray(*MTLAccelerationStructure)) -> void #c_call)objc_msgSend)(self, sel, instancedAccelerationStructures);
    }

    instanceDescriptorType :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        sel := sel_registerName2("instanceDescriptorType");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> MTLAccelerationStructureInstanceDescriptorType #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorType :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        sel := sel_registerName2("setInstanceDescriptorType:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, MTLAccelerationStructureInstanceDescriptorType) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorType);
    }

    motionTransformBuffer :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("motionTransformBuffer");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBuffer :: inline (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setMotionTransformBuffer:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, motionTransformBuffer);
    }

    motionTransformBufferOffset :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformBufferOffset");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBufferOffset :: inline (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformBufferOffset:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformBufferOffset);
    }

    motionTransformCount :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformCount");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformCount :: inline (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformCount:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformCount);
    }

    instanceTransformationMatrixLayout :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("instanceTransformationMatrixLayout");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setInstanceTransformationMatrixLayout :: inline (self: *MTLInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setInstanceTransformationMatrixLayout:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, instanceTransformationMatrixLayout);
    }

    motionTransformType :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        sel := sel_registerName2("motionTransformType");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> MTLTransformType #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformType :: inline (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        sel := sel_registerName2("setMotionTransformType:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, MTLTransformType) -> void #c_call)objc_msgSend)(self, sel, motionTransformType);
    }

    motionTransformStride :: inline (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformStride");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformStride :: inline (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformStride:");
        return xx (cast((*MTLInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformStride);
    }
}

MTLIndirectInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuredescriptor: MTLAccelerationStructureDescriptor;

    descriptor :: inline () -> *MTLIndirectInstanceAccelerationStructureDescriptor {
        class := objc_getClass("MTLIndirectInstanceAccelerationStructureDescriptor");
        sel := sel_registerName2("descriptor");
        return xx (cast((Class, Selector) -> *MTLIndirectInstanceAccelerationStructureDescriptor #c_call)objc_msgSend)(class, sel);
    }

    instanceDescriptorBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("instanceDescriptorBuffer");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setInstanceDescriptorBuffer:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBuffer);
    }

    instanceDescriptorBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorBufferOffset");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorBufferOffset:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBufferOffset);
    }

    instanceDescriptorStride :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorStride");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorStride :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorStride:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorStride);
    }

    maxInstanceCount :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxInstanceCount");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxInstanceCount :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxInstanceCount:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxInstanceCount);
    }

    instanceCountBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("instanceCountBuffer");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setInstanceCountBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setInstanceCountBuffer:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, instanceCountBuffer);
    }

    instanceCountBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceCountBufferOffset");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceCountBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceCountBufferOffset:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceCountBufferOffset);
    }

    instanceDescriptorType :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        sel := sel_registerName2("instanceDescriptorType");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLAccelerationStructureInstanceDescriptorType #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorType :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        sel := sel_registerName2("setInstanceDescriptorType:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, MTLAccelerationStructureInstanceDescriptorType) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorType);
    }

    motionTransformBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("motionTransformBuffer");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setMotionTransformBuffer:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, motionTransformBuffer);
    }

    motionTransformBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformBufferOffset");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformBufferOffset:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformBufferOffset);
    }

    maxMotionTransformCount :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxMotionTransformCount");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxMotionTransformCount :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxMotionTransformCount:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxMotionTransformCount);
    }

    motionTransformCountBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("motionTransformCountBuffer");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformCountBuffer :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setMotionTransformCountBuffer:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, motionTransformCountBuffer);
    }

    motionTransformCountBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformCountBufferOffset");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformCountBufferOffset :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformCountBufferOffset:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformCountBufferOffset);
    }

    instanceTransformationMatrixLayout :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("instanceTransformationMatrixLayout");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setInstanceTransformationMatrixLayout :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setInstanceTransformationMatrixLayout:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, instanceTransformationMatrixLayout);
    }

    motionTransformType :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        sel := sel_registerName2("motionTransformType");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLTransformType #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformType :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        sel := sel_registerName2("setMotionTransformType:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, MTLTransformType) -> void #c_call)objc_msgSend)(self, sel, motionTransformType);
    }

    motionTransformStride :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformStride");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformStride :: inline (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformStride:");
        return xx (cast((*MTLIndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformStride);
    }
}

MTLAccelerationStructure :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    size :: inline (self: *MTLAccelerationStructure) -> NSUInteger {
        sel := sel_registerName2("size");
        return xx (cast((*MTLAccelerationStructure, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLAccelerationStructure) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLAccelerationStructure, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLHeapType :: enum NSInteger {
    Automatic :: 0;
    Placement :: 1;
    Sparse    :: 2;
}

MTLHeapDescriptor :: struct #type_info_none {
    size :: inline (self: *MTLHeapDescriptor) -> NSUInteger {
        sel := sel_registerName2("size");
        return xx (cast((*MTLHeapDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSize :: inline (self: *MTLHeapDescriptor, size: NSUInteger) -> void {
        sel := sel_registerName2("setSize:");
        return xx (cast((*MTLHeapDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, size);
    }

    storageMode :: inline (self: *MTLHeapDescriptor) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }
    setStorageMode :: inline (self: *MTLHeapDescriptor, storageMode: MTLStorageMode) -> void {
        sel := sel_registerName2("setStorageMode:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLStorageMode) -> void #c_call)objc_msgSend)(self, sel, storageMode);
    }

    cpuCacheMode :: inline (self: *MTLHeapDescriptor) -> MTLCPUCacheMode {
        sel := sel_registerName2("cpuCacheMode");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLCPUCacheMode #c_call)objc_msgSend)(self, sel);
    }
    setCpuCacheMode :: inline (self: *MTLHeapDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        sel := sel_registerName2("setCpuCacheMode:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLCPUCacheMode) -> void #c_call)objc_msgSend)(self, sel, cpuCacheMode);
    }

    sparsePageSize :: inline (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        sel := sel_registerName2("sparsePageSize");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLSparsePageSize #c_call)objc_msgSend)(self, sel);
    }
    setSparsePageSize :: inline (self: *MTLHeapDescriptor, sparsePageSize: MTLSparsePageSize) -> void {
        sel := sel_registerName2("setSparsePageSize:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLSparsePageSize) -> void #c_call)objc_msgSend)(self, sel, sparsePageSize);
    }

    hazardTrackingMode :: inline (self: *MTLHeapDescriptor) -> MTLHazardTrackingMode {
        sel := sel_registerName2("hazardTrackingMode");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLHazardTrackingMode #c_call)objc_msgSend)(self, sel);
    }
    setHazardTrackingMode :: inline (self: *MTLHeapDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        sel := sel_registerName2("setHazardTrackingMode:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLHazardTrackingMode) -> void #c_call)objc_msgSend)(self, sel, hazardTrackingMode);
    }

    resourceOptions :: inline (self: *MTLHeapDescriptor) -> MTLResourceOptions {
        sel := sel_registerName2("resourceOptions");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLResourceOptions #c_call)objc_msgSend)(self, sel);
    }
    setResourceOptions :: inline (self: *MTLHeapDescriptor, resourceOptions: MTLResourceOptions) -> void {
        sel := sel_registerName2("setResourceOptions:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLResourceOptions) -> void #c_call)objc_msgSend)(self, sel, resourceOptions);
    }

    type :: inline (self: *MTLHeapDescriptor) -> MTLHeapType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLHeapType #c_call)objc_msgSend)(self, sel);
    }
    setType :: inline (self: *MTLHeapDescriptor, type: MTLHeapType) -> void {
        sel := sel_registerName2("setType:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLHeapType) -> void #c_call)objc_msgSend)(self, sel, type);
    }

    maxCompatiblePlacementSparsePageSize :: inline (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        sel := sel_registerName2("maxCompatiblePlacementSparsePageSize");
        return xx (cast((*MTLHeapDescriptor, Selector) -> MTLSparsePageSize #c_call)objc_msgSend)(self, sel);
    }
    setMaxCompatiblePlacementSparsePageSize :: inline (self: *MTLHeapDescriptor, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> void {
        sel := sel_registerName2("setMaxCompatiblePlacementSparsePageSize:");
        return xx (cast((*MTLHeapDescriptor, Selector, MTLSparsePageSize) -> void #c_call)objc_msgSend)(self, sel, maxCompatiblePlacementSparsePageSize);
    }
}

MTLHeap :: struct #type_info_none {
    #as using mtlallocation: MTLAllocation;

    maxAvailableSizeWithAlignment :: inline (self: *MTLHeap, alignment: NSUInteger) -> NSUInteger {
        sel := sel_registerName2("maxAvailableSizeWithAlignment:");
        return xx (cast((*MTLHeap, Selector, NSUInteger) -> NSUInteger #c_call)objc_msgSend)(self, sel, alignment);
    }

    newBufferWithLength :: inline (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithLength:options:");
        return xx (cast((*MTLHeap, Selector, NSUInteger, MTLResourceOptions) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, length, options);
    }

    newTextureWithDescriptor :: inline (self: *MTLHeap, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        sel := sel_registerName2("newTextureWithDescriptor:");
        return xx (cast((*MTLHeap, Selector, *MTLTextureDescriptor) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor);
    }

    setPurgeableState :: inline (self: *MTLHeap, state: MTLPurgeableState) -> MTLPurgeableState {
        sel := sel_registerName2("setPurgeableState:");
        return xx (cast((*MTLHeap, Selector, MTLPurgeableState) -> MTLPurgeableState #c_call)objc_msgSend)(self, sel, state);
    }

    newBufferWithLength :: inline (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer {
        sel := sel_registerName2("newBufferWithLength:options:offset:");
        return xx (cast((*MTLHeap, Selector, NSUInteger, MTLResourceOptions, NSUInteger) -> *MTLBuffer #c_call)objc_msgSend)(self, sel, length, options, offset);
    }

    newTextureWithDescriptor :: inline (self: *MTLHeap, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture {
        sel := sel_registerName2("newTextureWithDescriptor:offset:");
        return xx (cast((*MTLHeap, Selector, *MTLTextureDescriptor, NSUInteger) -> *MTLTexture #c_call)objc_msgSend)(self, sel, descriptor, offset);
    }

    newAccelerationStructureWithSize :: inline (self: *MTLHeap, size: NSUInteger) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithSize:");
        return xx (cast((*MTLHeap, Selector, NSUInteger) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, size);
    }

    newAccelerationStructureWithDescriptor :: inline (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithDescriptor:");
        return xx (cast((*MTLHeap, Selector, *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, descriptor);
    }

    newAccelerationStructureWithSize :: inline (self: *MTLHeap, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithSize:offset:");
        return xx (cast((*MTLHeap, Selector, NSUInteger, NSUInteger) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, size, offset);
    }

    newAccelerationStructureWithDescriptor :: inline (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure {
        sel := sel_registerName2("newAccelerationStructureWithDescriptor:offset:");
        return xx (cast((*MTLHeap, Selector, *MTLAccelerationStructureDescriptor, NSUInteger) -> *MTLAccelerationStructure #c_call)objc_msgSend)(self, sel, descriptor, offset);
    }

    label :: inline (self: *MTLHeap) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLHeap, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLHeap, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLHeap, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLHeap) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLHeap, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    storageMode :: inline (self: *MTLHeap) -> MTLStorageMode {
        sel := sel_registerName2("storageMode");
        return xx (cast((*MTLHeap, Selector) -> MTLStorageMode #c_call)objc_msgSend)(self, sel);
    }

    cpuCacheMode :: inline (self: *MTLHeap) -> MTLCPUCacheMode {
        sel := sel_registerName2("cpuCacheMode");
        return xx (cast((*MTLHeap, Selector) -> MTLCPUCacheMode #c_call)objc_msgSend)(self, sel);
    }

    hazardTrackingMode :: inline (self: *MTLHeap) -> MTLHazardTrackingMode {
        sel := sel_registerName2("hazardTrackingMode");
        return xx (cast((*MTLHeap, Selector) -> MTLHazardTrackingMode #c_call)objc_msgSend)(self, sel);
    }

    resourceOptions :: inline (self: *MTLHeap) -> MTLResourceOptions {
        sel := sel_registerName2("resourceOptions");
        return xx (cast((*MTLHeap, Selector) -> MTLResourceOptions #c_call)objc_msgSend)(self, sel);
    }

    size :: inline (self: *MTLHeap) -> NSUInteger {
        sel := sel_registerName2("size");
        return xx (cast((*MTLHeap, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    usedSize :: inline (self: *MTLHeap) -> NSUInteger {
        sel := sel_registerName2("usedSize");
        return xx (cast((*MTLHeap, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    currentAllocatedSize :: inline (self: *MTLHeap) -> NSUInteger {
        sel := sel_registerName2("currentAllocatedSize");
        return xx (cast((*MTLHeap, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    type :: inline (self: *MTLHeap) -> MTLHeapType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLHeap, Selector) -> MTLHeapType #c_call)objc_msgSend)(self, sel);
    }
}

MTLAttributeStrideStatic: NSUInteger : 18446744073709551615;

MTLArgumentEncoder :: struct #type_info_none {
    setArgumentBuffer :: inline (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> void {
        sel := sel_registerName2("setArgumentBuffer:offset:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, argumentBuffer, offset);
    }

    setArgumentBuffer :: inline (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> void {
        sel := sel_registerName2("setArgumentBuffer:startOffset:arrayElement:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, argumentBuffer, startOffset, arrayElement);
    }

    setBuffer :: inline (self: *MTLArgumentEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBuffer:offset:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setBuffers :: inline (self: *MTLArgumentEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setBuffers:offsets:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setTexture :: inline (self: *MTLArgumentEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        sel := sel_registerName2("setTexture:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLTexture, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setTextures :: inline (self: *MTLArgumentEncoder, textures: **MTLTexture, range: NSRange) -> void {
        sel := sel_registerName2("setTextures:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLTexture, NSRange) -> void #c_call)objc_msgSend)(self, sel, textures, range);
    }

    setSamplerState :: inline (self: *MTLArgumentEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        sel := sel_registerName2("setSamplerState:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLSamplerState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sampler, index);
    }

    setSamplerStates :: inline (self: *MTLArgumentEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        sel := sel_registerName2("setSamplerStates:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLSamplerState, NSRange) -> void #c_call)objc_msgSend)(self, sel, samplers, range);
    }

    constantDataAtIndex :: inline (self: *MTLArgumentEncoder, index: NSUInteger) -> *void {
        sel := sel_registerName2("constantDataAtIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, NSUInteger) -> *void #c_call)objc_msgSend)(self, sel, index);
    }

    setRenderPipelineState :: inline (self: *MTLArgumentEncoder, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> void {
        sel := sel_registerName2("setRenderPipelineState:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLRenderPipelineState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pipeline, index);
    }

    setRenderPipelineStates :: inline (self: *MTLArgumentEncoder, pipelines: **MTLRenderPipelineState, range: NSRange) -> void {
        sel := sel_registerName2("setRenderPipelineStates:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLRenderPipelineState, NSRange) -> void #c_call)objc_msgSend)(self, sel, pipelines, range);
    }

    setComputePipelineState :: inline (self: *MTLArgumentEncoder, pipeline: *MTLComputePipelineState, index: NSUInteger) -> void {
        sel := sel_registerName2("setComputePipelineState:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLComputePipelineState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pipeline, index);
    }

    setComputePipelineStates :: inline (self: *MTLArgumentEncoder, pipelines: **MTLComputePipelineState, range: NSRange) -> void {
        sel := sel_registerName2("setComputePipelineStates:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLComputePipelineState, NSRange) -> void #c_call)objc_msgSend)(self, sel, pipelines, range);
    }

    setIndirectCommandBuffer :: inline (self: *MTLArgumentEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> void {
        sel := sel_registerName2("setIndirectCommandBuffer:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLIndirectCommandBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, index);
    }

    setIndirectCommandBuffers :: inline (self: *MTLArgumentEncoder, buffers: **MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("setIndirectCommandBuffers:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, range);
    }

    setAccelerationStructure :: inline (self: *MTLArgumentEncoder, accelerationStructure: *MTLAccelerationStructure, index: NSUInteger) -> void {
        sel := sel_registerName2("setAccelerationStructure:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLAccelerationStructure, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, index);
    }

    newArgumentEncoderForBufferAtIndex :: inline (self: *MTLArgumentEncoder, index: NSUInteger) -> *MTLArgumentEncoder {
        sel := sel_registerName2("newArgumentEncoderForBufferAtIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, NSUInteger) -> *MTLArgumentEncoder #c_call)objc_msgSend)(self, sel, index);
    }

    setVisibleFunctionTable :: inline (self: *MTLArgumentEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> void {
        sel := sel_registerName2("setVisibleFunctionTable:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, visibleFunctionTable, index);
    }

    setVisibleFunctionTables :: inline (self: *MTLArgumentEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setVisibleFunctionTables:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, visibleFunctionTables, range);
    }

    setIntersectionFunctionTable :: inline (self: *MTLArgumentEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> void {
        sel := sel_registerName2("setIntersectionFunctionTable:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLIntersectionFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTable, index);
    }

    setIntersectionFunctionTables :: inline (self: *MTLArgumentEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        sel := sel_registerName2("setIntersectionFunctionTables:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLIntersectionFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTables, range);
    }

    setDepthStencilState :: inline (self: *MTLArgumentEncoder, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> void {
        sel := sel_registerName2("setDepthStencilState:atIndex:");
        return xx (cast((*MTLArgumentEncoder, Selector, *MTLDepthStencilState, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, depthStencilState, index);
    }

    setDepthStencilStates :: inline (self: *MTLArgumentEncoder, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> void {
        sel := sel_registerName2("setDepthStencilStates:withRange:");
        return xx (cast((*MTLArgumentEncoder, Selector, **MTLDepthStencilState, NSRange) -> void #c_call)objc_msgSend)(self, sel, depthStencilStates, range);
    }

    device :: inline (self: *MTLArgumentEncoder) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLArgumentEncoder, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLArgumentEncoder) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLArgumentEncoder, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLArgumentEncoder, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLArgumentEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    encodedLength :: inline (self: *MTLArgumentEncoder) -> NSUInteger {
        sel := sel_registerName2("encodedLength");
        return xx (cast((*MTLArgumentEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    alignment :: inline (self: *MTLArgumentEncoder) -> NSUInteger {
        sel := sel_registerName2("alignment");
        return xx (cast((*MTLArgumentEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTL4VisibilityOptions :: NSUInteger;
MTL4VisibilityOption :: enum MTL4VisibilityOptions {
    None          :: 0;

    Device        :: 1;

    ResourceAlias :: 2;
}

MTL4CommandEncoder :: struct #type_info_none {
    barrierAfterQueueStages :: inline (self: *MTL4CommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        sel := sel_registerName2("barrierAfterQueueStages:beforeStages:visibilityOptions:");
        return xx (cast((*MTL4CommandEncoder, Selector, MTLStages, MTLStages, MTL4VisibilityOptions) -> void #c_call)objc_msgSend)(self, sel, afterQueueStages, beforeStages, visibilityOptions);
    }

    barrierAfterStages :: inline (self: *MTL4CommandEncoder, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        sel := sel_registerName2("barrierAfterStages:beforeQueueStages:visibilityOptions:");
        return xx (cast((*MTL4CommandEncoder, Selector, MTLStages, MTLStages, MTL4VisibilityOptions) -> void #c_call)objc_msgSend)(self, sel, afterStages, beforeQueueStages, visibilityOptions);
    }

    barrierAfterEncoderStages :: inline (self: *MTL4CommandEncoder, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        sel := sel_registerName2("barrierAfterEncoderStages:beforeEncoderStages:visibilityOptions:");
        return xx (cast((*MTL4CommandEncoder, Selector, MTLStages, MTLStages, MTL4VisibilityOptions) -> void #c_call)objc_msgSend)(self, sel, afterEncoderStages, beforeEncoderStages, visibilityOptions);
    }

    updateFence :: inline (self: *MTL4CommandEncoder, fence: *MTLFence, afterEncoderStages: MTLStages) -> void {
        sel := sel_registerName2("updateFence:afterEncoderStages:");
        return xx (cast((*MTL4CommandEncoder, Selector, *MTLFence, MTLStages) -> void #c_call)objc_msgSend)(self, sel, fence, afterEncoderStages);
    }

    waitForFence :: inline (self: *MTL4CommandEncoder, fence: *MTLFence, beforeEncoderStages: MTLStages) -> void {
        sel := sel_registerName2("waitForFence:beforeEncoderStages:");
        return xx (cast((*MTL4CommandEncoder, Selector, *MTLFence, MTLStages) -> void #c_call)objc_msgSend)(self, sel, fence, beforeEncoderStages);
    }

    insertDebugSignpost :: inline (self: *MTL4CommandEncoder, _string: *NSString) -> void {
        sel := sel_registerName2("insertDebugSignpost:");
        return xx (cast((*MTL4CommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    pushDebugGroup :: inline (self: *MTL4CommandEncoder, _string: *NSString) -> void {
        sel := sel_registerName2("pushDebugGroup:");
        return xx (cast((*MTL4CommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    popDebugGroup :: inline (self: *MTL4CommandEncoder) -> void {
        sel := sel_registerName2("popDebugGroup");
        return xx (cast((*MTL4CommandEncoder, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    endEncoding :: inline (self: *MTL4CommandEncoder) -> void {
        sel := sel_registerName2("endEncoding");
        return xx (cast((*MTL4CommandEncoder, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4CommandEncoder) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandEncoder, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CommandEncoder, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CommandEncoder, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    commandBuffer :: inline (self: *MTL4CommandEncoder) -> *MTL4CommandBuffer {
        sel := sel_registerName2("commandBuffer");
        return xx (cast((*MTL4CommandEncoder, Selector) -> *MTL4CommandBuffer #c_call)objc_msgSend)(self, sel);
    }
}

MTL4RenderEncoderOptions :: NSUInteger;
MTL4RenderEncoderOption :: enum MTL4RenderEncoderOptions {
    None       :: 0;

    Suspending :: 1;

    Resuming   :: 2;
}

MTL4RenderCommandEncoder :: struct #type_info_none {
    #as using mtl4commandencoder: MTL4CommandEncoder;

    setColorAttachmentMap :: inline (self: *MTL4RenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        sel := sel_registerName2("setColorAttachmentMap:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call)objc_msgSend)(self, sel, mapping);
    }

    setRenderPipelineState :: inline (self: *MTL4RenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        sel := sel_registerName2("setRenderPipelineState:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLRenderPipelineState) -> void #c_call)objc_msgSend)(self, sel, pipelineState);
    }

    setViewport :: inline (self: *MTL4RenderCommandEncoder, viewport: MTLViewport) -> void {
        sel := sel_registerName2("setViewport:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLViewport) -> void #c_call)objc_msgSend)(self, sel, viewport);
    }

    setViewports :: inline (self: *MTL4RenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        sel := sel_registerName2("setViewports:count:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLViewport, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, viewports, count);
    }

    setVertexAmplificationCount :: inline (self: *MTL4RenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        sel := sel_registerName2("setVertexAmplificationCount:viewMappings:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, NSUInteger, *MTLVertexAmplificationViewMapping) -> void #c_call)objc_msgSend)(self, sel, count, viewMappings);
    }

    setCullMode :: inline (self: *MTL4RenderCommandEncoder, cullMode: MTLCullMode) -> void {
        sel := sel_registerName2("setCullMode:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLCullMode) -> void #c_call)objc_msgSend)(self, sel, cullMode);
    }

    setDepthClipMode :: inline (self: *MTL4RenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        sel := sel_registerName2("setDepthClipMode:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLDepthClipMode) -> void #c_call)objc_msgSend)(self, sel, depthClipMode);
    }

    setDepthBias :: inline (self: *MTL4RenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> void {
        sel := sel_registerName2("setDepthBias:slopeScale:clamp:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, float, float, float) -> void #c_call)objc_msgSend)(self, sel, depthBias, slopeScale, clamp);
    }

    setDepthTestMinBound :: inline (self: *MTL4RenderCommandEncoder, minBound: float, maxBound: float) -> void {
        sel := sel_registerName2("setDepthTestMinBound:maxBound:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, float, float) -> void #c_call)objc_msgSend)(self, sel, minBound, maxBound);
    }

    setScissorRect :: inline (self: *MTL4RenderCommandEncoder, rect: MTLScissorRect) -> void {
        sel := sel_registerName2("setScissorRect:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLScissorRect) -> void #c_call)objc_msgSend)(self, sel, rect);
    }

    setScissorRects :: inline (self: *MTL4RenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        sel := sel_registerName2("setScissorRects:count:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLScissorRect, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, scissorRects, count);
    }

    setTriangleFillMode :: inline (self: *MTL4RenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        sel := sel_registerName2("setTriangleFillMode:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLTriangleFillMode) -> void #c_call)objc_msgSend)(self, sel, fillMode);
    }

    setBlendColorRed :: inline (self: *MTL4RenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> void {
        sel := sel_registerName2("setBlendColorRed:green:blue:alpha:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, float, float, float, float) -> void #c_call)objc_msgSend)(self, sel, red, green, blue, alpha);
    }

    setDepthStencilState :: inline (self: *MTL4RenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        sel := sel_registerName2("setDepthStencilState:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLDepthStencilState) -> void #c_call)objc_msgSend)(self, sel, depthStencilState);
    }

    setStencilReferenceValue :: inline (self: *MTL4RenderCommandEncoder, referenceValue: u32) -> void {
        sel := sel_registerName2("setStencilReferenceValue:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, u32) -> void #c_call)objc_msgSend)(self, sel, referenceValue);
    }

    setStencilFrontReferenceValue :: inline (self: *MTL4RenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        sel := sel_registerName2("setStencilFrontReferenceValue:backReferenceValue:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, u32, u32) -> void #c_call)objc_msgSend)(self, sel, frontReferenceValue, backReferenceValue);
    }

    setVisibilityResultMode :: inline (self: *MTL4RenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        sel := sel_registerName2("setVisibilityResultMode:offset:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLVisibilityResultMode, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, mode, offset);
    }

    setColorStoreAction :: inline (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setColorStoreAction:atIndex:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLStoreAction, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction :: inline (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setDepthStoreAction:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    setStencilStoreAction :: inline (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        sel := sel_registerName2("setStencilStoreAction:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLStoreAction) -> void #c_call)objc_msgSend)(self, sel, storeAction);
    }

    drawPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount);
    }

    drawPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:instanceCount:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount, instanceCount);
    }

    drawPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

    drawIndexedPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferLength:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, MTLGPUAddress, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength);
    }

    drawIndexedPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferLength:instanceCount:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, MTLGPUAddress, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount);
    }

    drawIndexedPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferLength:instanceCount:baseVertex:baseInstance:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, MTLGPUAddress, NSUInteger, NSUInteger, NSInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount, baseVertex, baseInstance);
    }

    drawPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> void {
        sel := sel_registerName2("drawPrimitives:indirectBuffer:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, MTLGPUAddress) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indirectBuffer);
    }

    drawIndexedPrimitives :: inline (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexType:indexBuffer:indexBufferLength:indirectBuffer:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLPrimitiveType, MTLIndexType, MTLGPUAddress, NSUInteger, MTLGPUAddress) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexType, indexBuffer, indexBufferLength, indirectBuffer);
    }

    executeCommandsInBuffer :: inline (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:withRange:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer :: inline (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:indirectBuffer:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTLIndirectCommandBuffer, MTLGPUAddress) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, indirectRangeBuffer);
    }

    setObjectThreadgroupMemoryLength :: inline (self: *MTL4RenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }

    drawMeshThreadgroups :: inline (self: *MTL4RenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads :: inline (self: *MTL4RenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreadgroupsWithIndirectBuffer :: inline (self: *MTL4RenderCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreadgroupsWithIndirectBuffer:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLGPUAddress, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    dispatchThreadsPerTile :: inline (self: *MTL4RenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadsPerTile:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerTile);
    }

    setThreadgroupMemoryLength :: inline (self: *MTL4RenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:offset:atIndex:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, offset, index);
    }

    setArgumentTable :: inline (self: *MTL4RenderCommandEncoder, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> void {
        sel := sel_registerName2("setArgumentTable:atStages:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, *MTL4ArgumentTable, MTLRenderStages) -> void #c_call)objc_msgSend)(self, sel, argumentTable, stages);
    }

    setFrontFacingWinding :: inline (self: *MTL4RenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        sel := sel_registerName2("setFrontFacingWinding:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTLWinding) -> void #c_call)objc_msgSend)(self, sel, frontFacingWinding);
    }

    writeTimestampWithGranularity :: inline (self: *MTL4RenderCommandEncoder, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        sel := sel_registerName2("writeTimestampWithGranularity:afterStage:intoHeap:atIndex:");
        return xx (cast((*MTL4RenderCommandEncoder, Selector, MTL4TimestampGranularity, MTLRenderStages, *MTL4CounterHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, granularity, stage, counterHeap, index);
    }

    tileWidth :: inline (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        sel := sel_registerName2("tileWidth");
        return xx (cast((*MTL4RenderCommandEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    tileHeight :: inline (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        sel := sel_registerName2("tileHeight");
        return xx (cast((*MTL4RenderCommandEncoder, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTL4CommandBufferOptions :: struct #type_info_none {
    logState :: inline (self: *MTL4CommandBufferOptions) -> *MTLLogState {
        sel := sel_registerName2("logState");
        return xx (cast((*MTL4CommandBufferOptions, Selector) -> *MTLLogState #c_call)objc_msgSend)(self, sel);
    }
    setLogState :: inline (self: *MTL4CommandBufferOptions, logState: *MTLLogState) -> void {
        sel := sel_registerName2("setLogState:");
        return xx (cast((*MTL4CommandBufferOptions, Selector, *MTLLogState) -> void #c_call)objc_msgSend)(self, sel, logState);
    }
}

MTL4CommandBuffer :: struct #type_info_none {
    beginCommandBufferWithAllocator :: inline (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator) -> void {
        sel := sel_registerName2("beginCommandBufferWithAllocator:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4CommandAllocator) -> void #c_call)objc_msgSend)(self, sel, allocator);
    }

    beginCommandBufferWithAllocator :: inline (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> void {
        sel := sel_registerName2("beginCommandBufferWithAllocator:options:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4CommandAllocator, *MTL4CommandBufferOptions) -> void #c_call)objc_msgSend)(self, sel, allocator, options);
    }

    endCommandBuffer :: inline (self: *MTL4CommandBuffer) -> void {
        sel := sel_registerName2("endCommandBuffer");
        return xx (cast((*MTL4CommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    renderCommandEncoderWithDescriptor :: inline (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder {
        sel := sel_registerName2("renderCommandEncoderWithDescriptor:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder #c_call)objc_msgSend)(self, sel, descriptor);
    }

    renderCommandEncoderWithDescriptor :: inline (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder {
        sel := sel_registerName2("renderCommandEncoderWithDescriptor:options:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4RenderPassDescriptor, MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder #c_call)objc_msgSend)(self, sel, descriptor, options);
    }

    computeCommandEncoder :: inline (self: *MTL4CommandBuffer) -> *MTL4ComputeCommandEncoder {
        sel := sel_registerName2("computeCommandEncoder");
        return xx (cast((*MTL4CommandBuffer, Selector) -> *MTL4ComputeCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    machineLearningCommandEncoder :: inline (self: *MTL4CommandBuffer) -> *MTL4MachineLearningCommandEncoder {
        sel := sel_registerName2("machineLearningCommandEncoder");
        return xx (cast((*MTL4CommandBuffer, Selector) -> *MTL4MachineLearningCommandEncoder #c_call)objc_msgSend)(self, sel);
    }

    useResidencySet :: inline (self: *MTL4CommandBuffer, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("useResidencySet:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    useResidencySets :: inline (self: *MTL4CommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("useResidencySets:count:");
        return xx (cast((*MTL4CommandBuffer, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    pushDebugGroup :: inline (self: *MTL4CommandBuffer, _string: *NSString) -> void {
        sel := sel_registerName2("pushDebugGroup:");
        return xx (cast((*MTL4CommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    popDebugGroup :: inline (self: *MTL4CommandBuffer) -> void {
        sel := sel_registerName2("popDebugGroup");
        return xx (cast((*MTL4CommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    writeTimestampIntoHeap :: inline (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        sel := sel_registerName2("writeTimestampIntoHeap:atIndex:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4CounterHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, counterHeap, index);
    }

    resolveCounterHeap :: inline (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> void {
        sel := sel_registerName2("resolveCounterHeap:withRange:intoBuffer:waitFence:updateFence:");
        return xx (cast((*MTL4CommandBuffer, Selector, *MTL4CounterHeap, NSRange, MTL4BufferRange, *MTLFence, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, counterHeap, range, bufferRange, fenceToWait, fenceToUpdate);
    }

    device :: inline (self: *MTL4CommandBuffer) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4CommandBuffer, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4CommandBuffer) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandBuffer, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CommandBuffer, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLEvent :: struct #type_info_none {
    device :: inline (self: *MTLEvent) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLEvent, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLEvent) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLEvent, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLEvent, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLEvent, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLSharedEventListener :: struct #type_info_none {
    init :: inline (self: *$instancetype/MTLSharedEventListener) -> *instancetype {
        sel := sel_registerName2("init");
        return xx (cast((*MTLSharedEventListener, Selector) -> *instancetype #c_call)objc_msgSend)(self, sel);
    }
    initWithDispatchQueue :: inline (self: *$instancetype/MTLSharedEventListener, dispatchQueue: dispatch_queue_t) -> *instancetype {
        sel := sel_registerName2("initWithDispatchQueue:");
        return xx (cast((*MTLSharedEventListener, Selector, dispatch_queue_t) -> *instancetype #c_call)objc_msgSend)(self, sel, dispatchQueue);
    }

    sharedListener :: inline () -> *MTLSharedEventListener {
        class := objc_getClass("MTLSharedEventListener");
        sel := sel_registerName2("sharedListener");
        return xx (cast((Class, Selector) -> *MTLSharedEventListener #c_call)objc_msgSend)(class, sel);
    }

    dispatchQueue :: inline (self: *MTLSharedEventListener) -> dispatch_queue_t {
        sel := sel_registerName2("dispatchQueue");
        return xx (cast((*MTLSharedEventListener, Selector) -> dispatch_queue_t #c_call)objc_msgSend)(self, sel);
    }
}

MTLSharedEventNotificationBlock :: Block;

MTLSharedEvent :: struct #type_info_none {
    #as using mtlevent: MTLEvent;

    notifyListener :: inline (self: *MTLSharedEvent, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> void {
        sel := sel_registerName2("notifyListener:atValue:block:");
        return xx (cast((*MTLSharedEvent, Selector, *MTLSharedEventListener, u64, MTLSharedEventNotificationBlock) -> void #c_call)objc_msgSend)(self, sel, listener, value, block);
    }

    newSharedEventHandle :: inline (self: *MTLSharedEvent) -> *MTLSharedEventHandle {
        sel := sel_registerName2("newSharedEventHandle");
        return xx (cast((*MTLSharedEvent, Selector) -> *MTLSharedEventHandle #c_call)objc_msgSend)(self, sel);
    }

    waitUntilSignaledValue :: inline (self: *MTLSharedEvent, value: u64, milliseconds: u64) -> BOOL {
        sel := sel_registerName2("waitUntilSignaledValue:timeoutMS:");
        return xx (cast((*MTLSharedEvent, Selector, u64, u64) -> BOOL #c_call)objc_msgSend)(self, sel, value, milliseconds);
    }

    signaledValue :: inline (self: *MTLSharedEvent) -> u64 {
        sel := sel_registerName2("signaledValue");
        return xx (cast((*MTLSharedEvent, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }
    setSignaledValue :: inline (self: *MTLSharedEvent, signaledValue: u64) -> void #no_context {
        sel := sel_registerName2("setSignaledValue:");
        return xx (cast((*MTLSharedEvent, Selector, u64) -> void #c_call)objc_msgSend)(self, sel, signaledValue);
    }
}

MTLSharedEventHandle :: struct #type_info_none {
    #as using nssecurecoding: NSSecureCoding;

    label :: inline (self: *MTLSharedEventHandle) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLSharedEventHandle, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTL4CommitFeedbackHandler :: Block;

MTL4CommitFeedback :: struct #type_info_none {
    error :: inline (self: *MTL4CommitFeedback) -> *NSError #no_context {
        sel := sel_registerName2("error");
        return xx (cast((*MTL4CommitFeedback, Selector) -> *NSError #c_call)objc_msgSend)(self, sel);
    }

    GPUStartTime :: inline (self: *MTL4CommitFeedback) -> CFTimeInterval #no_context {
        sel := sel_registerName2("GPUStartTime");
        return xx (cast((*MTL4CommitFeedback, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }

    GPUEndTime :: inline (self: *MTL4CommitFeedback) -> CFTimeInterval #no_context {
        sel := sel_registerName2("GPUEndTime");
        return xx (cast((*MTL4CommitFeedback, Selector) -> CFTimeInterval #c_call)objc_msgSend)(self, sel);
    }
}

MTL4CommandQueueError :: enum NSInteger {
    None          :: 0;

    Timeout       :: 1;

    NotPermitted  :: 2;

    OutOfMemory   :: 3;

    DeviceRemoved :: 4;

    AccessRevoked :: 5;

    Internal      :: 6;
}

MTL4CommitOptions :: struct #type_info_none {
    addFeedbackHandler :: inline (self: *MTL4CommitOptions, block: MTL4CommitFeedbackHandler) -> void {
        sel := sel_registerName2("addFeedbackHandler:");
        return xx (cast((*MTL4CommitOptions, Selector, MTL4CommitFeedbackHandler) -> void #c_call)objc_msgSend)(self, sel, block);
    }
}

MTL4CommandQueueDescriptor :: struct #type_info_none {
    label :: inline (self: *MTL4CommandQueueDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandQueueDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CommandQueueDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CommandQueueDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    feedbackQueue :: inline (self: *MTL4CommandQueueDescriptor) -> dispatch_queue_t {
        sel := sel_registerName2("feedbackQueue");
        return xx (cast((*MTL4CommandQueueDescriptor, Selector) -> dispatch_queue_t #c_call)objc_msgSend)(self, sel);
    }
    setFeedbackQueue :: inline (self: *MTL4CommandQueueDescriptor, feedbackQueue: dispatch_queue_t) -> void {
        sel := sel_registerName2("setFeedbackQueue:");
        return xx (cast((*MTL4CommandQueueDescriptor, Selector, dispatch_queue_t) -> void #c_call)objc_msgSend)(self, sel, feedbackQueue);
    }
}

MTL4UpdateSparseTextureMappingOperation :: struct #type_info_none {
    mode:          MTLSparseTextureMappingMode;

    textureRegion: MTLRegion;

    textureLevel:  NSUInteger;

    textureSlice:  NSUInteger;

    heapOffset:    NSUInteger;
}

MTL4CopySparseTextureMappingOperation :: struct #type_info_none {
    sourceRegion:      MTLRegion;

    sourceLevel:       NSUInteger;

    sourceSlice:       NSUInteger;

    destinationOrigin: MTLOrigin;

    destinationLevel:  NSUInteger;

    destinationSlice:  NSUInteger;
}

MTL4UpdateSparseBufferMappingOperation :: struct #type_info_none {
    mode:        MTLSparseTextureMappingMode;

    bufferRange: NSRange;

    heapOffset:  NSUInteger;
}

MTL4CopySparseBufferMappingOperation :: struct #type_info_none {
    sourceRange:       NSRange;

    destinationOffset: NSUInteger;
}

MTL4CommandQueue :: struct #type_info_none {
    commit :: inline (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> void {
        sel := sel_registerName2("commit:count:");
        return xx (cast((*MTL4CommandQueue, Selector, **MTL4CommandBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, commandBuffers, count);
    }

    commit :: inline (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> void {
        sel := sel_registerName2("commit:count:options:");
        return xx (cast((*MTL4CommandQueue, Selector, **MTL4CommandBuffer, NSUInteger, *MTL4CommitOptions) -> void #c_call)objc_msgSend)(self, sel, commandBuffers, count, options);
    }

    signalEvent :: inline (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        sel := sel_registerName2("signalEvent:value:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    waitForEvent :: inline (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        sel := sel_registerName2("waitForEvent:value:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    signalDrawable :: inline (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        sel := sel_registerName2("signalDrawable:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLDrawable) -> void #c_call)objc_msgSend)(self, sel, drawable);
    }

    waitForDrawable :: inline (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        sel := sel_registerName2("waitForDrawable:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLDrawable) -> void #c_call)objc_msgSend)(self, sel, drawable);
    }

    addResidencySet :: inline (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("addResidencySet:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    addResidencySets :: inline (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("addResidencySets:count:");
        return xx (cast((*MTL4CommandQueue, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    removeResidencySet :: inline (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        sel := sel_registerName2("removeResidencySet:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLResidencySet) -> void #c_call)objc_msgSend)(self, sel, residencySet);
    }

    removeResidencySets :: inline (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        sel := sel_registerName2("removeResidencySets:count:");
        return xx (cast((*MTL4CommandQueue, Selector, **MTLResidencySet, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, residencySets, count);
    }

    updateTextureMappings :: inline (self: *MTL4CommandQueue, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> void {
        sel := sel_registerName2("updateTextureMappings:heap:operations:count:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLTexture, *MTLHeap, *MTL4UpdateSparseTextureMappingOperation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, heap, operations, count);
    }

    copyTextureMappingsFromTexture :: inline (self: *MTL4CommandQueue, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> void {
        sel := sel_registerName2("copyTextureMappingsFromTexture:toTexture:operations:count:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLTexture, *MTLTexture, *MTL4CopySparseTextureMappingOperation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, destinationTexture, operations, count);
    }

    updateBufferMappings :: inline (self: *MTL4CommandQueue, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> void {
        sel := sel_registerName2("updateBufferMappings:heap:operations:count:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLBuffer, *MTLHeap, *MTL4UpdateSparseBufferMappingOperation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, heap, operations, count);
    }

    copyBufferMappingsFromBuffer :: inline (self: *MTL4CommandQueue, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> void {
        sel := sel_registerName2("copyBufferMappingsFromBuffer:toBuffer:operations:count:");
        return xx (cast((*MTL4CommandQueue, Selector, *MTLBuffer, *MTLBuffer, *MTL4CopySparseBufferMappingOperation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, destinationBuffer, operations, count);
    }

    device :: inline (self: *MTL4CommandQueue) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4CommandQueue, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4CommandQueue) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandQueue, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLCaptureError :: enum NSInteger {
    NotSupported      :: 1;

    AlreadyCapturing  :: 2;

    InvalidDescriptor :: 3;
}

MTLCaptureDestination :: enum NSInteger {
    DeveloperTools   :: 1;

    GPUTraceDocument :: 2;
}

MTLCaptureDescriptor :: struct #type_info_none {
    captureObject :: inline (self: *MTLCaptureDescriptor) -> id {
        sel := sel_registerName2("captureObject");
        return xx (cast((*MTLCaptureDescriptor, Selector) -> id #c_call)objc_msgSend)(self, sel);
    }
    setCaptureObject :: inline (self: *MTLCaptureDescriptor, captureObject: id) -> void {
        sel := sel_registerName2("setCaptureObject:");
        return xx (cast((*MTLCaptureDescriptor, Selector, id) -> void #c_call)objc_msgSend)(self, sel, captureObject);
    }

    destination :: inline (self: *MTLCaptureDescriptor) -> MTLCaptureDestination {
        sel := sel_registerName2("destination");
        return xx (cast((*MTLCaptureDescriptor, Selector) -> MTLCaptureDestination #c_call)objc_msgSend)(self, sel);
    }
    setDestination :: inline (self: *MTLCaptureDescriptor, destination: MTLCaptureDestination) -> void {
        sel := sel_registerName2("setDestination:");
        return xx (cast((*MTLCaptureDescriptor, Selector, MTLCaptureDestination) -> void #c_call)objc_msgSend)(self, sel, destination);
    }

    outputURL :: inline (self: *MTLCaptureDescriptor) -> *NSURL {
        sel := sel_registerName2("outputURL");
        return xx (cast((*MTLCaptureDescriptor, Selector) -> *NSURL #c_call)objc_msgSend)(self, sel);
    }
    setOutputURL :: inline (self: *MTLCaptureDescriptor, outputURL: *NSURL) -> void {
        sel := sel_registerName2("setOutputURL:");
        return xx (cast((*MTLCaptureDescriptor, Selector, *NSURL) -> void #c_call)objc_msgSend)(self, sel, outputURL);
    }
}

MTLCaptureManager :: struct #type_info_none {
    sharedCaptureManager :: inline () -> *MTLCaptureManager {
        class := objc_getClass("MTLCaptureManager");
        sel := sel_registerName2("sharedCaptureManager");
        return xx (cast((Class, Selector) -> *MTLCaptureManager #c_call)objc_msgSend)(class, sel);
    }

    init :: inline (self: *$instancetype/MTLCaptureManager) -> *instancetype {
        sel := sel_registerName2("init");
        return xx (cast((*MTLCaptureManager, Selector) -> *instancetype #c_call)objc_msgSend)(self, sel);
    }

    newCaptureScopeWithDevice :: inline (self: *MTLCaptureManager, device: *MTLDevice) -> *MTLCaptureScope {
        sel := sel_registerName2("newCaptureScopeWithDevice:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLDevice) -> *MTLCaptureScope #c_call)objc_msgSend)(self, sel, device);
    }

    newCaptureScopeWithCommandQueue :: inline (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope {
        sel := sel_registerName2("newCaptureScopeWithCommandQueue:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLCommandQueue) -> *MTLCaptureScope #c_call)objc_msgSend)(self, sel, commandQueue);
    }

    newCaptureScopeWithMTL4CommandQueue :: inline (self: *MTLCaptureManager, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope {
        sel := sel_registerName2("newCaptureScopeWithMTL4CommandQueue:");
        return xx (cast((*MTLCaptureManager, Selector, *MTL4CommandQueue) -> *MTLCaptureScope #c_call)objc_msgSend)(self, sel, commandQueue);
    }

    supportsDestination :: inline (self: *MTLCaptureManager, destination: MTLCaptureDestination) -> BOOL {
        sel := sel_registerName2("supportsDestination:");
        return xx (cast((*MTLCaptureManager, Selector, MTLCaptureDestination) -> BOOL #c_call)objc_msgSend)(self, sel, destination);
    }

    startCaptureWithDescriptor :: inline (self: *MTLCaptureManager, descriptor: *MTLCaptureDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("startCaptureWithDescriptor:error:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLCaptureDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    startCaptureWithDevice :: inline (self: *MTLCaptureManager, device: *MTLDevice) -> void {
        sel := sel_registerName2("startCaptureWithDevice:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLDevice) -> void #c_call)objc_msgSend)(self, sel, device);
    }

    startCaptureWithCommandQueue :: inline (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> void {
        sel := sel_registerName2("startCaptureWithCommandQueue:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLCommandQueue) -> void #c_call)objc_msgSend)(self, sel, commandQueue);
    }

    startCaptureWithScope :: inline (self: *MTLCaptureManager, captureScope: *MTLCaptureScope) -> void {
        sel := sel_registerName2("startCaptureWithScope:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLCaptureScope) -> void #c_call)objc_msgSend)(self, sel, captureScope);
    }

    stopCapture :: inline (self: *MTLCaptureManager) -> void {
        sel := sel_registerName2("stopCapture");
        return xx (cast((*MTLCaptureManager, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    defaultCaptureScope :: inline (self: *MTLCaptureManager) -> *MTLCaptureScope {
        sel := sel_registerName2("defaultCaptureScope");
        return xx (cast((*MTLCaptureManager, Selector) -> *MTLCaptureScope #c_call)objc_msgSend)(self, sel);
    }
    setDefaultCaptureScope :: inline (self: *MTLCaptureManager, defaultCaptureScope: *MTLCaptureScope) -> void {
        sel := sel_registerName2("setDefaultCaptureScope:");
        return xx (cast((*MTLCaptureManager, Selector, *MTLCaptureScope) -> void #c_call)objc_msgSend)(self, sel, defaultCaptureScope);
    }

    isCapturing :: inline (self: *MTLCaptureManager) -> BOOL {
        sel := sel_registerName2("isCapturing");
        return xx (cast((*MTLCaptureManager, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
}

MTLCaptureScope :: struct #type_info_none {
    beginScope :: inline (self: *MTLCaptureScope) -> void {
        sel := sel_registerName2("beginScope");
        return xx (cast((*MTLCaptureScope, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    endScope :: inline (self: *MTLCaptureScope) -> void {
        sel := sel_registerName2("endScope");
        return xx (cast((*MTLCaptureScope, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLCaptureScope) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLCaptureScope, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLCaptureScope, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLCaptureScope, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLCaptureScope) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLCaptureScope, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    commandQueue :: inline (self: *MTLCaptureScope) -> *MTLCommandQueue {
        sel := sel_registerName2("commandQueue");
        return xx (cast((*MTLCaptureScope, Selector) -> *MTLCommandQueue #c_call)objc_msgSend)(self, sel);
    }

    mtl4CommandQueue :: inline (self: *MTLCaptureScope) -> *MTL4CommandQueue {
        sel := sel_registerName2("mtl4CommandQueue");
        return xx (cast((*MTLCaptureScope, Selector) -> *MTL4CommandQueue #c_call)objc_msgSend)(self, sel);
    }
}

MTLIndirectRenderCommand :: struct #type_info_none {
    setRenderPipelineState :: inline (self: *MTLIndirectRenderCommand, pipelineState: *MTLRenderPipelineState) -> void {
        sel := sel_registerName2("setRenderPipelineState:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLRenderPipelineState) -> void #c_call)objc_msgSend)(self, sel, pipelineState);
    }

    setVertexBuffer :: inline (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBuffer:offset:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }
    setFragmentBuffer :: inline (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setFragmentBuffer:offset:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setVertexBuffer :: inline (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setVertexBuffer:offset:attributeStride:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, stride, index);
    }

    drawPatches :: inline (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        sel := sel_registerName2("drawPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, instanceCount, baseInstance, buffer, offset, instanceStride);
    }

    drawIndexedPatches :: inline (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPatches:patchStart:patchCount:patchIndexBuffer:patchIndexBufferOffset:controlPointIndexBuffer:controlPointIndexBufferOffset:instanceCount:baseInstance:tessellationFactorBuffer:tessellationFactorBufferOffset:tessellationFactorBufferInstanceStride:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, instanceCount, baseInstance, buffer, offset, instanceStride);
    }

    drawPrimitives :: inline (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLPrimitiveType, NSUInteger, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }
    drawIndexedPrimitives :: inline (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        sel := sel_registerName2("drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLPrimitiveType, NSUInteger, MTLIndexType, *MTLBuffer, NSUInteger, NSUInteger, NSInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
    }

    setObjectThreadgroupMemoryLength :: inline (self: *MTLIndirectRenderCommand, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }
    setObjectBuffer :: inline (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setObjectBuffer:offset:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }
    setMeshBuffer :: inline (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setMeshBuffer:offset:atIndex:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }
    drawMeshThreadgroups :: inline (self: *MTLIndirectRenderCommand, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads :: inline (self: *MTLIndirectRenderCommand, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLSize, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    setBarrier :: inline (self: *MTLIndirectRenderCommand) -> void {
        sel := sel_registerName2("setBarrier");
        return xx (cast((*MTLIndirectRenderCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }
    clearBarrier :: inline (self: *MTLIndirectRenderCommand) -> void {
        sel := sel_registerName2("clearBarrier");
        return xx (cast((*MTLIndirectRenderCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    setDepthStencilState :: inline (self: *MTLIndirectRenderCommand, depthStencilState: *MTLDepthStencilState) -> void {
        sel := sel_registerName2("setDepthStencilState:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, *MTLDepthStencilState) -> void #c_call)objc_msgSend)(self, sel, depthStencilState);
    }
    setDepthBias :: inline (self: *MTLIndirectRenderCommand, depthBias: float, slopeScale: float, clamp: float) -> void {
        sel := sel_registerName2("setDepthBias:slopeScale:clamp:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, float, float, float) -> void #c_call)objc_msgSend)(self, sel, depthBias, slopeScale, clamp);
    }
    setDepthClipMode :: inline (self: *MTLIndirectRenderCommand, depthClipMode: MTLDepthClipMode) -> void {
        sel := sel_registerName2("setDepthClipMode:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLDepthClipMode) -> void #c_call)objc_msgSend)(self, sel, depthClipMode);
    }
    setCullMode :: inline (self: *MTLIndirectRenderCommand, cullMode: MTLCullMode) -> void {
        sel := sel_registerName2("setCullMode:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLCullMode) -> void #c_call)objc_msgSend)(self, sel, cullMode);
    }
    setFrontFacingWinding :: inline (self: *MTLIndirectRenderCommand, frontFacingWindning: MTLWinding) -> void {
        sel := sel_registerName2("setFrontFacingWinding:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLWinding) -> void #c_call)objc_msgSend)(self, sel, frontFacingWindning);
    }
    setTriangleFillMode :: inline (self: *MTLIndirectRenderCommand, fillMode: MTLTriangleFillMode) -> void {
        sel := sel_registerName2("setTriangleFillMode:");
        return xx (cast((*MTLIndirectRenderCommand, Selector, MTLTriangleFillMode) -> void #c_call)objc_msgSend)(self, sel, fillMode);
    }

    reset :: inline (self: *MTLIndirectRenderCommand) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLIndirectRenderCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }
}

MTLIndirectComputeCommand :: struct #type_info_none {
    setComputePipelineState :: inline (self: *MTLIndirectComputeCommand, pipelineState: *MTLComputePipelineState) -> void {
        sel := sel_registerName2("setComputePipelineState:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, *MTLComputePipelineState) -> void #c_call)objc_msgSend)(self, sel, pipelineState);
    }

    setKernelBuffer :: inline (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setKernelBuffer:offset:atIndex:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }

    setKernelBuffer :: inline (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setKernelBuffer:offset:attributeStride:atIndex:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, stride, index);
    }

    concurrentDispatchThreadgroups :: inline (self: *MTLIndirectComputeCommand, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("concurrentDispatchThreadgroups:threadsPerThreadgroup:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    concurrentDispatchThreads :: inline (self: *MTLIndirectComputeCommand, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("concurrentDispatchThreads:threadsPerThreadgroup:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerThreadgroup);
    }

    setBarrier :: inline (self: *MTLIndirectComputeCommand) -> void {
        sel := sel_registerName2("setBarrier");
        return xx (cast((*MTLIndirectComputeCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    clearBarrier :: inline (self: *MTLIndirectComputeCommand) -> void {
        sel := sel_registerName2("clearBarrier");
        return xx (cast((*MTLIndirectComputeCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    setImageblockWidth :: inline (self: *MTLIndirectComputeCommand, width: NSUInteger, height: NSUInteger) -> void {
        sel := sel_registerName2("setImageblockWidth:height:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, width, height);
    }

    reset :: inline (self: *MTLIndirectComputeCommand) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTLIndirectComputeCommand, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    setThreadgroupMemoryLength :: inline (self: *MTLIndirectComputeCommand, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }
    setStageInRegion :: inline (self: *MTLIndirectComputeCommand, region: MTLRegion) -> void {
        sel := sel_registerName2("setStageInRegion:");
        return xx (cast((*MTLIndirectComputeCommand, Selector, MTLRegion) -> void #c_call)objc_msgSend)(self, sel, region);
    }
}

MTLIndirectCommandType :: NSUInteger;
MTLIndirectCommandType_1 :: enum MTLIndirectCommandType {
    Draw                      :: 1;
    DrawIndexed               :: 2;
    DrawPatches               :: 4;
    DrawIndexedPatches        :: 8;

    ConcurrentDispatch        :: 32;

    ConcurrentDispatchThreads :: 64;
    DrawMeshThreadgroups      :: 128;
    DrawMeshThreads           :: 256;
}

MTLIndirectCommandBufferExecutionRange :: struct #type_info_none {
    location: u32;
    length:   u32;
}

MTLIndirectCommandBufferDescriptor :: struct #type_info_none {
    commandTypes :: inline (self: *MTLIndirectCommandBufferDescriptor) -> MTLIndirectCommandType {
        sel := sel_registerName2("commandTypes");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> MTLIndirectCommandType #c_call)objc_msgSend)(self, sel);
    }
    setCommandTypes :: inline (self: *MTLIndirectCommandBufferDescriptor, commandTypes: MTLIndirectCommandType) -> void {
        sel := sel_registerName2("setCommandTypes:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, MTLIndirectCommandType) -> void #c_call)objc_msgSend)(self, sel, commandTypes);
    }

    inheritPipelineState :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritPipelineState");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritPipelineState :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritPipelineState: BOOL) -> void {
        sel := sel_registerName2("setInheritPipelineState:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritPipelineState);
    }

    inheritBuffers :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritBuffers");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritBuffers :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritBuffers: BOOL) -> void {
        sel := sel_registerName2("setInheritBuffers:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritBuffers);
    }

    inheritDepthStencilState :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritDepthStencilState");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritDepthStencilState :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritDepthStencilState: BOOL) -> void {
        sel := sel_registerName2("setInheritDepthStencilState:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritDepthStencilState);
    }

    inheritDepthBias :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritDepthBias");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritDepthBias :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritDepthBias: BOOL) -> void {
        sel := sel_registerName2("setInheritDepthBias:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritDepthBias);
    }

    inheritDepthClipMode :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritDepthClipMode");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritDepthClipMode :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritDepthClipMode: BOOL) -> void {
        sel := sel_registerName2("setInheritDepthClipMode:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritDepthClipMode);
    }

    inheritCullMode :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritCullMode");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritCullMode :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritCullMode: BOOL) -> void {
        sel := sel_registerName2("setInheritCullMode:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritCullMode);
    }

    inheritFrontFacingWinding :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritFrontFacingWinding");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritFrontFacingWinding :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritFrontFacingWinding: BOOL) -> void {
        sel := sel_registerName2("setInheritFrontFacingWinding:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritFrontFacingWinding);
    }

    inheritTriangleFillMode :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("inheritTriangleFillMode");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInheritTriangleFillMode :: inline (self: *MTLIndirectCommandBufferDescriptor, inheritTriangleFillMode: BOOL) -> void {
        sel := sel_registerName2("setInheritTriangleFillMode:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, inheritTriangleFillMode);
    }

    maxVertexBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexBufferBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxVertexBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexBufferBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexBufferBindCount);
    }

    maxFragmentBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxFragmentBufferBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxFragmentBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxFragmentBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxFragmentBufferBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxFragmentBufferBindCount);
    }

    maxKernelBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxKernelBufferBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxKernelBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxKernelBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxKernelBufferBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxKernelBufferBindCount);
    }

    maxKernelThreadgroupMemoryBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxKernelThreadgroupMemoryBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxKernelThreadgroupMemoryBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxKernelThreadgroupMemoryBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxKernelThreadgroupMemoryBindCount);
    }

    maxObjectBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxObjectBufferBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxObjectBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxObjectBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxObjectBufferBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxObjectBufferBindCount);
    }

    maxMeshBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxMeshBufferBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxMeshBufferBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxMeshBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxMeshBufferBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxMeshBufferBindCount);
    }

    maxObjectThreadgroupMemoryBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxObjectThreadgroupMemoryBindCount");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxObjectThreadgroupMemoryBindCount :: inline (self: *MTLIndirectCommandBufferDescriptor, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxObjectThreadgroupMemoryBindCount:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxObjectThreadgroupMemoryBindCount);
    }

    supportRayTracing :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("supportRayTracing");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportRayTracing :: inline (self: *MTLIndirectCommandBufferDescriptor, supportRayTracing: BOOL) -> void {
        sel := sel_registerName2("setSupportRayTracing:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportRayTracing);
    }

    supportDynamicAttributeStride :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("supportDynamicAttributeStride");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportDynamicAttributeStride :: inline (self: *MTLIndirectCommandBufferDescriptor, supportDynamicAttributeStride: BOOL) -> void {
        sel := sel_registerName2("setSupportDynamicAttributeStride:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportDynamicAttributeStride);
    }

    supportColorAttachmentMapping :: inline (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        sel := sel_registerName2("supportColorAttachmentMapping");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportColorAttachmentMapping :: inline (self: *MTLIndirectCommandBufferDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        sel := sel_registerName2("setSupportColorAttachmentMapping:");
        return xx (cast((*MTLIndirectCommandBufferDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportColorAttachmentMapping);
    }
}

MTLIndirectCommandBuffer :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    resetWithRange :: inline (self: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("resetWithRange:");
        return xx (cast((*MTLIndirectCommandBuffer, Selector, NSRange) -> void #c_call)objc_msgSend)(self, sel, range);
    }

    indirectRenderCommandAtIndex :: inline (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectRenderCommand {
        sel := sel_registerName2("indirectRenderCommandAtIndex:");
        return xx (cast((*MTLIndirectCommandBuffer, Selector, NSUInteger) -> *MTLIndirectRenderCommand #c_call)objc_msgSend)(self, sel, commandIndex);
    }
    indirectComputeCommandAtIndex :: inline (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectComputeCommand {
        sel := sel_registerName2("indirectComputeCommandAtIndex:");
        return xx (cast((*MTLIndirectCommandBuffer, Selector, NSUInteger) -> *MTLIndirectComputeCommand #c_call)objc_msgSend)(self, sel, commandIndex);
    }

    size :: inline (self: *MTLIndirectCommandBuffer) -> NSUInteger {
        sel := sel_registerName2("size");
        return xx (cast((*MTLIndirectCommandBuffer, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    gpuResourceID :: inline (self: *MTLIndirectCommandBuffer) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLIndirectCommandBuffer, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionLogType :: enum NSUInteger {
    Validation :: 0;
}

MTLLogContainer :: struct #type_info_none {
    #as using nsfastenumeration: NSFastEnumeration;
}

MTLFunctionLogDebugLocation :: struct #type_info_none {
    functionName :: inline (self: *MTLFunctionLogDebugLocation) -> *NSString {
        sel := sel_registerName2("functionName");
        return xx (cast((*MTLFunctionLogDebugLocation, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    URL :: inline (self: *MTLFunctionLogDebugLocation) -> *NSURL {
        sel := sel_registerName2("URL");
        return xx (cast((*MTLFunctionLogDebugLocation, Selector) -> *NSURL #c_call)objc_msgSend)(self, sel);
    }
    line :: inline (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
        sel := sel_registerName2("line");
        return xx (cast((*MTLFunctionLogDebugLocation, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    column :: inline (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
        sel := sel_registerName2("column");
        return xx (cast((*MTLFunctionLogDebugLocation, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLFunctionLog :: struct #type_info_none {
    type :: inline (self: *MTLFunctionLog) -> MTLFunctionLogType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLFunctionLog, Selector) -> MTLFunctionLogType #c_call)objc_msgSend)(self, sel);
    }
    encoderLabel :: inline (self: *MTLFunctionLog) -> *NSString {
        sel := sel_registerName2("encoderLabel");
        return xx (cast((*MTLFunctionLog, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    function :: inline (self: *MTLFunctionLog) -> *MTLFunction {
        sel := sel_registerName2("function");
        return xx (cast((*MTLFunctionLog, Selector) -> *MTLFunction #c_call)objc_msgSend)(self, sel);
    }
    debugLocation :: inline (self: *MTLFunctionLog) -> *MTLFunctionLogDebugLocation {
        sel := sel_registerName2("debugLocation");
        return xx (cast((*MTLFunctionLog, Selector) -> *MTLFunctionLogDebugLocation #c_call)objc_msgSend)(self, sel);
    }
}

MTLAccelerationStructureCommandEncoder :: struct #type_info_none {
    #as using mtlcommandencoder: MTLCommandEncoder;

    buildAccelerationStructure :: inline (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("buildAccelerationStructure:descriptor:scratchBuffer:scratchBufferOffset:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructureDescriptor, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, descriptor, scratchBuffer, scratchBufferOffset);
    }

    refitAccelerationStructure :: inline (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        sel := sel_registerName2("refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructureDescriptor, *MTLAccelerationStructure, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset);
    }

    refitAccelerationStructure :: inline (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> void {
        sel := sel_registerName2("refitAccelerationStructure:descriptor:destination:scratchBuffer:scratchBufferOffset:options:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructureDescriptor, *MTLAccelerationStructure, *MTLBuffer, NSUInteger, MTLAccelerationStructureRefitOptions) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset, options);
    }

    copyAccelerationStructure :: inline (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        sel := sel_registerName2("copyAccelerationStructure:toAccelerationStructure:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructure) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeCompactedAccelerationStructureSize :: inline (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        sel := sel_registerName2("writeCompactedAccelerationStructureSize:toBuffer:offset:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, buffer, offset);
    }

    writeCompactedAccelerationStructureSize :: inline (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> void {
        sel := sel_registerName2("writeCompactedAccelerationStructureSize:toBuffer:offset:sizeDataType:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLBuffer, NSUInteger, MTLDataType) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, buffer, offset, sizeDataType);
    }

    copyAndCompactAccelerationStructure :: inline (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        sel := sel_registerName2("copyAndCompactAccelerationStructure:toAccelerationStructure:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructure) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    updateFence :: inline (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("updateFence:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    waitForFence :: inline (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        sel := sel_registerName2("waitForFence:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLFence) -> void #c_call)objc_msgSend)(self, sel, fence);
    }

    useResource :: inline (self: *MTLAccelerationStructureCommandEncoder, resource: *MTLResource_1, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResource:usage:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLResource_1, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resource, usage);
    }

    useResources :: inline (self: *MTLAccelerationStructureCommandEncoder, resources: **MTLResource_1, count: NSUInteger, usage: MTLResourceUsage) -> void {
        sel := sel_registerName2("useResources:count:usage:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, **MTLResource_1, NSUInteger, MTLResourceUsage) -> void #c_call)objc_msgSend)(self, sel, resources, count, usage);
    }

    useHeap :: inline (self: *MTLAccelerationStructureCommandEncoder, heap: *MTLHeap) -> void {
        sel := sel_registerName2("useHeap:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLHeap) -> void #c_call)objc_msgSend)(self, sel, heap);
    }

    useHeaps :: inline (self: *MTLAccelerationStructureCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        sel := sel_registerName2("useHeaps:count:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, **MTLHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, heaps, count);
    }

    sampleCountersInBuffer :: inline (self: *MTLAccelerationStructureCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        sel := sel_registerName2("sampleCountersInBuffer:atSampleIndex:withBarrier:");
        return xx (cast((*MTLAccelerationStructureCommandEncoder, Selector, *MTLCounterSampleBuffer, NSUInteger, BOOL) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer, sampleIndex, barrier);
    }
}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    sampleBuffer :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        sel := sel_registerName2("sampleBuffer");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector) -> *MTLCounterSampleBuffer #c_call)objc_msgSend)(self, sel);
    }
    setSampleBuffer :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        sel := sel_registerName2("setSampleBuffer:");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector, *MTLCounterSampleBuffer) -> void #c_call)objc_msgSend)(self, sel, sampleBuffer);
    }

    startOfEncoderSampleIndex :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("startOfEncoderSampleIndex");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setStartOfEncoderSampleIndex :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setStartOfEncoderSampleIndex:");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        sel := sel_registerName2("endOfEncoderSampleIndex");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setEndOfEncoderSampleIndex :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        sel := sel_registerName2("setEndOfEncoderSampleIndex:");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, endOfEncoderSampleIndex);
    }
}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, Selector, NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, Selector, *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }
}

MTLAccelerationStructurePassDescriptor :: struct #type_info_none {
    accelerationStructurePassDescriptor :: inline () -> *MTLAccelerationStructurePassDescriptor {
        class := objc_getClass("MTLAccelerationStructurePassDescriptor");
        sel := sel_registerName2("accelerationStructurePassDescriptor");
        return xx (cast((Class, Selector) -> *MTLAccelerationStructurePassDescriptor #c_call)objc_msgSend)(class, sel);
    }

    sampleBufferAttachments :: inline (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray {
        sel := sel_registerName2("sampleBufferAttachments");
        return xx (cast((*MTLAccelerationStructurePassDescriptor, Selector) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }
}

MTLRasterizationRateSampleArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLRasterizationRateSampleArray, index: NSUInteger) -> *NSNumber {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLRasterizationRateSampleArray, Selector, NSUInteger) -> *NSNumber #c_call)objc_msgSend)(self, sel, index);
    }

    setObject :: inline (self: *MTLRasterizationRateSampleArray, value: *NSNumber, index: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLRasterizationRateSampleArray, Selector, *NSNumber, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, value, index);
    }
}

MTLRasterizationRateLayerDescriptor :: struct #type_info_none {
    init :: inline (self: *$instancetype/MTLRasterizationRateLayerDescriptor) -> *instancetype {
        sel := sel_registerName2("init");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> *instancetype #c_call)objc_msgSend)(self, sel);
    }

    initWithSampleCount :: inline (self: *$instancetype/MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> *instancetype {
        sel := sel_registerName2("initWithSampleCount:");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector, MTLSize) -> *instancetype #c_call)objc_msgSend)(self, sel, sampleCount);
    }

    initWithSampleCount :: inline (self: *$instancetype/MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize, horizontal: *float, vertical: *float) -> *instancetype {
        sel := sel_registerName2("initWithSampleCount:horizontal:vertical:");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector, MTLSize, *float, *float) -> *instancetype #c_call)objc_msgSend)(self, sel, sampleCount, horizontal, vertical);
    }

    sampleCount :: inline (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        sel := sel_registerName2("sampleCount");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    maxSampleCount :: inline (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        sel := sel_registerName2("maxSampleCount");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    horizontalSampleStorage :: inline (self: *MTLRasterizationRateLayerDescriptor) -> *float {
        sel := sel_registerName2("horizontalSampleStorage");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> *float #c_call)objc_msgSend)(self, sel);
    }

    verticalSampleStorage :: inline (self: *MTLRasterizationRateLayerDescriptor) -> *float {
        sel := sel_registerName2("verticalSampleStorage");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> *float #c_call)objc_msgSend)(self, sel);
    }

    horizontal :: inline (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        sel := sel_registerName2("horizontal");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> *MTLRasterizationRateSampleArray #c_call)objc_msgSend)(self, sel);
    }

    vertical :: inline (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        sel := sel_registerName2("vertical");
        return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector) -> *MTLRasterizationRateSampleArray #c_call)objc_msgSend)(self, sel);
    }

    anon_struct_13 :: struct {
        setSampleCount :: inline (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> void {
            sel := sel_registerName2("setSampleCount:");
            return xx (cast((*MTLRasterizationRateLayerDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, sampleCount);
        }
    }
}

MTLRasterizationRateLayerArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTLRasterizationRateLayerArray, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTLRasterizationRateLayerArray, Selector, NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call)objc_msgSend)(self, sel, layerIndex);
    }

    setObject :: inline (self: *MTLRasterizationRateLayerArray, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTLRasterizationRateLayerArray, Selector, *MTLRasterizationRateLayerDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, layer, layerIndex);
    }
}

MTLRasterizationRateMapDescriptor :: struct #type_info_none {
    rasterizationRateMapDescriptorWithScreenSize :: inline (screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor {
        class := objc_getClass("MTLRasterizationRateMapDescriptor");
        sel := sel_registerName2("rasterizationRateMapDescriptorWithScreenSize:");
        return xx (cast((Class, Selector, MTLSize) -> *MTLRasterizationRateMapDescriptor #c_call)objc_msgSend)(class, sel, screenSize);
    }

    rasterizationRateMapDescriptorWithScreenSize :: inline (screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        class := objc_getClass("MTLRasterizationRateMapDescriptor");
        sel := sel_registerName2("rasterizationRateMapDescriptorWithScreenSize:layer:");
        return xx (cast((Class, Selector, MTLSize, *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call)objc_msgSend)(class, sel, screenSize, layer);
    }

    rasterizationRateMapDescriptorWithScreenSize :: inline (screenSize: MTLSize, layerCount: NSUInteger, layers: **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        class := objc_getClass("MTLRasterizationRateMapDescriptor");
        sel := sel_registerName2("rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:");
        return xx (cast((Class, Selector, MTLSize, NSUInteger, **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call)objc_msgSend)(class, sel, screenSize, layerCount, layers);
    }

    layerAtIndex :: inline (self: *MTLRasterizationRateMapDescriptor, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        sel := sel_registerName2("layerAtIndex:");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector, NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call)objc_msgSend)(self, sel, layerIndex);
    }

    setLayer :: inline (self: *MTLRasterizationRateMapDescriptor, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        sel := sel_registerName2("setLayer:atIndex:");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector, *MTLRasterizationRateLayerDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, layer, layerIndex);
    }

    layers :: inline (self: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateLayerArray {
        sel := sel_registerName2("layers");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector) -> *MTLRasterizationRateLayerArray #c_call)objc_msgSend)(self, sel);
    }

    screenSize :: inline (self: *MTLRasterizationRateMapDescriptor) -> MTLSize {
        sel := sel_registerName2("screenSize");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setScreenSize :: inline (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> void {
        sel := sel_registerName2("setScreenSize:");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, screenSize);
    }

    label :: inline (self: *MTLRasterizationRateMapDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLRasterizationRateMapDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    layerCount :: inline (self: *MTLRasterizationRateMapDescriptor) -> NSUInteger {
        sel := sel_registerName2("layerCount");
        return xx (cast((*MTLRasterizationRateMapDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLRasterizationRateMap :: struct #type_info_none {
    copyParameterDataToBuffer :: inline (self: *MTLRasterizationRateMap, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        sel := sel_registerName2("copyParameterDataToBuffer:offset:");
        return xx (cast((*MTLRasterizationRateMap, Selector, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset);
    }

    physicalSizeForLayer :: inline (self: *MTLRasterizationRateMap, layerIndex: NSUInteger) -> MTLSize {
        sel := sel_registerName2("physicalSizeForLayer:");
        return xx (cast((*MTLRasterizationRateMap, Selector, NSUInteger) -> MTLSize #c_call)objc_msgSend)(self, sel, layerIndex);
    }

    mapScreenToPhysicalCoordinates :: inline (self: *MTLRasterizationRateMap, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        sel := sel_registerName2("mapScreenToPhysicalCoordinates:forLayer:");
        return xx (cast((*MTLRasterizationRateMap, Selector, MTLCoordinate2D, NSUInteger) -> MTLCoordinate2D #c_call)objc_msgSend)(self, sel, screenCoordinates, layerIndex);
    }

    mapPhysicalToScreenCoordinates :: inline (self: *MTLRasterizationRateMap, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        sel := sel_registerName2("mapPhysicalToScreenCoordinates:forLayer:");
        return xx (cast((*MTLRasterizationRateMap, Selector, MTLCoordinate2D, NSUInteger) -> MTLCoordinate2D #c_call)objc_msgSend)(self, sel, physicalCoordinates, layerIndex);
    }

    device :: inline (self: *MTLRasterizationRateMap) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLRasterizationRateMap) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    screenSize :: inline (self: *MTLRasterizationRateMap) -> MTLSize {
        sel := sel_registerName2("screenSize");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    physicalGranularity :: inline (self: *MTLRasterizationRateMap) -> MTLSize {
        sel := sel_registerName2("physicalGranularity");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }

    layerCount :: inline (self: *MTLRasterizationRateMap) -> NSUInteger {
        sel := sel_registerName2("layerCount");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    parameterBufferSizeAndAlign :: inline (self: *MTLRasterizationRateMap) -> MTLSizeAndAlign {
        sel := sel_registerName2("parameterBufferSizeAndAlign");
        return xx (cast((*MTLRasterizationRateMap, Selector) -> MTLSizeAndAlign #c_call)objc_msgSend)(self, sel);
    }
}

MTLDynamicLibraryError :: enum NSUInteger {
    None                  :: 0;
    InvalidFile           :: 1;
    CompilationFailure    :: 2;
    UnresolvedInstallName :: 3;
    DependencyLoadFailure :: 4;
    Unsupported           :: 5;
}

MTLDynamicLibrary :: struct #type_info_none {
    serializeToURL :: inline (self: *MTLDynamicLibrary, url: *NSURL, error: **NSError) -> BOOL {
        sel := sel_registerName2("serializeToURL:error:");
        return xx (cast((*MTLDynamicLibrary, Selector, *NSURL, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, url, error);
    }

    label :: inline (self: *MTLDynamicLibrary) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLDynamicLibrary, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLDynamicLibrary, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLDynamicLibrary, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLDynamicLibrary) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLDynamicLibrary, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    installName :: inline (self: *MTLDynamicLibrary) -> *NSString {
        sel := sel_registerName2("installName");
        return xx (cast((*MTLDynamicLibrary, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLLogLevel :: enum NSInteger {
    Undefined :: 0;
    Debug     :: 1;
    Info      :: 2;
    Notice    :: 3;
    Error     :: 4;
    Fault     :: 5;
}

MTLLogState :: struct #type_info_none {
    addLogHandler :: inline (self: *MTLLogState, block: Block) -> void {
        sel := sel_registerName2("addLogHandler:");
        return xx (cast((*MTLLogState, Selector, Block) -> void #c_call)objc_msgSend)(self, sel, block);
    }
}

MTLLogStateDescriptor :: struct #type_info_none {
    level :: inline (self: *MTLLogStateDescriptor) -> MTLLogLevel {
        sel := sel_registerName2("level");
        return xx (cast((*MTLLogStateDescriptor, Selector) -> MTLLogLevel #c_call)objc_msgSend)(self, sel);
    }
    setLevel :: inline (self: *MTLLogStateDescriptor, level: MTLLogLevel) -> void {
        sel := sel_registerName2("setLevel:");
        return xx (cast((*MTLLogStateDescriptor, Selector, MTLLogLevel) -> void #c_call)objc_msgSend)(self, sel, level);
    }

    bufferSize :: inline (self: *MTLLogStateDescriptor) -> NSInteger {
        sel := sel_registerName2("bufferSize");
        return xx (cast((*MTLLogStateDescriptor, Selector) -> NSInteger #c_call)objc_msgSend)(self, sel);
    }
    setBufferSize :: inline (self: *MTLLogStateDescriptor, bufferSize: NSInteger) -> void {
        sel := sel_registerName2("setBufferSize:");
        return xx (cast((*MTLLogStateDescriptor, Selector, NSInteger) -> void #c_call)objc_msgSend)(self, sel, bufferSize);
    }
}

MTLLogStateError :: enum NSUInteger {
    InvalidSize :: 1;
    Invalid     :: 2;
}

MTLBinaryArchiveError :: enum NSUInteger {
    None               :: 0;
    InvalidFile        :: 1;
    UnexpectedElement  :: 2;
    CompilationFailure :: 3;
    InternalError      :: 4;
}

MTLBinaryArchiveDescriptor :: struct #type_info_none {
    url :: inline (self: *MTLBinaryArchiveDescriptor) -> *NSURL {
        sel := sel_registerName2("url");
        return xx (cast((*MTLBinaryArchiveDescriptor, Selector) -> *NSURL #c_call)objc_msgSend)(self, sel);
    }
    setUrl :: inline (self: *MTLBinaryArchiveDescriptor, url: *NSURL) -> void {
        sel := sel_registerName2("setUrl:");
        return xx (cast((*MTLBinaryArchiveDescriptor, Selector, *NSURL) -> void #c_call)objc_msgSend)(self, sel, url);
    }
}

MTLBinaryArchive :: struct #type_info_none {
    addComputePipelineFunctionsWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("addComputePipelineFunctionsWithDescriptor:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLComputePipelineDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    addRenderPipelineFunctionsWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("addRenderPipelineFunctionsWithDescriptor:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLRenderPipelineDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    addTileRenderPipelineFunctionsWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("addTileRenderPipelineFunctionsWithDescriptor:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLTileRenderPipelineDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    addMeshRenderPipelineFunctionsWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("addMeshRenderPipelineFunctionsWithDescriptor:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLMeshRenderPipelineDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    addLibraryWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> BOOL {
        sel := sel_registerName2("addLibraryWithDescriptor:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLStitchedLibraryDescriptor, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    serializeToURL :: inline (self: *MTLBinaryArchive, url: *NSURL, error: **NSError) -> BOOL {
        sel := sel_registerName2("serializeToURL:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *NSURL, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, url, error);
    }

    addFunctionWithDescriptor :: inline (self: *MTLBinaryArchive, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> BOOL {
        sel := sel_registerName2("addFunctionWithDescriptor:library:error:");
        return xx (cast((*MTLBinaryArchive, Selector, *MTLFunctionDescriptor, *MTLLibrary, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, descriptor, library, error);
    }

    label :: inline (self: *MTLBinaryArchive) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLBinaryArchive, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLBinaryArchive, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLBinaryArchive, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    device :: inline (self: *MTLBinaryArchive) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLBinaryArchive, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }
}

MTLIntersectionFunctionBufferArguments :: struct #type_info_none {
    intersectionFunctionBuffer:     u64;

    intersectionFunctionBufferSize: u64;

    intersectionFunctionStride:     u64;
}

MTLIntersectionFunctionSignature :: NSUInteger;
MTLIntersectionFunctionSignature_1 :: enum MTLIntersectionFunctionSignature {
    None                       :: 0;

    Instancing                 :: 1;

    TriangleData               :: 2;

    WorldSpaceData             :: 4;

    InstanceMotion             :: 8;

    PrimitiveMotion            :: 16;

    ExtendedLimits             :: 32;

    MaxLevels                  :: 64;

    CurveData                  :: 128;

    IntersectionFunctionBuffer :: 256;

    UserData                   :: 512;
}

MTLIntersectionFunctionTableDescriptor :: struct #type_info_none {
    intersectionFunctionTableDescriptor :: inline () -> *MTLIntersectionFunctionTableDescriptor {
        class := objc_getClass("MTLIntersectionFunctionTableDescriptor");
        sel := sel_registerName2("intersectionFunctionTableDescriptor");
        return xx (cast((Class, Selector) -> *MTLIntersectionFunctionTableDescriptor #c_call)objc_msgSend)(class, sel);
    }

    functionCount :: inline (self: *MTLIntersectionFunctionTableDescriptor) -> NSUInteger {
        sel := sel_registerName2("functionCount");
        return xx (cast((*MTLIntersectionFunctionTableDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setFunctionCount :: inline (self: *MTLIntersectionFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        sel := sel_registerName2("setFunctionCount:");
        return xx (cast((*MTLIntersectionFunctionTableDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionCount);
    }
}

MTLIntersectionFunctionTable :: struct #type_info_none {
    #as using mtlresource: MTLResource_1;

    setBuffer :: inline (self: *MTLIntersectionFunctionTable, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setBuffer:offset:atIndex:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, index);
    }
    setBuffers :: inline (self: *MTLIntersectionFunctionTable, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        sel := sel_registerName2("setBuffers:offsets:withRange:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, **MTLBuffer, *NSUInteger, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffers, offsets, range);
    }

    setFunction :: inline (self: *MTLIntersectionFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> void {
        sel := sel_registerName2("setFunction:atIndex:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, *MTLFunctionHandle, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, function, index);
    }
    setFunctions :: inline (self: *MTLIntersectionFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> void {
        sel := sel_registerName2("setFunctions:withRange:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, **MTLFunctionHandle, NSRange) -> void #c_call)objc_msgSend)(self, sel, functions, range);
    }

    setOpaqueTriangleIntersectionFunctionWithSignature :: inline (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        sel := sel_registerName2("setOpaqueTriangleIntersectionFunctionWithSignature:atIndex:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, MTLIntersectionFunctionSignature, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, signature, index);
    }

    setOpaqueTriangleIntersectionFunctionWithSignature :: inline (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void {
        sel := sel_registerName2("setOpaqueTriangleIntersectionFunctionWithSignature:withRange:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, MTLIntersectionFunctionSignature, NSRange) -> void #c_call)objc_msgSend)(self, sel, signature, range);
    }

    setOpaqueCurveIntersectionFunctionWithSignature :: inline (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        sel := sel_registerName2("setOpaqueCurveIntersectionFunctionWithSignature:atIndex:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, MTLIntersectionFunctionSignature, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, signature, index);
    }

    setOpaqueCurveIntersectionFunctionWithSignature :: inline (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void {
        sel := sel_registerName2("setOpaqueCurveIntersectionFunctionWithSignature:withRange:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, MTLIntersectionFunctionSignature, NSRange) -> void #c_call)objc_msgSend)(self, sel, signature, range);
    }

    setVisibleFunctionTable :: inline (self: *MTLIntersectionFunctionTable, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        sel := sel_registerName2("setVisibleFunctionTable:atBufferIndex:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, *MTLVisibleFunctionTable, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, functionTable, bufferIndex);
    }
    setVisibleFunctionTables :: inline (self: *MTLIntersectionFunctionTable, functionTables: **MTLVisibleFunctionTable, bufferRange: NSRange) -> void {
        sel := sel_registerName2("setVisibleFunctionTables:withBufferRange:");
        return xx (cast((*MTLIntersectionFunctionTable, Selector, **MTLVisibleFunctionTable, NSRange) -> void #c_call)objc_msgSend)(self, sel, functionTables, bufferRange);
    }

    gpuResourceID :: inline (self: *MTLIntersectionFunctionTable) -> MTLResourceID {
        sel := sel_registerName2("gpuResourceID");
        return xx (cast((*MTLIntersectionFunctionTable, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }
}

MTLStitchedLibraryOptions :: NSUInteger;
MTLStitchedLibraryOption :: enum MTLStitchedLibraryOptions {
    None                               :: 0;

    FailOnBinaryArchiveMiss            :: 1;

    StoreLibraryInMetalPipelinesScript :: 2;
}

MTLFunctionStitchingAttribute :: struct #type_info_none {}

MTLFunctionStitchingAttributeAlwaysInline :: struct #type_info_none {
    #as using mtlfunctionstitchingattribute: MTLFunctionStitchingAttribute;
}

MTLFunctionStitchingNode :: struct #type_info_none {}

MTLFunctionStitchingInputNode :: struct #type_info_none {
    #as using mtlfunctionstitchingnode: MTLFunctionStitchingNode;

    initWithArgumentIndex :: inline (self: *$instancetype/MTLFunctionStitchingInputNode, argument: NSUInteger) -> *instancetype {
        sel := sel_registerName2("initWithArgumentIndex:");
        return xx (cast((*MTLFunctionStitchingInputNode, Selector, NSUInteger) -> *instancetype #c_call)objc_msgSend)(self, sel, argument);
    }

    argumentIndex :: inline (self: *MTLFunctionStitchingInputNode) -> NSUInteger {
        sel := sel_registerName2("argumentIndex");
        return xx (cast((*MTLFunctionStitchingInputNode, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setArgumentIndex :: inline (self: *MTLFunctionStitchingInputNode, argumentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setArgumentIndex:");
        return xx (cast((*MTLFunctionStitchingInputNode, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, argumentIndex);
    }
}

MTLFunctionStitchingFunctionNode :: struct #type_info_none {
    #as using mtlfunctionstitchingnode: MTLFunctionStitchingNode;

    initWithName :: inline (self: *$instancetype/MTLFunctionStitchingFunctionNode, name: *NSString, arguments: *NSArray(*MTLFunctionStitchingNode), controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> *instancetype {
        sel := sel_registerName2("initWithName:arguments:controlDependencies:");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector, *NSString, *NSArray(*MTLFunctionStitchingNode), *NSArray(*MTLFunctionStitchingFunctionNode)) -> *instancetype #c_call)objc_msgSend)(self, sel, name, arguments, controlDependencies);
    }

    name :: inline (self: *MTLFunctionStitchingFunctionNode) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setName :: inline (self: *MTLFunctionStitchingFunctionNode, name: *NSString) -> void {
        sel := sel_registerName2("setName:");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, name);
    }
    arguments :: inline (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingNode) {
        sel := sel_registerName2("arguments");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector) -> *NSArray(*MTLFunctionStitchingNode) #c_call)objc_msgSend)(self, sel);
    }
    setArguments :: inline (self: *MTLFunctionStitchingFunctionNode, arguments: *NSArray(*MTLFunctionStitchingNode)) -> void {
        sel := sel_registerName2("setArguments:");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector, *NSArray(*MTLFunctionStitchingNode)) -> void #c_call)objc_msgSend)(self, sel, arguments);
    }
    controlDependencies :: inline (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        sel := sel_registerName2("controlDependencies");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call)objc_msgSend)(self, sel);
    }
    setControlDependencies :: inline (self: *MTLFunctionStitchingFunctionNode, controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        sel := sel_registerName2("setControlDependencies:");
        return xx (cast((*MTLFunctionStitchingFunctionNode, Selector, *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call)objc_msgSend)(self, sel, controlDependencies);
    }
}

MTLFunctionStitchingGraph :: struct #type_info_none {
    initWithFunctionName :: inline (self: *$instancetype/MTLFunctionStitchingGraph, functionName: *NSString, nodes: *NSArray(*MTLFunctionStitchingFunctionNode), outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> *instancetype {
        sel := sel_registerName2("initWithFunctionName:nodes:outputNode:attributes:");
        return xx (cast((*MTLFunctionStitchingGraph, Selector, *NSString, *NSArray(*MTLFunctionStitchingFunctionNode), *MTLFunctionStitchingFunctionNode, *NSArray(*MTLFunctionStitchingAttribute)) -> *instancetype #c_call)objc_msgSend)(self, sel, functionName, nodes, outputNode, attributes);
    }

    functionName :: inline (self: *MTLFunctionStitchingGraph) -> *NSString {
        sel := sel_registerName2("functionName");
        return xx (cast((*MTLFunctionStitchingGraph, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setFunctionName :: inline (self: *MTLFunctionStitchingGraph, functionName: *NSString) -> void {
        sel := sel_registerName2("setFunctionName:");
        return xx (cast((*MTLFunctionStitchingGraph, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, functionName);
    }
    nodes :: inline (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        sel := sel_registerName2("nodes");
        return xx (cast((*MTLFunctionStitchingGraph, Selector) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call)objc_msgSend)(self, sel);
    }
    setNodes :: inline (self: *MTLFunctionStitchingGraph, nodes: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        sel := sel_registerName2("setNodes:");
        return xx (cast((*MTLFunctionStitchingGraph, Selector, *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call)objc_msgSend)(self, sel, nodes);
    }
    outputNode :: inline (self: *MTLFunctionStitchingGraph) -> *MTLFunctionStitchingFunctionNode {
        sel := sel_registerName2("outputNode");
        return xx (cast((*MTLFunctionStitchingGraph, Selector) -> *MTLFunctionStitchingFunctionNode #c_call)objc_msgSend)(self, sel);
    }
    setOutputNode :: inline (self: *MTLFunctionStitchingGraph, outputNode: *MTLFunctionStitchingFunctionNode) -> void {
        sel := sel_registerName2("setOutputNode:");
        return xx (cast((*MTLFunctionStitchingGraph, Selector, *MTLFunctionStitchingFunctionNode) -> void #c_call)objc_msgSend)(self, sel, outputNode);
    }
    attributes :: inline (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingAttribute) {
        sel := sel_registerName2("attributes");
        return xx (cast((*MTLFunctionStitchingGraph, Selector) -> *NSArray(*MTLFunctionStitchingAttribute) #c_call)objc_msgSend)(self, sel);
    }
    setAttributes :: inline (self: *MTLFunctionStitchingGraph, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> void {
        sel := sel_registerName2("setAttributes:");
        return xx (cast((*MTLFunctionStitchingGraph, Selector, *NSArray(*MTLFunctionStitchingAttribute)) -> void #c_call)objc_msgSend)(self, sel, attributes);
    }
}

MTLStitchedLibraryDescriptor :: struct #type_info_none {
    functionGraphs :: inline (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunctionStitchingGraph) {
        sel := sel_registerName2("functionGraphs");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector) -> *NSArray(*MTLFunctionStitchingGraph) #c_call)objc_msgSend)(self, sel);
    }
    setFunctionGraphs :: inline (self: *MTLStitchedLibraryDescriptor, functionGraphs: *NSArray(*MTLFunctionStitchingGraph)) -> void {
        sel := sel_registerName2("setFunctionGraphs:");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector, *NSArray(*MTLFunctionStitchingGraph)) -> void #c_call)objc_msgSend)(self, sel, functionGraphs);
    }
    functions :: inline (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunction) {
        sel := sel_registerName2("functions");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector) -> *NSArray(*MTLFunction) #c_call)objc_msgSend)(self, sel);
    }
    setFunctions :: inline (self: *MTLStitchedLibraryDescriptor, functions: *NSArray(*MTLFunction)) -> void {
        sel := sel_registerName2("setFunctions:");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector, *NSArray(*MTLFunction)) -> void #c_call)objc_msgSend)(self, sel, functions);
    }

    binaryArchives :: inline (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLBinaryArchive) {
        sel := sel_registerName2("binaryArchives");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector) -> *NSArray(*MTLBinaryArchive) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryArchives :: inline (self: *MTLStitchedLibraryDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        sel := sel_registerName2("setBinaryArchives:");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector, *NSArray(*MTLBinaryArchive)) -> void #c_call)objc_msgSend)(self, sel, binaryArchives);
    }

    options :: inline (self: *MTLStitchedLibraryDescriptor) -> MTLStitchedLibraryOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector) -> MTLStitchedLibraryOptions #c_call)objc_msgSend)(self, sel);
    }
    setOptions :: inline (self: *MTLStitchedLibraryDescriptor, options: MTLStitchedLibraryOptions) -> void {
        sel := sel_registerName2("setOptions:");
        return xx (cast((*MTLStitchedLibraryDescriptor, Selector, MTLStitchedLibraryOptions) -> void #c_call)objc_msgSend)(self, sel, options);
    }
}

MTLIOPriority :: enum NSInteger {
    High   :: 0;
    Normal :: 1;
    Low    :: 2;
}

MTLIOCommandQueueType :: enum NSInteger {
    Concurrent :: 0;
    Serial     :: 1;
}

MTLIOError :: enum NSInteger {
    URLInvalid :: 1;
    Internal   :: 2;
}

MTLIOCommandQueue :: struct #type_info_none {
    enqueueBarrier :: inline (self: *MTLIOCommandQueue) -> void {
        sel := sel_registerName2("enqueueBarrier");
        return xx (cast((*MTLIOCommandQueue, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    commandBuffer :: inline (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        sel := sel_registerName2("commandBuffer");
        return xx (cast((*MTLIOCommandQueue, Selector) -> *MTLIOCommandBuffer #c_call)objc_msgSend)(self, sel);
    }

    commandBufferWithUnretainedReferences :: inline (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        sel := sel_registerName2("commandBufferWithUnretainedReferences");
        return xx (cast((*MTLIOCommandQueue, Selector) -> *MTLIOCommandBuffer #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLIOCommandQueue) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLIOCommandQueue, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLIOCommandQueue, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLIOCommandQueue, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLIOScratchBuffer :: struct #type_info_none {
    buffer :: inline (self: *MTLIOScratchBuffer) -> *MTLBuffer {
        sel := sel_registerName2("buffer");
        return xx (cast((*MTLIOScratchBuffer, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
}

MTLIOScratchBufferAllocator :: struct #type_info_none {
    newScratchBufferWithMinimumSize :: inline (self: *MTLIOScratchBufferAllocator, minimumSize: NSUInteger) -> *MTLIOScratchBuffer {
        sel := sel_registerName2("newScratchBufferWithMinimumSize:");
        return xx (cast((*MTLIOScratchBufferAllocator, Selector, NSUInteger) -> *MTLIOScratchBuffer #c_call)objc_msgSend)(self, sel, minimumSize);
    }
}

MTLIOCommandQueueDescriptor :: struct #type_info_none {
    maxCommandBufferCount :: inline (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCommandBufferCount");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCommandBufferCount :: inline (self: *MTLIOCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCommandBufferCount:");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCommandBufferCount);
    }

    priority :: inline (self: *MTLIOCommandQueueDescriptor) -> MTLIOPriority {
        sel := sel_registerName2("priority");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector) -> MTLIOPriority #c_call)objc_msgSend)(self, sel);
    }
    setPriority :: inline (self: *MTLIOCommandQueueDescriptor, priority: MTLIOPriority) -> void {
        sel := sel_registerName2("setPriority:");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector, MTLIOPriority) -> void #c_call)objc_msgSend)(self, sel, priority);
    }

    type :: inline (self: *MTLIOCommandQueueDescriptor) -> MTLIOCommandQueueType {
        sel := sel_registerName2("type");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector) -> MTLIOCommandQueueType #c_call)objc_msgSend)(self, sel);
    }
    setType :: inline (self: *MTLIOCommandQueueDescriptor, type: MTLIOCommandQueueType) -> void {
        sel := sel_registerName2("setType:");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector, MTLIOCommandQueueType) -> void #c_call)objc_msgSend)(self, sel, type);
    }

    maxCommandsInFlight :: inline (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCommandsInFlight");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCommandsInFlight :: inline (self: *MTLIOCommandQueueDescriptor, maxCommandsInFlight: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCommandsInFlight:");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCommandsInFlight);
    }

    scratchBufferAllocator :: inline (self: *MTLIOCommandQueueDescriptor) -> *MTLIOScratchBufferAllocator {
        sel := sel_registerName2("scratchBufferAllocator");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector) -> *MTLIOScratchBufferAllocator #c_call)objc_msgSend)(self, sel);
    }
    setScratchBufferAllocator :: inline (self: *MTLIOCommandQueueDescriptor, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> void {
        sel := sel_registerName2("setScratchBufferAllocator:");
        return xx (cast((*MTLIOCommandQueueDescriptor, Selector, *MTLIOScratchBufferAllocator) -> void #c_call)objc_msgSend)(self, sel, scratchBufferAllocator);
    }
}

MTLIOFileHandle :: struct #type_info_none {
    label :: inline (self: *MTLIOFileHandle) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLIOFileHandle, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLIOFileHandle, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLIOFileHandle, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLIOStatus :: enum NSInteger {
    Pending   :: 0;
    Cancelled :: 1;
    Error     :: 2;
    Complete  :: 3;
}

MTLIOCommandBufferHandler :: Block;

MTLIOCommandBuffer :: struct #type_info_none {
    addCompletedHandler :: inline (self: *MTLIOCommandBuffer, block: MTLIOCommandBufferHandler) -> void {
        sel := sel_registerName2("addCompletedHandler:");
        return xx (cast((*MTLIOCommandBuffer, Selector, MTLIOCommandBufferHandler) -> void #c_call)objc_msgSend)(self, sel, block);
    }

    loadBytes :: inline (self: *MTLIOCommandBuffer, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        sel := sel_registerName2("loadBytes:size:sourceHandle:sourceHandleOffset:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *void, NSUInteger, *MTLIOFileHandle, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, pointer, size, sourceHandle, sourceHandleOffset);
    }

    loadBuffer :: inline (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        sel := sel_registerName2("loadBuffer:offset:size:sourceHandle:sourceHandleOffset:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *MTLBuffer, NSUInteger, NSUInteger, *MTLIOFileHandle, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset, size, sourceHandle, sourceHandleOffset);
    }

    loadTexture :: inline (self: *MTLIOCommandBuffer, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        sel := sel_registerName2("loadTexture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLSize, NSUInteger, NSUInteger, MTLOrigin, *MTLIOFileHandle, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level, size, sourceBytesPerRow, sourceBytesPerImage, destinationOrigin, sourceHandle, sourceHandleOffset);
    }

    copyStatusToBuffer :: inline (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        sel := sel_registerName2("copyStatusToBuffer:offset:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *MTLBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, buffer, offset);
    }

    commit :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("commit");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    waitUntilCompleted :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("waitUntilCompleted");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    tryCancel :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("tryCancel");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    addBarrier :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("addBarrier");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    pushDebugGroup :: inline (self: *MTLIOCommandBuffer, _string: *NSString) -> void {
        sel := sel_registerName2("pushDebugGroup:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, _string);
    }

    popDebugGroup :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("popDebugGroup");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    enqueue :: inline (self: *MTLIOCommandBuffer) -> void {
        sel := sel_registerName2("enqueue");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    waitForEvent :: inline (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        sel := sel_registerName2("waitForEvent:value:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *MTLSharedEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    signalEvent :: inline (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        sel := sel_registerName2("signalEvent:value:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *MTLSharedEvent, u64) -> void #c_call)objc_msgSend)(self, sel, event, value);
    }

    label :: inline (self: *MTLIOCommandBuffer) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLIOCommandBuffer, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLIOCommandBuffer, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    status :: inline (self: *MTLIOCommandBuffer) -> MTLIOStatus {
        sel := sel_registerName2("status");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> MTLIOStatus #c_call)objc_msgSend)(self, sel);
    }

    error :: inline (self: *MTLIOCommandBuffer) -> *NSError {
        sel := sel_registerName2("error");
        return xx (cast((*MTLIOCommandBuffer, Selector) -> *NSError #c_call)objc_msgSend)(self, sel);
    }
}

MTLIOCompressionStatus :: enum NSInteger {
    Complete :: 0;
    Error    :: 1;
}

MTLIOCompressionContext :: *void;

MTLResidencySetDescriptor :: struct #type_info_none {
    label :: inline (self: *MTLResidencySetDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLResidencySetDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLResidencySetDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLResidencySetDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    initialCapacity :: inline (self: *MTLResidencySetDescriptor) -> NSUInteger {
        sel := sel_registerName2("initialCapacity");
        return xx (cast((*MTLResidencySetDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInitialCapacity :: inline (self: *MTLResidencySetDescriptor, initialCapacity: NSUInteger) -> void {
        sel := sel_registerName2("setInitialCapacity:");
        return xx (cast((*MTLResidencySetDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, initialCapacity);
    }
}

MTLResidencySet :: struct #type_info_none {
    requestResidency :: inline (self: *MTLResidencySet) -> void {
        sel := sel_registerName2("requestResidency");
        return xx (cast((*MTLResidencySet, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    endResidency :: inline (self: *MTLResidencySet) -> void {
        sel := sel_registerName2("endResidency");
        return xx (cast((*MTLResidencySet, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    addAllocation :: inline (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        sel := sel_registerName2("addAllocation:");
        return xx (cast((*MTLResidencySet, Selector, *MTLAllocation) -> void #c_call)objc_msgSend)(self, sel, allocation);
    }

    addAllocations :: inline (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        sel := sel_registerName2("addAllocations:count:");
        return xx (cast((*MTLResidencySet, Selector, **MTLAllocation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, allocations, count);
    }

    removeAllocation :: inline (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        sel := sel_registerName2("removeAllocation:");
        return xx (cast((*MTLResidencySet, Selector, *MTLAllocation) -> void #c_call)objc_msgSend)(self, sel, allocation);
    }

    removeAllocations :: inline (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        sel := sel_registerName2("removeAllocations:count:");
        return xx (cast((*MTLResidencySet, Selector, **MTLAllocation, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, allocations, count);
    }

    removeAllAllocations :: inline (self: *MTLResidencySet) -> void {
        sel := sel_registerName2("removeAllAllocations");
        return xx (cast((*MTLResidencySet, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    containsAllocation :: inline (self: *MTLResidencySet, anAllocation: *MTLAllocation) -> BOOL {
        sel := sel_registerName2("containsAllocation:");
        return xx (cast((*MTLResidencySet, Selector, *MTLAllocation) -> BOOL #c_call)objc_msgSend)(self, sel, anAllocation);
    }

    commit :: inline (self: *MTLResidencySet) -> void {
        sel := sel_registerName2("commit");
        return xx (cast((*MTLResidencySet, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLResidencySet) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLResidencySet, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLResidencySet) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLResidencySet, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    allocatedSize :: inline (self: *MTLResidencySet) -> u64 {
        sel := sel_registerName2("allocatedSize");
        return xx (cast((*MTLResidencySet, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    allAllocations :: inline (self: *MTLResidencySet) -> *NSArray(*MTLAllocation) {
        sel := sel_registerName2("allAllocations");
        return xx (cast((*MTLResidencySet, Selector) -> *NSArray(*MTLAllocation) #c_call)objc_msgSend)(self, sel);
    }

    allocationCount :: inline (self: *MTLResidencySet) -> NSUInteger {
        sel := sel_registerName2("allocationCount");
        return xx (cast((*MTLResidencySet, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTLResourceViewPoolDescriptor :: struct #type_info_none {
    resourceViewCount :: inline (self: *MTLResourceViewPoolDescriptor) -> NSUInteger {
        sel := sel_registerName2("resourceViewCount");
        return xx (cast((*MTLResourceViewPoolDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setResourceViewCount :: inline (self: *MTLResourceViewPoolDescriptor, resourceViewCount: NSUInteger) -> void {
        sel := sel_registerName2("setResourceViewCount:");
        return xx (cast((*MTLResourceViewPoolDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resourceViewCount);
    }

    label :: inline (self: *MTLResourceViewPoolDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLResourceViewPoolDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTLResourceViewPoolDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTLResourceViewPoolDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTLResourceViewPool :: struct #type_info_none {
    copyResourceViewsFromPool :: inline (self: *MTLResourceViewPool, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID {
        sel := sel_registerName2("copyResourceViewsFromPool:sourceRange:destinationIndex:");
        return xx (cast((*MTLResourceViewPool, Selector, *MTLResourceViewPool, NSRange, NSUInteger) -> MTLResourceID #c_call)objc_msgSend)(self, sel, sourcePool, sourceRange, destinationIndex);
    }

    baseResourceID :: inline (self: *MTLResourceViewPool) -> MTLResourceID {
        sel := sel_registerName2("baseResourceID");
        return xx (cast((*MTLResourceViewPool, Selector) -> MTLResourceID #c_call)objc_msgSend)(self, sel);
    }

    resourceViewCount :: inline (self: *MTLResourceViewPool) -> NSUInteger {
        sel := sel_registerName2("resourceViewCount");
        return xx (cast((*MTLResourceViewPool, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTLResourceViewPool) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTLResourceViewPool, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTLResourceViewPool) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTLResourceViewPool, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTLTextureViewPool :: struct #type_info_none {
    #as using mtlresourceviewpool: MTLResourceViewPool;

    setTextureView :: inline (self: *MTLTextureViewPool, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID {
        sel := sel_registerName2("setTextureView:atIndex:");
        return xx (cast((*MTLTextureViewPool, Selector, *MTLTexture, NSUInteger) -> MTLResourceID #c_call)objc_msgSend)(self, sel, texture, index);
    }

    setTextureView :: inline (self: *MTLTextureViewPool, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID {
        sel := sel_registerName2("setTextureView:descriptor:atIndex:");
        return xx (cast((*MTLTextureViewPool, Selector, *MTLTexture, *MTLTextureViewDescriptor, NSUInteger) -> MTLResourceID #c_call)objc_msgSend)(self, sel, texture, descriptor, index);
    }

    setTextureViewFromBuffer :: inline (self: *MTLTextureViewPool, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID {
        sel := sel_registerName2("setTextureViewFromBuffer:descriptor:offset:bytesPerRow:atIndex:");
        return xx (cast((*MTLTextureViewPool, Selector, *MTLBuffer, *MTLTextureDescriptor, NSUInteger, NSUInteger, NSUInteger) -> MTLResourceID #c_call)objc_msgSend)(self, sel, buffer, descriptor, offset, bytesPerRow, index);
    }
}

MTL4ArgumentTableDescriptor :: struct #type_info_none {
    maxBufferBindCount :: inline (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxBufferBindCount");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxBufferBindCount :: inline (self: *MTL4ArgumentTableDescriptor, maxBufferBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxBufferBindCount:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxBufferBindCount);
    }

    maxTextureBindCount :: inline (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTextureBindCount");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTextureBindCount :: inline (self: *MTL4ArgumentTableDescriptor, maxTextureBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTextureBindCount:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTextureBindCount);
    }

    maxSamplerStateBindCount :: inline (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxSamplerStateBindCount");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxSamplerStateBindCount :: inline (self: *MTL4ArgumentTableDescriptor, maxSamplerStateBindCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxSamplerStateBindCount:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxSamplerStateBindCount);
    }

    initializeBindings :: inline (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        sel := sel_registerName2("initializeBindings");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setInitializeBindings :: inline (self: *MTL4ArgumentTableDescriptor, initializeBindings: BOOL) -> void {
        sel := sel_registerName2("setInitializeBindings:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, initializeBindings);
    }

    supportAttributeStrides :: inline (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        sel := sel_registerName2("supportAttributeStrides");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportAttributeStrides :: inline (self: *MTL4ArgumentTableDescriptor, supportAttributeStrides: BOOL) -> void {
        sel := sel_registerName2("setSupportAttributeStrides:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportAttributeStrides);
    }

    label :: inline (self: *MTL4ArgumentTableDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4ArgumentTableDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4ArgumentTableDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTL4ArgumentTable :: struct #type_info_none {
    setAddress :: inline (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> void {
        sel := sel_registerName2("setAddress:atIndex:");
        return xx (cast((*MTL4ArgumentTable, Selector, MTLGPUAddress, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, gpuAddress, bindingIndex);
    }

    setAddress :: inline (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> void {
        sel := sel_registerName2("setAddress:attributeStride:atIndex:");
        return xx (cast((*MTL4ArgumentTable, Selector, MTLGPUAddress, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, gpuAddress, stride, bindingIndex);
    }

    setResource :: inline (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        sel := sel_registerName2("setResource:atBufferIndex:");
        return xx (cast((*MTL4ArgumentTable, Selector, MTLResourceID, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resourceID, bindingIndex);
    }

    setTexture :: inline (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        sel := sel_registerName2("setTexture:atIndex:");
        return xx (cast((*MTL4ArgumentTable, Selector, MTLResourceID, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resourceID, bindingIndex);
    }

    setSamplerState :: inline (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        sel := sel_registerName2("setSamplerState:atIndex:");
        return xx (cast((*MTL4ArgumentTable, Selector, MTLResourceID, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, resourceID, bindingIndex);
    }

    device :: inline (self: *MTL4ArgumentTable) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4ArgumentTable, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4ArgumentTable) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4ArgumentTable, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTL4BinaryFunction :: struct #type_info_none {
    name :: inline (self: *MTL4BinaryFunction) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTL4BinaryFunction, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    functionType :: inline (self: *MTL4BinaryFunction) -> MTLFunctionType {
        sel := sel_registerName2("functionType");
        return xx (cast((*MTL4BinaryFunction, Selector) -> MTLFunctionType #c_call)objc_msgSend)(self, sel);
    }
}

MTL4CommandAllocatorDescriptor :: struct #type_info_none {
    label :: inline (self: *MTL4CommandAllocatorDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandAllocatorDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4CommandAllocatorDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4CommandAllocatorDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTL4CommandAllocator :: struct #type_info_none {
    allocatedSize :: inline (self: *MTL4CommandAllocator) -> u64 {
        sel := sel_registerName2("allocatedSize");
        return xx (cast((*MTL4CommandAllocator, Selector) -> u64 #c_call)objc_msgSend)(self, sel);
    }

    reset :: inline (self: *MTL4CommandAllocator) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4CommandAllocator, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTL4CommandAllocator) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4CommandAllocator, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4CommandAllocator) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4CommandAllocator, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
}

MTL4RenderPassDescriptor :: struct #type_info_none {
    setSamplePositions :: inline (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        sel := sel_registerName2("setSamplePositions:count:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLSamplePosition, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, positions, count);
    }

    getSamplePositions :: inline (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        sel := sel_registerName2("getSamplePositions:count:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLSamplePosition, NSUInteger) -> NSUInteger #c_call)objc_msgSend)(self, sel, positions, count);
    }

    colorAttachments :: inline (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    depthAttachment :: inline (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        sel := sel_registerName2("depthAttachment");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> *MTLRenderPassDepthAttachmentDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setDepthAttachment :: inline (self: *MTL4RenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        sel := sel_registerName2("setDepthAttachment:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call)objc_msgSend)(self, sel, depthAttachment);
    }

    stencilAttachment :: inline (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        sel := sel_registerName2("stencilAttachment");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> *MTLRenderPassStencilAttachmentDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setStencilAttachment :: inline (self: *MTL4RenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        sel := sel_registerName2("setStencilAttachment:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call)objc_msgSend)(self, sel, stencilAttachment);
    }

    renderTargetArrayLength :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetArrayLength");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetArrayLength :: inline (self: *MTL4RenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetArrayLength:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetArrayLength);
    }

    imageblockSampleLength :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("imageblockSampleLength");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setImageblockSampleLength :: inline (self: *MTL4RenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        sel := sel_registerName2("setImageblockSampleLength:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, imageblockSampleLength);
    }

    threadgroupMemoryLength :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("threadgroupMemoryLength");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setThreadgroupMemoryLength :: inline (self: *MTL4RenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, threadgroupMemoryLength);
    }

    tileWidth :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("tileWidth");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTileWidth :: inline (self: *MTL4RenderPassDescriptor, tileWidth: NSUInteger) -> void {
        sel := sel_registerName2("setTileWidth:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, tileWidth);
    }

    tileHeight :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("tileHeight");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTileHeight :: inline (self: *MTL4RenderPassDescriptor, tileHeight: NSUInteger) -> void {
        sel := sel_registerName2("setTileHeight:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, tileHeight);
    }

    defaultRasterSampleCount :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("defaultRasterSampleCount");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setDefaultRasterSampleCount :: inline (self: *MTL4RenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setDefaultRasterSampleCount:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, defaultRasterSampleCount);
    }

    renderTargetWidth :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetWidth");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetWidth :: inline (self: *MTL4RenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetWidth:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetWidth);
    }

    renderTargetHeight :: inline (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        sel := sel_registerName2("renderTargetHeight");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRenderTargetHeight :: inline (self: *MTL4RenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        sel := sel_registerName2("setRenderTargetHeight:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, renderTargetHeight);
    }

    rasterizationRateMap :: inline (self: *MTL4RenderPassDescriptor) -> *MTLRasterizationRateMap {
        sel := sel_registerName2("rasterizationRateMap");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> *MTLRasterizationRateMap #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationRateMap :: inline (self: *MTL4RenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        sel := sel_registerName2("setRasterizationRateMap:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLRasterizationRateMap) -> void #c_call)objc_msgSend)(self, sel, rasterizationRateMap);
    }

    visibilityResultBuffer :: inline (self: *MTL4RenderPassDescriptor) -> *MTLBuffer {
        sel := sel_registerName2("visibilityResultBuffer");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> *MTLBuffer #c_call)objc_msgSend)(self, sel);
    }
    setVisibilityResultBuffer :: inline (self: *MTL4RenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        sel := sel_registerName2("setVisibilityResultBuffer:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, *MTLBuffer) -> void #c_call)objc_msgSend)(self, sel, visibilityResultBuffer);
    }

    visibilityResultType :: inline (self: *MTL4RenderPassDescriptor) -> MTLVisibilityResultType {
        sel := sel_registerName2("visibilityResultType");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> MTLVisibilityResultType #c_call)objc_msgSend)(self, sel);
    }
    setVisibilityResultType :: inline (self: *MTL4RenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        sel := sel_registerName2("setVisibilityResultType:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, MTLVisibilityResultType) -> void #c_call)objc_msgSend)(self, sel, visibilityResultType);
    }

    supportColorAttachmentMapping :: inline (self: *MTL4RenderPassDescriptor) -> BOOL {
        sel := sel_registerName2("supportColorAttachmentMapping");
        return xx (cast((*MTL4RenderPassDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportColorAttachmentMapping :: inline (self: *MTL4RenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        sel := sel_registerName2("setSupportColorAttachmentMapping:");
        return xx (cast((*MTL4RenderPassDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportColorAttachmentMapping);
    }
}

MTL4AccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtlaccelerationstructuredescriptor: MTLAccelerationStructureDescriptor;
}

MTL4AccelerationStructureGeometryDescriptor :: struct #type_info_none {
    intersectionFunctionTableOffset :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("intersectionFunctionTableOffset");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setIntersectionFunctionTableOffset :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        sel := sel_registerName2("setIntersectionFunctionTableOffset:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, intersectionFunctionTableOffset);
    }

    opaque :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        sel := sel_registerName2("opaque");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setOpaque :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        sel := sel_registerName2("setOpaque:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, opaque);
    }

    allowDuplicateIntersectionFunctionInvocation :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        sel := sel_registerName2("allowDuplicateIntersectionFunctionInvocation");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAllowDuplicateIntersectionFunctionInvocation :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        sel := sel_registerName2("setAllowDuplicateIntersectionFunctionInvocation:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, allowDuplicateIntersectionFunctionInvocation);
    }

    label :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    primitiveDataBuffer :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("primitiveDataBuffer");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataBuffer :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setPrimitiveDataBuffer:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, primitiveDataBuffer);
    }

    primitiveDataStride :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("primitiveDataStride");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataStride :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        sel := sel_registerName2("setPrimitiveDataStride:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveDataStride);
    }

    primitiveDataElementSize :: inline (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("primitiveDataElementSize");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPrimitiveDataElementSize :: inline (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        sel := sel_registerName2("setPrimitiveDataElementSize:");
        return xx (cast((*MTL4AccelerationStructureGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, primitiveDataElementSize);
    }
}

MTL4PrimitiveAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuredescriptor: MTL4AccelerationStructureDescriptor;

    geometryDescriptors :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) {
        sel := sel_registerName2("geometryDescriptors");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) #c_call)objc_msgSend)(self, sel);
    }
    setGeometryDescriptors :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void {
        sel := sel_registerName2("setGeometryDescriptors:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void #c_call)objc_msgSend)(self, sel, geometryDescriptors);
    }

    motionStartBorderMode :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        sel := sel_registerName2("motionStartBorderMode");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> MTLMotionBorderMode #c_call)objc_msgSend)(self, sel);
    }
    setMotionStartBorderMode :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        sel := sel_registerName2("setMotionStartBorderMode:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, MTLMotionBorderMode) -> void #c_call)objc_msgSend)(self, sel, motionStartBorderMode);
    }

    motionEndBorderMode :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        sel := sel_registerName2("motionEndBorderMode");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> MTLMotionBorderMode #c_call)objc_msgSend)(self, sel);
    }
    setMotionEndBorderMode :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        sel := sel_registerName2("setMotionEndBorderMode:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, MTLMotionBorderMode) -> void #c_call)objc_msgSend)(self, sel, motionEndBorderMode);
    }

    motionStartTime :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float {
        sel := sel_registerName2("motionStartTime");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setMotionStartTime :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> void {
        sel := sel_registerName2("setMotionStartTime:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, motionStartTime);
    }

    motionEndTime :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float {
        sel := sel_registerName2("motionEndTime");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> float #c_call)objc_msgSend)(self, sel);
    }
    setMotionEndTime :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> void {
        sel := sel_registerName2("setMotionEndTime:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, float) -> void #c_call)objc_msgSend)(self, sel, motionEndTime);
    }

    motionKeyframeCount :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionKeyframeCount");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionKeyframeCount :: inline (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        sel := sel_registerName2("setMotionKeyframeCount:");
        return xx (cast((*MTL4PrimitiveAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionKeyframeCount);
    }
}

MTL4AccelerationStructureTriangleGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    vertexBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("vertexBuffer");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setVertexBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setVertexBuffer:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, vertexBuffer);
    }

    vertexFormat :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("vertexFormat");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setVertexFormat :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setVertexFormat:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, vertexFormat);
    }

    vertexStride :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("vertexStride");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setVertexStride :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        sel := sel_registerName2("setVertexStride:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, vertexStride);
    }

    indexBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexType :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    triangleCount :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("triangleCount");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTriangleCount :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        sel := sel_registerName2("setTriangleCount:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, triangleCount);
    }

    transformationMatrixBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("transformationMatrixBuffer");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBuffer :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setTransformationMatrixBuffer:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBuffer);
    }

    transformationMatrixLayout :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("transformationMatrixLayout");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixLayout :: inline (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setTransformationMatrixLayout:");
        return xx (cast((*MTL4AccelerationStructureTriangleGeometryDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixLayout);
    }
}

MTL4AccelerationStructureBoundingBoxGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    boundingBoxBuffer :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("boundingBoxBuffer");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxBuffer :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setBoundingBoxBuffer:");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, boundingBoxBuffer);
    }

    boundingBoxStride :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxStride");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxStride :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxStride:");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxStride);
    }

    boundingBoxCount :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxCount");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxCount :: inline (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxCount:");
        return xx (cast((*MTL4AccelerationStructureBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxCount);
    }
}

MTL4AccelerationStructureMotionTriangleGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    vertexBuffers :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("vertexBuffers");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setVertexBuffers :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: MTL4BufferRange) -> void {
        sel := sel_registerName2("setVertexBuffers:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, vertexBuffers);
    }

    vertexFormat :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("vertexFormat");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setVertexFormat :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setVertexFormat:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, vertexFormat);
    }

    vertexStride :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("vertexStride");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setVertexStride :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        sel := sel_registerName2("setVertexStride:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, vertexStride);
    }

    indexBuffer :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexType :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    triangleCount :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("triangleCount");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setTriangleCount :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        sel := sel_registerName2("setTriangleCount:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, triangleCount);
    }

    transformationMatrixBuffer :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("transformationMatrixBuffer");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixBuffer :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setTransformationMatrixBuffer:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixBuffer);
    }

    transformationMatrixLayout :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("transformationMatrixLayout");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setTransformationMatrixLayout :: inline (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setTransformationMatrixLayout:");
        return xx (cast((*MTL4AccelerationStructureMotionTriangleGeometryDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, transformationMatrixLayout);
    }
}

MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    boundingBoxBuffers :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("boundingBoxBuffers");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxBuffers :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: MTL4BufferRange) -> void {
        sel := sel_registerName2("setBoundingBoxBuffers:");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, boundingBoxBuffers);
    }

    boundingBoxStride :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxStride");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxStride :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxStride:");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxStride);
    }

    boundingBoxCount :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("boundingBoxCount");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setBoundingBoxCount :: inline (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        sel := sel_registerName2("setBoundingBoxCount:");
        return xx (cast((*MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, boundingBoxCount);
    }
}

MTL4AccelerationStructureCurveGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    controlPointBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("controlPointBuffer");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setControlPointBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setControlPointBuffer:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, controlPointBuffer);
    }

    controlPointCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointCount");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointCount:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointCount);
    }

    controlPointStride :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointStride");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointStride :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointStride:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointStride);
    }

    controlPointFormat :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("controlPointFormat");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setControlPointFormat :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setControlPointFormat:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, controlPointFormat);
    }

    radiusBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("radiusBuffer");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setRadiusBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setRadiusBuffer:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, radiusBuffer);
    }

    radiusFormat :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("radiusFormat");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setRadiusFormat :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setRadiusFormat:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, radiusFormat);
    }

    radiusStride :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("radiusStride");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRadiusStride :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        sel := sel_registerName2("setRadiusStride:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, radiusStride);
    }

    indexBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexType :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    segmentCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentCount");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentCount:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentCount);
    }

    segmentControlPointCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentControlPointCount");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentControlPointCount :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentControlPointCount:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentControlPointCount);
    }

    curveType :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        sel := sel_registerName2("curveType");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveType #c_call)objc_msgSend)(self, sel);
    }
    setCurveType :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        sel := sel_registerName2("setCurveType:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveType) -> void #c_call)objc_msgSend)(self, sel, curveType);
    }

    curveBasis :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        sel := sel_registerName2("curveBasis");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveBasis #c_call)objc_msgSend)(self, sel);
    }
    setCurveBasis :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        sel := sel_registerName2("setCurveBasis:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveBasis) -> void #c_call)objc_msgSend)(self, sel, curveBasis);
    }

    curveEndCaps :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        sel := sel_registerName2("curveEndCaps");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector) -> MTLCurveEndCaps #c_call)objc_msgSend)(self, sel);
    }
    setCurveEndCaps :: inline (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        sel := sel_registerName2("setCurveEndCaps:");
        return xx (cast((*MTL4AccelerationStructureCurveGeometryDescriptor, Selector, MTLCurveEndCaps) -> void #c_call)objc_msgSend)(self, sel, curveEndCaps);
    }
}

MTL4AccelerationStructureMotionCurveGeometryDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuregeometrydescriptor: MTL4AccelerationStructureGeometryDescriptor;

    controlPointBuffers :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("controlPointBuffers");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setControlPointBuffers :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: MTL4BufferRange) -> void {
        sel := sel_registerName2("setControlPointBuffers:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, controlPointBuffers);
    }

    controlPointCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointCount");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointCount:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointCount);
    }

    controlPointStride :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("controlPointStride");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setControlPointStride :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        sel := sel_registerName2("setControlPointStride:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, controlPointStride);
    }

    controlPointFormat :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("controlPointFormat");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setControlPointFormat :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setControlPointFormat:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, controlPointFormat);
    }

    radiusBuffers :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("radiusBuffers");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setRadiusBuffers :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: MTL4BufferRange) -> void {
        sel := sel_registerName2("setRadiusBuffers:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, radiusBuffers);
    }

    radiusFormat :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        sel := sel_registerName2("radiusFormat");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLAttributeFormat #c_call)objc_msgSend)(self, sel);
    }
    setRadiusFormat :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        sel := sel_registerName2("setRadiusFormat:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLAttributeFormat) -> void #c_call)objc_msgSend)(self, sel, radiusFormat);
    }

    radiusStride :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("radiusStride");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRadiusStride :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        sel := sel_registerName2("setRadiusStride:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, radiusStride);
    }

    indexBuffer :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("indexBuffer");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setIndexBuffer :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setIndexBuffer:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, indexBuffer);
    }

    indexType :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        sel := sel_registerName2("indexType");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLIndexType #c_call)objc_msgSend)(self, sel);
    }
    setIndexType :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        sel := sel_registerName2("setIndexType:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLIndexType) -> void #c_call)objc_msgSend)(self, sel, indexType);
    }

    segmentCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentCount");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentCount:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentCount);
    }

    segmentControlPointCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        sel := sel_registerName2("segmentControlPointCount");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setSegmentControlPointCount :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        sel := sel_registerName2("setSegmentControlPointCount:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, segmentControlPointCount);
    }

    curveType :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        sel := sel_registerName2("curveType");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveType #c_call)objc_msgSend)(self, sel);
    }
    setCurveType :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        sel := sel_registerName2("setCurveType:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveType) -> void #c_call)objc_msgSend)(self, sel, curveType);
    }

    curveBasis :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        sel := sel_registerName2("curveBasis");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveBasis #c_call)objc_msgSend)(self, sel);
    }
    setCurveBasis :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        sel := sel_registerName2("setCurveBasis:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveBasis) -> void #c_call)objc_msgSend)(self, sel, curveBasis);
    }

    curveEndCaps :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        sel := sel_registerName2("curveEndCaps");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector) -> MTLCurveEndCaps #c_call)objc_msgSend)(self, sel);
    }
    setCurveEndCaps :: inline (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        sel := sel_registerName2("setCurveEndCaps:");
        return xx (cast((*MTL4AccelerationStructureMotionCurveGeometryDescriptor, Selector, MTLCurveEndCaps) -> void #c_call)objc_msgSend)(self, sel, curveEndCaps);
    }
}

MTL4InstanceAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuredescriptor: MTL4AccelerationStructureDescriptor;

    instanceDescriptorBuffer :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("instanceDescriptorBuffer");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBuffer :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setInstanceDescriptorBuffer:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBuffer);
    }

    instanceDescriptorStride :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorStride");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorStride :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorStride:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorStride);
    }

    instanceCount :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceCount");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceCount :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceCount:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceCount);
    }

    instanceDescriptorType :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        sel := sel_registerName2("instanceDescriptorType");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> MTLAccelerationStructureInstanceDescriptorType #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorType :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        sel := sel_registerName2("setInstanceDescriptorType:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, MTLAccelerationStructureInstanceDescriptorType) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorType);
    }

    motionTransformBuffer :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("motionTransformBuffer");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBuffer :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setMotionTransformBuffer:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, motionTransformBuffer);
    }

    motionTransformCount :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformCount");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformCount :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformCount:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformCount);
    }

    instanceTransformationMatrixLayout :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("instanceTransformationMatrixLayout");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setInstanceTransformationMatrixLayout :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setInstanceTransformationMatrixLayout:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, instanceTransformationMatrixLayout);
    }

    motionTransformType :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLTransformType {
        sel := sel_registerName2("motionTransformType");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> MTLTransformType #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformType :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        sel := sel_registerName2("setMotionTransformType:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, MTLTransformType) -> void #c_call)objc_msgSend)(self, sel, motionTransformType);
    }

    motionTransformStride :: inline (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformStride");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformStride :: inline (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformStride:");
        return xx (cast((*MTL4InstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformStride);
    }
}

MTL4IndirectInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    #as using mtl4accelerationstructuredescriptor: MTL4AccelerationStructureDescriptor;

    instanceDescriptorBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("instanceDescriptorBuffer");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setInstanceDescriptorBuffer:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorBuffer);
    }

    instanceDescriptorStride :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("instanceDescriptorStride");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorStride :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        sel := sel_registerName2("setInstanceDescriptorStride:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorStride);
    }

    maxInstanceCount :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxInstanceCount");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxInstanceCount :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxInstanceCount:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxInstanceCount);
    }

    instanceCountBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("instanceCountBuffer");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setInstanceCountBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setInstanceCountBuffer:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, instanceCountBuffer);
    }

    instanceDescriptorType :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        sel := sel_registerName2("instanceDescriptorType");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLAccelerationStructureInstanceDescriptorType #c_call)objc_msgSend)(self, sel);
    }
    setInstanceDescriptorType :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        sel := sel_registerName2("setInstanceDescriptorType:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTLAccelerationStructureInstanceDescriptorType) -> void #c_call)objc_msgSend)(self, sel, instanceDescriptorType);
    }

    motionTransformBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("motionTransformBuffer");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setMotionTransformBuffer:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, motionTransformBuffer);
    }

    maxMotionTransformCount :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxMotionTransformCount");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxMotionTransformCount :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxMotionTransformCount:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxMotionTransformCount);
    }

    motionTransformCountBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        sel := sel_registerName2("motionTransformCountBuffer");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTL4BufferRange #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformCountBuffer :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("setMotionTransformCountBuffer:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, motionTransformCountBuffer);
    }

    instanceTransformationMatrixLayout :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        sel := sel_registerName2("instanceTransformationMatrixLayout");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLMatrixLayout #c_call)objc_msgSend)(self, sel);
    }
    setInstanceTransformationMatrixLayout :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        sel := sel_registerName2("setInstanceTransformationMatrixLayout:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTLMatrixLayout) -> void #c_call)objc_msgSend)(self, sel, instanceTransformationMatrixLayout);
    }

    motionTransformType :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        sel := sel_registerName2("motionTransformType");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> MTLTransformType #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformType :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        sel := sel_registerName2("setMotionTransformType:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, MTLTransformType) -> void #c_call)objc_msgSend)(self, sel, motionTransformType);
    }

    motionTransformStride :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        sel := sel_registerName2("motionTransformStride");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMotionTransformStride :: inline (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        sel := sel_registerName2("setMotionTransformStride:");
        return xx (cast((*MTL4IndirectInstanceAccelerationStructureDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, motionTransformStride);
    }
}

MTL4ComputeCommandEncoder :: struct #type_info_none {
    #as using mtl4commandencoder: MTL4CommandEncoder;

    stages :: inline (self: *MTL4ComputeCommandEncoder) -> MTLStages {
        sel := sel_registerName2("stages");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector) -> MTLStages #c_call)objc_msgSend)(self, sel);
    }

    setComputePipelineState :: inline (self: *MTL4ComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        sel := sel_registerName2("setComputePipelineState:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLComputePipelineState) -> void #c_call)objc_msgSend)(self, sel, state);
    }

    setThreadgroupMemoryLength :: inline (self: *MTL4ComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        sel := sel_registerName2("setThreadgroupMemoryLength:atIndex:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, length, index);
    }

    setImageblockWidth :: inline (self: *MTL4ComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        sel := sel_registerName2("setImageblockWidth:height:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, width, height);
    }

    dispatchThreads :: inline (self: *MTL4ComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreads:threadsPerThreadgroup:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroups :: inline (self: *MTL4ComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadgroups:threadsPerThreadgroup:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, MTLSize, MTLSize) -> void #c_call)objc_msgSend)(self, sel, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroupsWithIndirectBuffer :: inline (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("dispatchThreadgroupsWithIndirectBuffer:threadsPerThreadgroup:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, MTLGPUAddress, MTLSize) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer, threadsPerThreadgroup);
    }

    dispatchThreadsWithIndirectBuffer :: inline (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress) -> void {
        sel := sel_registerName2("dispatchThreadsWithIndirectBuffer:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, MTLGPUAddress) -> void #c_call)objc_msgSend)(self, sel, indirectBuffer);
    }

    executeCommandsInBuffer :: inline (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:withRange:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer :: inline (self: *MTL4ComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        sel := sel_registerName2("executeCommandsInBuffer:indirectBuffer:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, MTLGPUAddress) -> void #c_call)objc_msgSend)(self, sel, indirectCommandbuffer, indirectRangeBuffer);
    }

    copyFromTexture :: inline (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        sel := sel_registerName2("copyFromTexture:toTexture:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, destinationTexture);
    }

    copyFromTexture :: inline (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, *MTLTexture, NSUInteger, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

    copyFromTexture :: inline (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromTexture :: inline (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

    copyFromTexture :: inline (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        sel := sel_registerName2("copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLSize, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLBlitOption) -> void #c_call)objc_msgSend)(self, sel, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

    copyFromBuffer :: inline (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, *MTLBuffer, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

    copyFromBuffer :: inline (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer :: inline (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        sel := sel_registerName2("copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLBuffer, NSUInteger, NSUInteger, NSUInteger, MTLSize, *MTLTexture, NSUInteger, NSUInteger, MTLOrigin, MTLBlitOption) -> void #c_call)objc_msgSend)(self, sel, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

    copyFromTensor :: inline (self: *MTL4ComputeCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        sel := sel_registerName2("copyFromTensor:sourceOrigin:sourceDimensions:toTensor:destinationOrigin:destinationDimensions:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTensor, *MTLTensorExtents, *MTLTensorExtents, *MTLTensor, *MTLTensorExtents, *MTLTensorExtents) -> void #c_call)objc_msgSend)(self, sel, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }

    generateMipmapsForTexture :: inline (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("generateMipmapsForTexture:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    fillBuffer :: inline (self: *MTL4ComputeCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        sel := sel_registerName2("fillBuffer:range:value:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLBuffer, NSRange, u8) -> void #c_call)objc_msgSend)(self, sel, buffer, range, value);
    }

    optimizeContentsForGPUAccess :: inline (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("optimizeContentsForGPUAccess:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    optimizeContentsForGPUAccess :: inline (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        sel := sel_registerName2("optimizeContentsForGPUAccess:slice:level:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level);
    }

    optimizeContentsForCPUAccess :: inline (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        sel := sel_registerName2("optimizeContentsForCPUAccess:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture) -> void #c_call)objc_msgSend)(self, sel, texture);
    }

    optimizeContentsForCPUAccess :: inline (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        sel := sel_registerName2("optimizeContentsForCPUAccess:slice:level:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLTexture, NSUInteger, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, texture, slice, level);
    }

    resetCommandsInBuffer :: inline (self: *MTL4ComputeCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("resetCommandsInBuffer:withRange:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, buffer, range);
    }

    copyIndirectCommandBuffer :: inline (self: *MTL4ComputeCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        sel := sel_registerName2("copyIndirectCommandBuffer:sourceRange:destination:destinationIndex:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange, *MTLIndirectCommandBuffer, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, source, sourceRange, destination, destinationIndex);
    }

    optimizeIndirectCommandBuffer :: inline (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        sel := sel_registerName2("optimizeIndirectCommandBuffer:withRange:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLIndirectCommandBuffer, NSRange) -> void #c_call)objc_msgSend)(self, sel, indirectCommandBuffer, range);
    }

    setArgumentTable :: inline (self: *MTL4ComputeCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        sel := sel_registerName2("setArgumentTable:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTL4ArgumentTable) -> void #c_call)objc_msgSend)(self, sel, argumentTable);
    }

    buildAccelerationStructure :: inline (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("buildAccelerationStructure:descriptor:scratchBuffer:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, *MTL4AccelerationStructureDescriptor, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, descriptor, scratchBuffer);
    }

    refitAccelerationStructure :: inline (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("refitAccelerationStructure:descriptor:destination:scratchBuffer:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, *MTL4AccelerationStructureDescriptor, *MTLAccelerationStructure, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer);
    }

    refitAccelerationStructure :: inline (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> void {
        sel := sel_registerName2("refitAccelerationStructure:descriptor:destination:scratchBuffer:options:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, *MTL4AccelerationStructureDescriptor, *MTLAccelerationStructure, MTL4BufferRange, MTLAccelerationStructureRefitOptions) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, options);
    }

    copyAccelerationStructure :: inline (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        sel := sel_registerName2("copyAccelerationStructure:toAccelerationStructure:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructure) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeCompactedAccelerationStructureSize :: inline (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> void {
        sel := sel_registerName2("writeCompactedAccelerationStructureSize:toBuffer:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, MTL4BufferRange) -> void #c_call)objc_msgSend)(self, sel, accelerationStructure, buffer);
    }

    copyAndCompactAccelerationStructure :: inline (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        sel := sel_registerName2("copyAndCompactAccelerationStructure:toAccelerationStructure:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, *MTLAccelerationStructure, *MTLAccelerationStructure) -> void #c_call)objc_msgSend)(self, sel, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeTimestampWithGranularity :: inline (self: *MTL4ComputeCommandEncoder, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        sel := sel_registerName2("writeTimestampWithGranularity:intoHeap:atIndex:");
        return xx (cast((*MTL4ComputeCommandEncoder, Selector, MTL4TimestampGranularity, *MTL4CounterHeap, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, granularity, counterHeap, index);
    }
}

MTL4MachineLearningCommandEncoder :: struct #type_info_none {
    #as using mtl4commandencoder: MTL4CommandEncoder;

    setPipelineState :: inline (self: *MTL4MachineLearningCommandEncoder, pipelineState: *MTL4MachineLearningPipelineState) -> void {
        sel := sel_registerName2("setPipelineState:");
        return xx (cast((*MTL4MachineLearningCommandEncoder, Selector, *MTL4MachineLearningPipelineState) -> void #c_call)objc_msgSend)(self, sel, pipelineState);
    }

    setArgumentTable :: inline (self: *MTL4MachineLearningCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        sel := sel_registerName2("setArgumentTable:");
        return xx (cast((*MTL4MachineLearningCommandEncoder, Selector, *MTL4ArgumentTable) -> void #c_call)objc_msgSend)(self, sel, argumentTable);
    }

    dispatchNetworkWithIntermediatesHeap :: inline (self: *MTL4MachineLearningCommandEncoder, heap: *MTLHeap) -> void {
        sel := sel_registerName2("dispatchNetworkWithIntermediatesHeap:");
        return xx (cast((*MTL4MachineLearningCommandEncoder, Selector, *MTLHeap) -> void #c_call)objc_msgSend)(self, sel, heap);
    }
}

MTL4LibraryDescriptor :: struct #type_info_none {
    source :: inline (self: *MTL4LibraryDescriptor) -> *NSString {
        sel := sel_registerName2("source");
        return xx (cast((*MTL4LibraryDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setSource :: inline (self: *MTL4LibraryDescriptor, source: *NSString) -> void {
        sel := sel_registerName2("setSource:");
        return xx (cast((*MTL4LibraryDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, source);
    }

    options :: inline (self: *MTL4LibraryDescriptor) -> *MTLCompileOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTL4LibraryDescriptor, Selector) -> *MTLCompileOptions #c_call)objc_msgSend)(self, sel);
    }
    setOptions :: inline (self: *MTL4LibraryDescriptor, options: *MTLCompileOptions) -> void {
        sel := sel_registerName2("setOptions:");
        return xx (cast((*MTL4LibraryDescriptor, Selector, *MTLCompileOptions) -> void #c_call)objc_msgSend)(self, sel, options);
    }

    name :: inline (self: *MTL4LibraryDescriptor) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTL4LibraryDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setName :: inline (self: *MTL4LibraryDescriptor, name: *NSString) -> void {
        sel := sel_registerName2("setName:");
        return xx (cast((*MTL4LibraryDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, name);
    }
}

MTL4FunctionDescriptor :: struct #type_info_none {}

MTL4LibraryFunctionDescriptor :: struct #type_info_none {
    #as using mtl4functiondescriptor: MTL4FunctionDescriptor;

    name :: inline (self: *MTL4LibraryFunctionDescriptor) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTL4LibraryFunctionDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setName :: inline (self: *MTL4LibraryFunctionDescriptor, name: *NSString) -> void {
        sel := sel_registerName2("setName:");
        return xx (cast((*MTL4LibraryFunctionDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, name);
    }

    library :: inline (self: *MTL4LibraryFunctionDescriptor) -> *MTLLibrary {
        sel := sel_registerName2("library");
        return xx (cast((*MTL4LibraryFunctionDescriptor, Selector) -> *MTLLibrary #c_call)objc_msgSend)(self, sel);
    }
    setLibrary :: inline (self: *MTL4LibraryFunctionDescriptor, library: *MTLLibrary) -> void {
        sel := sel_registerName2("setLibrary:");
        return xx (cast((*MTL4LibraryFunctionDescriptor, Selector, *MTLLibrary) -> void #c_call)objc_msgSend)(self, sel, library);
    }
}

MTL4SpecializedFunctionDescriptor :: struct #type_info_none {
    #as using mtl4functiondescriptor: MTL4FunctionDescriptor;

    functionDescriptor :: inline (self: *MTL4SpecializedFunctionDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("functionDescriptor");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFunctionDescriptor :: inline (self: *MTL4SpecializedFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setFunctionDescriptor:");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, functionDescriptor);
    }

    specializedName :: inline (self: *MTL4SpecializedFunctionDescriptor) -> *NSString {
        sel := sel_registerName2("specializedName");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setSpecializedName :: inline (self: *MTL4SpecializedFunctionDescriptor, specializedName: *NSString) -> void {
        sel := sel_registerName2("setSpecializedName:");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, specializedName);
    }

    constantValues :: inline (self: *MTL4SpecializedFunctionDescriptor) -> *MTLFunctionConstantValues {
        sel := sel_registerName2("constantValues");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector) -> *MTLFunctionConstantValues #c_call)objc_msgSend)(self, sel);
    }
    setConstantValues :: inline (self: *MTL4SpecializedFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        sel := sel_registerName2("setConstantValues:");
        return xx (cast((*MTL4SpecializedFunctionDescriptor, Selector, *MTLFunctionConstantValues) -> void #c_call)objc_msgSend)(self, sel, constantValues);
    }
}

MTL4StitchedFunctionDescriptor :: struct #type_info_none {
    #as using mtl4functiondescriptor: MTL4FunctionDescriptor;

    functionGraph :: inline (self: *MTL4StitchedFunctionDescriptor) -> *MTLFunctionStitchingGraph {
        sel := sel_registerName2("functionGraph");
        return xx (cast((*MTL4StitchedFunctionDescriptor, Selector) -> *MTLFunctionStitchingGraph #c_call)objc_msgSend)(self, sel);
    }
    setFunctionGraph :: inline (self: *MTL4StitchedFunctionDescriptor, functionGraph: *MTLFunctionStitchingGraph) -> void {
        sel := sel_registerName2("setFunctionGraph:");
        return xx (cast((*MTL4StitchedFunctionDescriptor, Selector, *MTLFunctionStitchingGraph) -> void #c_call)objc_msgSend)(self, sel, functionGraph);
    }

    functionDescriptors :: inline (self: *MTL4StitchedFunctionDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        sel := sel_registerName2("functionDescriptors");
        return xx (cast((*MTL4StitchedFunctionDescriptor, Selector) -> *NSArray(*MTL4FunctionDescriptor) #c_call)objc_msgSend)(self, sel);
    }
    setFunctionDescriptors :: inline (self: *MTL4StitchedFunctionDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        sel := sel_registerName2("setFunctionDescriptors:");
        return xx (cast((*MTL4StitchedFunctionDescriptor, Selector, *NSArray(*MTL4FunctionDescriptor)) -> void #c_call)objc_msgSend)(self, sel, functionDescriptors);
    }
}

MTL4ShaderReflection :: NSUInteger;
MTL4ShaderReflection_1 :: enum MTL4ShaderReflection {
    None           :: 0;

    BindingInfo    :: 1;

    BufferTypeInfo :: 2;
}

MTL4AlphaToOneState :: enum NSInteger {
    Disabled :: 0;

    Enabled  :: 1;
}

MTL4AlphaToCoverageState :: enum NSInteger {
    Disabled :: 0;

    Enabled  :: 1;
}

MTL4BlendState :: enum NSInteger {
    Disabled      :: 0;

    Enabled       :: 1;

    Unspecialized :: 2;
}

MTL4IndirectCommandBufferSupportState :: enum NSInteger {
    Disabled :: 0;

    Enabled  :: 1;
}

MTL4PipelineOptions :: struct #type_info_none {
    shaderValidation :: inline (self: *MTL4PipelineOptions) -> MTLShaderValidation {
        sel := sel_registerName2("shaderValidation");
        return xx (cast((*MTL4PipelineOptions, Selector) -> MTLShaderValidation #c_call)objc_msgSend)(self, sel);
    }
    setShaderValidation :: inline (self: *MTL4PipelineOptions, shaderValidation: MTLShaderValidation) -> void {
        sel := sel_registerName2("setShaderValidation:");
        return xx (cast((*MTL4PipelineOptions, Selector, MTLShaderValidation) -> void #c_call)objc_msgSend)(self, sel, shaderValidation);
    }

    shaderReflection :: inline (self: *MTL4PipelineOptions) -> MTL4ShaderReflection {
        sel := sel_registerName2("shaderReflection");
        return xx (cast((*MTL4PipelineOptions, Selector) -> MTL4ShaderReflection #c_call)objc_msgSend)(self, sel);
    }
    setShaderReflection :: inline (self: *MTL4PipelineOptions, shaderReflection: MTL4ShaderReflection) -> void {
        sel := sel_registerName2("setShaderReflection:");
        return xx (cast((*MTL4PipelineOptions, Selector, MTL4ShaderReflection) -> void #c_call)objc_msgSend)(self, sel, shaderReflection);
    }
}

MTL4PipelineDescriptor :: struct #type_info_none {
    label :: inline (self: *MTL4PipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4PipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4PipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4PipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    options :: inline (self: *MTL4PipelineDescriptor) -> *MTL4PipelineOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTL4PipelineDescriptor, Selector) -> *MTL4PipelineOptions #c_call)objc_msgSend)(self, sel);
    }
    setOptions :: inline (self: *MTL4PipelineDescriptor, options: *MTL4PipelineOptions) -> void {
        sel := sel_registerName2("setOptions:");
        return xx (cast((*MTL4PipelineDescriptor, Selector, *MTL4PipelineOptions) -> void #c_call)objc_msgSend)(self, sel, options);
    }
}

MTL4ComputePipelineDescriptor :: struct #type_info_none {
    #as using mtl4pipelinedescriptor: MTL4PipelineDescriptor;

    reset :: inline (self: *MTL4ComputePipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    computeFunctionDescriptor :: inline (self: *MTL4ComputePipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("computeFunctionDescriptor");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setComputeFunctionDescriptor :: inline (self: *MTL4ComputePipelineDescriptor, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setComputeFunctionDescriptor:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, computeFunctionDescriptor);
    }

    threadGroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        sel := sel_registerName2("threadGroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setThreadGroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4ComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setThreadGroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTL4ComputePipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerThreadgroup :: inline (self: *MTL4ComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerThreadgroup:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTL4ComputePipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerThreadgroup :: inline (self: *MTL4ComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerThreadgroup:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerThreadgroup);
    }

    supportBinaryLinking :: inline (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportBinaryLinking");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportBinaryLinking :: inline (self: *MTL4ComputePipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportBinaryLinking:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportBinaryLinking);
    }

    staticLinkingDescriptor :: inline (self: *MTL4ComputePipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("staticLinkingDescriptor");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setStaticLinkingDescriptor :: inline (self: *MTL4ComputePipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setStaticLinkingDescriptor:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, staticLinkingDescriptor);
    }

    supportIndirectCommandBuffers :: inline (self: *MTL4ComputePipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector) -> MTL4IndirectCommandBufferSupportState #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTL4ComputePipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTL4ComputePipelineDescriptor, Selector, MTL4IndirectCommandBufferSupportState) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }
}

MTL4LogicalToPhysicalColorAttachmentMappingState :: enum NSInteger {
    Identity  :: 0;

    Inherited :: 1;
}

MTL4RenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    pixelFormat :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    blendingState :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTL4BlendState {
        sel := sel_registerName2("blendingState");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTL4BlendState #c_call)objc_msgSend)(self, sel);
    }
    setBlendingState :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, blendingState: MTL4BlendState) -> void {
        sel := sel_registerName2("setBlendingState:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTL4BlendState) -> void #c_call)objc_msgSend)(self, sel, blendingState);
    }

    sourceRGBBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("sourceRGBBlendFactor");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setSourceRGBBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setSourceRGBBlendFactor:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, sourceRGBBlendFactor);
    }

    destinationRGBBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("destinationRGBBlendFactor");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setDestinationRGBBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setDestinationRGBBlendFactor:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, destinationRGBBlendFactor);
    }

    rgbBlendOperation :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        sel := sel_registerName2("rgbBlendOperation");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendOperation #c_call)objc_msgSend)(self, sel);
    }
    setRgbBlendOperation :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        sel := sel_registerName2("setRgbBlendOperation:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendOperation) -> void #c_call)objc_msgSend)(self, sel, rgbBlendOperation);
    }

    sourceAlphaBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("sourceAlphaBlendFactor");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setSourceAlphaBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setSourceAlphaBlendFactor:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, sourceAlphaBlendFactor);
    }

    destinationAlphaBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        sel := sel_registerName2("destinationAlphaBlendFactor");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendFactor #c_call)objc_msgSend)(self, sel);
    }
    setDestinationAlphaBlendFactor :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        sel := sel_registerName2("setDestinationAlphaBlendFactor:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendFactor) -> void #c_call)objc_msgSend)(self, sel, destinationAlphaBlendFactor);
    }

    alphaBlendOperation :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        sel := sel_registerName2("alphaBlendOperation");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLBlendOperation #c_call)objc_msgSend)(self, sel);
    }
    setAlphaBlendOperation :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        sel := sel_registerName2("setAlphaBlendOperation:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLBlendOperation) -> void #c_call)objc_msgSend)(self, sel, alphaBlendOperation);
    }

    writeMask :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        sel := sel_registerName2("writeMask");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector) -> MTLColorWriteMask #c_call)objc_msgSend)(self, sel);
    }
    setWriteMask :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        sel := sel_registerName2("setWriteMask:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptor, Selector, MTLColorWriteMask) -> void #c_call)objc_msgSend)(self, sel, writeMask);
    }
}

MTL4RenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    objectAtIndexedSubscript :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor {
        sel := sel_registerName2("objectAtIndexedSubscript:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptorArray, Selector, NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor #c_call)objc_msgSend)(self, sel, attachmentIndex);
    }

    setObject :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        sel := sel_registerName2("setObject:atIndexedSubscript:");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptorArray, Selector, *MTL4RenderPipelineColorAttachmentDescriptor, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, attachment, attachmentIndex);
    }

    reset :: inline (self: *MTL4RenderPipelineColorAttachmentDescriptorArray) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4RenderPipelineColorAttachmentDescriptorArray, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }
}

MTL4RenderPipelineBinaryFunctionsDescriptor :: struct #type_info_none {
    reset :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    vertexAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("vertexAdditionalBinaryFunctions");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setVertexAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setVertexAdditionalBinaryFunctions:");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, vertexAdditionalBinaryFunctions);
    }

    fragmentAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("fragmentAdditionalBinaryFunctions");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setFragmentAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setFragmentAdditionalBinaryFunctions:");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, fragmentAdditionalBinaryFunctions);
    }

    tileAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("tileAdditionalBinaryFunctions");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setTileAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setTileAdditionalBinaryFunctions:");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, tileAdditionalBinaryFunctions);
    }

    objectAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("objectAdditionalBinaryFunctions");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setObjectAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, objectAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setObjectAdditionalBinaryFunctions:");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, objectAdditionalBinaryFunctions);
    }

    meshAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("meshAdditionalBinaryFunctions");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setMeshAdditionalBinaryFunctions :: inline (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, meshAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setMeshAdditionalBinaryFunctions:");
        return xx (cast((*MTL4RenderPipelineBinaryFunctionsDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, meshAdditionalBinaryFunctions);
    }
}

MTL4RenderPipelineDescriptor :: struct #type_info_none {
    #as using mtl4pipelinedescriptor: MTL4PipelineDescriptor;

    reset :: inline (self: *MTL4RenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    vertexFunctionDescriptor :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("vertexFunctionDescriptor");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setVertexFunctionDescriptor :: inline (self: *MTL4RenderPipelineDescriptor, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setVertexFunctionDescriptor:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, vertexFunctionDescriptor);
    }

    fragmentFunctionDescriptor :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("fragmentFunctionDescriptor");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFragmentFunctionDescriptor :: inline (self: *MTL4RenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setFragmentFunctionDescriptor:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, fragmentFunctionDescriptor);
    }

    vertexDescriptor :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTLVertexDescriptor {
        sel := sel_registerName2("vertexDescriptor");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTLVertexDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setVertexDescriptor :: inline (self: *MTL4RenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        sel := sel_registerName2("setVertexDescriptor:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, *MTLVertexDescriptor) -> void #c_call)objc_msgSend)(self, sel, vertexDescriptor);
    }

    rasterSampleCount :: inline (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTL4RenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }

    alphaToCoverageState :: inline (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        sel := sel_registerName2("alphaToCoverageState");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> MTL4AlphaToCoverageState #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToCoverageState :: inline (self: *MTL4RenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        sel := sel_registerName2("setAlphaToCoverageState:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, MTL4AlphaToCoverageState) -> void #c_call)objc_msgSend)(self, sel, alphaToCoverageState);
    }

    alphaToOneState :: inline (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToOneState {
        sel := sel_registerName2("alphaToOneState");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> MTL4AlphaToOneState #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToOneState :: inline (self: *MTL4RenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        sel := sel_registerName2("setAlphaToOneState:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, MTL4AlphaToOneState) -> void #c_call)objc_msgSend)(self, sel, alphaToOneState);
    }

    isRasterizationEnabled :: inline (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isRasterizationEnabled");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationEnabled :: inline (self: *MTL4RenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        sel := sel_registerName2("setRasterizationEnabled:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: inline (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexAmplificationCount");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexAmplificationCount :: inline (self: *MTL4RenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexAmplificationCount:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexAmplificationCount);
    }

    colorAttachments :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    inputPrimitiveTopology :: inline (self: *MTL4RenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        sel := sel_registerName2("inputPrimitiveTopology");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> MTLPrimitiveTopologyClass #c_call)objc_msgSend)(self, sel);
    }
    setInputPrimitiveTopology :: inline (self: *MTL4RenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        sel := sel_registerName2("setInputPrimitiveTopology:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, MTLPrimitiveTopologyClass) -> void #c_call)objc_msgSend)(self, sel, inputPrimitiveTopology);
    }

    vertexStaticLinkingDescriptor :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("vertexStaticLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setVertexStaticLinkingDescriptor :: inline (self: *MTL4RenderPipelineDescriptor, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setVertexStaticLinkingDescriptor:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, vertexStaticLinkingDescriptor);
    }

    fragmentStaticLinkingDescriptor :: inline (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("fragmentStaticLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFragmentStaticLinkingDescriptor :: inline (self: *MTL4RenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setFragmentStaticLinkingDescriptor:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, fragmentStaticLinkingDescriptor);
    }

    supportVertexBinaryLinking :: inline (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportVertexBinaryLinking");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportVertexBinaryLinking :: inline (self: *MTL4RenderPipelineDescriptor, supportVertexBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportVertexBinaryLinking:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportVertexBinaryLinking);
    }

    supportFragmentBinaryLinking :: inline (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportFragmentBinaryLinking");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportFragmentBinaryLinking :: inline (self: *MTL4RenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportFragmentBinaryLinking:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportFragmentBinaryLinking);
    }

    colorAttachmentMappingState :: inline (self: *MTL4RenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        sel := sel_registerName2("colorAttachmentMappingState");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call)objc_msgSend)(self, sel);
    }
    setColorAttachmentMappingState :: inline (self: *MTL4RenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        sel := sel_registerName2("setColorAttachmentMappingState:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call)objc_msgSend)(self, sel, colorAttachmentMappingState);
    }

    supportIndirectCommandBuffers :: inline (self: *MTL4RenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector) -> MTL4IndirectCommandBufferSupportState #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTL4RenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTL4RenderPipelineDescriptor, Selector, MTL4IndirectCommandBufferSupportState) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }
}

MTL4MachineLearningPipelineDescriptor :: struct #type_info_none {
    #as using mtl4pipelinedescriptor: MTL4PipelineDescriptor;

    setInputDimensions :: inline (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> void {
        sel := sel_registerName2("setInputDimensions:atBufferIndex:");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector, *MTLTensorExtents, NSInteger) -> void #c_call)objc_msgSend)(self, sel, dimensions, bufferIndex);
    }

    setInputDimensions :: inline (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *NSArray(*MTLTensorExtents), range: NSRange) -> void {
        sel := sel_registerName2("setInputDimensions:withRange:");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector, *NSArray(*MTLTensorExtents), NSRange) -> void #c_call)objc_msgSend)(self, sel, dimensions, range);
    }

    inputDimensionsAtBufferIndex :: inline (self: *MTL4MachineLearningPipelineDescriptor, bufferIndex: NSInteger) -> *MTLTensorExtents {
        sel := sel_registerName2("inputDimensionsAtBufferIndex:");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector, NSInteger) -> *MTLTensorExtents #c_call)objc_msgSend)(self, sel, bufferIndex);
    }

    reset :: inline (self: *MTL4MachineLearningPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    label :: inline (self: *MTL4MachineLearningPipelineDescriptor) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4MachineLearningPipelineDescriptor, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }

    machineLearningFunctionDescriptor :: inline (self: *MTL4MachineLearningPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("machineLearningFunctionDescriptor");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setMachineLearningFunctionDescriptor :: inline (self: *MTL4MachineLearningPipelineDescriptor, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setMachineLearningFunctionDescriptor:");
        return xx (cast((*MTL4MachineLearningPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, machineLearningFunctionDescriptor);
    }
}

MTL4MachineLearningPipelineReflection :: struct #type_info_none {
    bindings :: inline (self: *MTL4MachineLearningPipelineReflection) -> *NSArray(*MTLBinding) {
        sel := sel_registerName2("bindings");
        return xx (cast((*MTL4MachineLearningPipelineReflection, Selector) -> *NSArray(*MTLBinding) #c_call)objc_msgSend)(self, sel);
    }
}

MTL4MachineLearningPipelineState :: struct #type_info_none {
    #as using mtlallocation: MTLAllocation;

    label :: inline (self: *MTL4MachineLearningPipelineState) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4MachineLearningPipelineState, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *MTL4MachineLearningPipelineState) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*MTL4MachineLearningPipelineState, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    reflection :: inline (self: *MTL4MachineLearningPipelineState) -> *MTL4MachineLearningPipelineReflection {
        sel := sel_registerName2("reflection");
        return xx (cast((*MTL4MachineLearningPipelineState, Selector) -> *MTL4MachineLearningPipelineReflection #c_call)objc_msgSend)(self, sel);
    }

    intermediatesHeapSize :: inline (self: *MTL4MachineLearningPipelineState) -> NSUInteger {
        sel := sel_registerName2("intermediatesHeapSize");
        return xx (cast((*MTL4MachineLearningPipelineState, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
}

MTL4TileRenderPipelineDescriptor :: struct #type_info_none {
    #as using mtl4pipelinedescriptor: MTL4PipelineDescriptor;

    reset :: inline (self: *MTL4TileRenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    tileFunctionDescriptor :: inline (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("tileFunctionDescriptor");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setTileFunctionDescriptor :: inline (self: *MTL4TileRenderPipelineDescriptor, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setTileFunctionDescriptor:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, tileFunctionDescriptor);
    }

    rasterSampleCount :: inline (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTL4TileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }

    colorAttachments :: inline (self: *MTL4TileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    threadgroupSizeMatchesTileSize :: inline (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("threadgroupSizeMatchesTileSize");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setThreadgroupSizeMatchesTileSize :: inline (self: *MTL4TileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        sel := sel_registerName2("setThreadgroupSizeMatchesTileSize:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, threadgroupSizeMatchesTileSize);
    }

    maxTotalThreadsPerThreadgroup :: inline (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerThreadgroup");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerThreadgroup :: inline (self: *MTL4TileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerThreadgroup:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: inline (self: *MTL4TileRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerThreadgroup");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerThreadgroup :: inline (self: *MTL4TileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerThreadgroup:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerThreadgroup);
    }

    staticLinkingDescriptor :: inline (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("staticLinkingDescriptor");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setStaticLinkingDescriptor :: inline (self: *MTL4TileRenderPipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setStaticLinkingDescriptor:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, staticLinkingDescriptor);
    }

    supportBinaryLinking :: inline (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportBinaryLinking");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportBinaryLinking :: inline (self: *MTL4TileRenderPipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportBinaryLinking:");
        return xx (cast((*MTL4TileRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportBinaryLinking);
    }
}

MTL4MeshRenderPipelineDescriptor :: struct #type_info_none {
    #as using mtl4pipelinedescriptor: MTL4PipelineDescriptor;

    reset :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> void {
        sel := sel_registerName2("reset");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> void #c_call)objc_msgSend)(self, sel);
    }

    objectFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("objectFunctionDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setObjectFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setObjectFunctionDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, objectFunctionDescriptor);
    }

    meshFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("meshFunctionDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setMeshFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setMeshFunctionDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, meshFunctionDescriptor);
    }

    fragmentFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("fragmentFunctionDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFragmentFunctionDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setFragmentFunctionDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, fragmentFunctionDescriptor);
    }

    maxTotalThreadsPerObjectThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerObjectThreadgroup");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerObjectThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerObjectThreadgroup:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerObjectThreadgroup);
    }

    maxTotalThreadsPerMeshThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadsPerMeshThreadgroup");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadsPerMeshThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadsPerMeshThreadgroup:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadsPerMeshThreadgroup);
    }

    requiredThreadsPerObjectThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerObjectThreadgroup");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerObjectThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerObjectThreadgroup:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerObjectThreadgroup);
    }

    requiredThreadsPerMeshThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        sel := sel_registerName2("requiredThreadsPerMeshThreadgroup");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTLSize #c_call)objc_msgSend)(self, sel);
    }
    setRequiredThreadsPerMeshThreadgroup :: inline (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        sel := sel_registerName2("setRequiredThreadsPerMeshThreadgroup:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTLSize) -> void #c_call)objc_msgSend)(self, sel, requiredThreadsPerMeshThreadgroup);
    }

    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("objectThreadgroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4MeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("meshThreadgroupSizeIsMultipleOfThreadExecutionWidth");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: inline (self: *MTL4MeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        sel := sel_registerName2("setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    payloadMemoryLength :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("payloadMemoryLength");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setPayloadMemoryLength :: inline (self: *MTL4MeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        sel := sel_registerName2("setPayloadMemoryLength:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, payloadMemoryLength);
    }

    maxTotalThreadgroupsPerMeshGrid :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxTotalThreadgroupsPerMeshGrid");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxTotalThreadgroupsPerMeshGrid :: inline (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        sel := sel_registerName2("setMaxTotalThreadgroupsPerMeshGrid:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxTotalThreadgroupsPerMeshGrid);
    }

    rasterSampleCount :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("rasterSampleCount");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setRasterSampleCount :: inline (self: *MTL4MeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        sel := sel_registerName2("setRasterSampleCount:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, rasterSampleCount);
    }

    alphaToCoverageState :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        sel := sel_registerName2("alphaToCoverageState");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTL4AlphaToCoverageState #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToCoverageState :: inline (self: *MTL4MeshRenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        sel := sel_registerName2("setAlphaToCoverageState:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTL4AlphaToCoverageState) -> void #c_call)objc_msgSend)(self, sel, alphaToCoverageState);
    }

    alphaToOneState :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToOneState {
        sel := sel_registerName2("alphaToOneState");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTL4AlphaToOneState #c_call)objc_msgSend)(self, sel);
    }
    setAlphaToOneState :: inline (self: *MTL4MeshRenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        sel := sel_registerName2("setAlphaToOneState:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTL4AlphaToOneState) -> void #c_call)objc_msgSend)(self, sel, alphaToOneState);
    }

    isRasterizationEnabled :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("isRasterizationEnabled");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setRasterizationEnabled :: inline (self: *MTL4MeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        sel := sel_registerName2("setRasterizationEnabled:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxVertexAmplificationCount");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxVertexAmplificationCount :: inline (self: *MTL4MeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaxVertexAmplificationCount:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxVertexAmplificationCount);
    }

    colorAttachments :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        sel := sel_registerName2("colorAttachments");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call)objc_msgSend)(self, sel);
    }

    objectStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("objectStaticLinkingDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setObjectStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setObjectStaticLinkingDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, objectStaticLinkingDescriptor);
    }

    meshStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("meshStaticLinkingDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setMeshStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setMeshStaticLinkingDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, meshStaticLinkingDescriptor);
    }

    fragmentStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        sel := sel_registerName2("fragmentStaticLinkingDescriptor");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> *MTL4StaticLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFragmentStaticLinkingDescriptor :: inline (self: *MTL4MeshRenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        sel := sel_registerName2("setFragmentStaticLinkingDescriptor:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, *MTL4StaticLinkingDescriptor) -> void #c_call)objc_msgSend)(self, sel, fragmentStaticLinkingDescriptor);
    }

    supportObjectBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportObjectBinaryLinking");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportObjectBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor, supportObjectBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportObjectBinaryLinking:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportObjectBinaryLinking);
    }

    supportMeshBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportMeshBinaryLinking");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportMeshBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor, supportMeshBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportMeshBinaryLinking:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportMeshBinaryLinking);
    }

    supportFragmentBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        sel := sel_registerName2("supportFragmentBinaryLinking");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setSupportFragmentBinaryLinking :: inline (self: *MTL4MeshRenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        sel := sel_registerName2("setSupportFragmentBinaryLinking:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, supportFragmentBinaryLinking);
    }

    colorAttachmentMappingState :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        sel := sel_registerName2("colorAttachmentMappingState");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call)objc_msgSend)(self, sel);
    }
    setColorAttachmentMappingState :: inline (self: *MTL4MeshRenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        sel := sel_registerName2("setColorAttachmentMappingState:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call)objc_msgSend)(self, sel, colorAttachmentMappingState);
    }

    supportIndirectCommandBuffers :: inline (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        sel := sel_registerName2("supportIndirectCommandBuffers");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector) -> MTL4IndirectCommandBufferSupportState #c_call)objc_msgSend)(self, sel);
    }
    setSupportIndirectCommandBuffers :: inline (self: *MTL4MeshRenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        sel := sel_registerName2("setSupportIndirectCommandBuffers:");
        return xx (cast((*MTL4MeshRenderPipelineDescriptor, Selector, MTL4IndirectCommandBufferSupportState) -> void #c_call)objc_msgSend)(self, sel, supportIndirectCommandBuffers);
    }
}

MTL4PipelineDataSetSerializerConfiguration :: NSUInteger;
MTL4PipelineDataSetSerializerConfigurationCapture :: enum MTL4PipelineDataSetSerializerConfiguration {
    Descriptors :: 1;

    Binaries    :: 2;
}

MTL4PipelineDataSetSerializerDescriptor :: struct #type_info_none {
    configuration :: inline (self: *MTL4PipelineDataSetSerializerDescriptor) -> MTL4PipelineDataSetSerializerConfiguration {
        sel := sel_registerName2("configuration");
        return xx (cast((*MTL4PipelineDataSetSerializerDescriptor, Selector) -> MTL4PipelineDataSetSerializerConfiguration #c_call)objc_msgSend)(self, sel);
    }
    setConfiguration :: inline (self: *MTL4PipelineDataSetSerializerDescriptor, configuration: MTL4PipelineDataSetSerializerConfiguration) -> void {
        sel := sel_registerName2("setConfiguration:");
        return xx (cast((*MTL4PipelineDataSetSerializerDescriptor, Selector, MTL4PipelineDataSetSerializerConfiguration) -> void #c_call)objc_msgSend)(self, sel, configuration);
    }
}

MTL4PipelineDataSetSerializer :: struct #type_info_none {
    serializeAsArchiveAndFlushToURL :: inline (self: *MTL4PipelineDataSetSerializer, url: *NSURL, error: **NSError) -> BOOL {
        sel := sel_registerName2("serializeAsArchiveAndFlushToURL:error:");
        return xx (cast((*MTL4PipelineDataSetSerializer, Selector, *NSURL, **NSError) -> BOOL #c_call)objc_msgSend)(self, sel, url, error);
    }

    serializeAsPipelinesScriptWithError :: inline (self: *MTL4PipelineDataSetSerializer, error: **NSError) -> *NSData {
        sel := sel_registerName2("serializeAsPipelinesScriptWithError:");
        return xx (cast((*MTL4PipelineDataSetSerializer, Selector, **NSError) -> *NSData #c_call)objc_msgSend)(self, sel, error);
    }
}

MTL4Archive :: struct #type_info_none {
    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:error:");
        return xx (cast((*MTL4Archive, Selector, *MTL4ComputePipelineDescriptor, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newComputePipelineStateWithDescriptor :: inline (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState {
        sel := sel_registerName2("newComputePipelineStateWithDescriptor:dynamicLinkingDescriptor:error:");
        return xx (cast((*MTL4Archive, Selector, *MTL4ComputePipelineDescriptor, *MTL4PipelineStageDynamicLinkingDescriptor, **NSError) -> *MTLComputePipelineState #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:error:");
        return xx (cast((*MTL4Archive, Selector, *MTL4PipelineDescriptor, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    newRenderPipelineStateWithDescriptor :: inline (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        sel := sel_registerName2("newRenderPipelineStateWithDescriptor:dynamicLinkingDescriptor:error:");
        return xx (cast((*MTL4Archive, Selector, *MTL4PipelineDescriptor, *MTL4RenderPipelineDynamicLinkingDescriptor, **NSError) -> *MTLRenderPipelineState #c_call)objc_msgSend)(self, sel, descriptor, dynamicLinkingDescriptor, error);
    }

    newBinaryFunctionWithDescriptor :: inline (self: *MTL4Archive, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction {
        sel := sel_registerName2("newBinaryFunctionWithDescriptor:error:");
        return xx (cast((*MTL4Archive, Selector, *MTL4BinaryFunctionDescriptor, **NSError) -> *MTL4BinaryFunction #c_call)objc_msgSend)(self, sel, descriptor, error);
    }

    label :: inline (self: *MTL4Archive) -> *NSString {
        sel := sel_registerName2("label");
        return xx (cast((*MTL4Archive, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setLabel :: inline (self: *MTL4Archive, label: *NSString) -> void {
        sel := sel_registerName2("setLabel:");
        return xx (cast((*MTL4Archive, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, label);
    }
}

MTL4BinaryFunctionOptions :: NSUInteger;
MTL4BinaryFunctionOption :: enum MTL4BinaryFunctionOptions {
    None                :: 0;

    PipelineIndependent :: 2;
}

MTL4BinaryFunctionDescriptor :: struct #type_info_none {
    name :: inline (self: *MTL4BinaryFunctionDescriptor) -> *NSString {
        sel := sel_registerName2("name");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector) -> *NSString #c_call)objc_msgSend)(self, sel);
    }
    setName :: inline (self: *MTL4BinaryFunctionDescriptor, name: *NSString) -> void {
        sel := sel_registerName2("setName:");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector, *NSString) -> void #c_call)objc_msgSend)(self, sel, name);
    }

    functionDescriptor :: inline (self: *MTL4BinaryFunctionDescriptor) -> *MTL4FunctionDescriptor {
        sel := sel_registerName2("functionDescriptor");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector) -> *MTL4FunctionDescriptor #c_call)objc_msgSend)(self, sel);
    }
    setFunctionDescriptor :: inline (self: *MTL4BinaryFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        sel := sel_registerName2("setFunctionDescriptor:");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector, *MTL4FunctionDescriptor) -> void #c_call)objc_msgSend)(self, sel, functionDescriptor);
    }

    options :: inline (self: *MTL4BinaryFunctionDescriptor) -> MTL4BinaryFunctionOptions {
        sel := sel_registerName2("options");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector) -> MTL4BinaryFunctionOptions #c_call)objc_msgSend)(self, sel);
    }
    setOptions :: inline (self: *MTL4BinaryFunctionDescriptor, options: MTL4BinaryFunctionOptions) -> void {
        sel := sel_registerName2("setOptions:");
        return xx (cast((*MTL4BinaryFunctionDescriptor, Selector, MTL4BinaryFunctionOptions) -> void #c_call)objc_msgSend)(self, sel, options);
    }
}

MTL4StaticLinkingDescriptor :: struct #type_info_none {
    functionDescriptors :: inline (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        sel := sel_registerName2("functionDescriptors");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector) -> *NSArray(*MTL4FunctionDescriptor) #c_call)objc_msgSend)(self, sel);
    }
    setFunctionDescriptors :: inline (self: *MTL4StaticLinkingDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        sel := sel_registerName2("setFunctionDescriptors:");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector, *NSArray(*MTL4FunctionDescriptor)) -> void #c_call)objc_msgSend)(self, sel, functionDescriptors);
    }

    privateFunctionDescriptors :: inline (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        sel := sel_registerName2("privateFunctionDescriptors");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector) -> *NSArray(*MTL4FunctionDescriptor) #c_call)objc_msgSend)(self, sel);
    }
    setPrivateFunctionDescriptors :: inline (self: *MTL4StaticLinkingDescriptor, privateFunctionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        sel := sel_registerName2("setPrivateFunctionDescriptors:");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector, *NSArray(*MTL4FunctionDescriptor)) -> void #c_call)objc_msgSend)(self, sel, privateFunctionDescriptors);
    }

    groups :: inline (self: *MTL4StaticLinkingDescriptor) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) {
        sel := sel_registerName2("groups");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) #c_call)objc_msgSend)(self, sel);
    }
    setGroups :: inline (self: *MTL4StaticLinkingDescriptor, groups: *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void {
        sel := sel_registerName2("setGroups:");
        return xx (cast((*MTL4StaticLinkingDescriptor, Selector, *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void #c_call)objc_msgSend)(self, sel, groups);
    }
}

MTL4PipelineStageDynamicLinkingDescriptor :: struct #type_info_none {
    maxCallStackDepth :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> NSUInteger {
        sel := sel_registerName2("maxCallStackDepth");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaxCallStackDepth :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor, maxCallStackDepth: NSUInteger) -> void {
        sel := sel_registerName2("setMaxCallStackDepth:");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maxCallStackDepth);
    }

    binaryLinkedFunctions :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        sel := sel_registerName2("binaryLinkedFunctions");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector) -> *NSArray(*MTL4BinaryFunction) #c_call)objc_msgSend)(self, sel);
    }
    setBinaryLinkedFunctions :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor, binaryLinkedFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        sel := sel_registerName2("setBinaryLinkedFunctions:");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector, *NSArray(*MTL4BinaryFunction)) -> void #c_call)objc_msgSend)(self, sel, binaryLinkedFunctions);
    }

    preloadedLibraries :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        sel := sel_registerName2("preloadedLibraries");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector) -> *NSArray(*MTLDynamicLibrary) #c_call)objc_msgSend)(self, sel);
    }
    setPreloadedLibraries :: inline (self: *MTL4PipelineStageDynamicLinkingDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        sel := sel_registerName2("setPreloadedLibraries:");
        return xx (cast((*MTL4PipelineStageDynamicLinkingDescriptor, Selector, *NSArray(*MTLDynamicLibrary)) -> void #c_call)objc_msgSend)(self, sel, preloadedLibraries);
    }
}

MTL4RenderPipelineDynamicLinkingDescriptor :: struct #type_info_none {
    vertexLinkingDescriptor :: inline (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        sel := sel_registerName2("vertexLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDynamicLinkingDescriptor, Selector) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }

    fragmentLinkingDescriptor :: inline (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        sel := sel_registerName2("fragmentLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDynamicLinkingDescriptor, Selector) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }

    tileLinkingDescriptor :: inline (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        sel := sel_registerName2("tileLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDynamicLinkingDescriptor, Selector) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }

    objectLinkingDescriptor :: inline (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        sel := sel_registerName2("objectLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDynamicLinkingDescriptor, Selector) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }

    meshLinkingDescriptor :: inline (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        sel := sel_registerName2("meshLinkingDescriptor");
        return xx (cast((*MTL4RenderPipelineDynamicLinkingDescriptor, Selector) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call)objc_msgSend)(self, sel);
    }
}

/* CAMetalDrawable represents a displayable buffer that vends an object
* that conforms to the MTLTexture protocol that may be used to create
* a render target for Metal.
*
* Note: CAMetalLayer maintains an internal pool of textures used for
* display. In order for a texture to be re-used for a new CAMetalDrawable,
* any prior CAMetalDrawable must have been deallocated and another
* CAMetalDrawable presented. */
CAMetalDrawable :: struct #type_info_none {
    #as using mtldrawable: MTLDrawable;

    texture :: inline (self: *CAMetalDrawable) -> *MTLTexture {
        sel := sel_registerName2("texture");
        return xx (cast((*CAMetalDrawable, Selector) -> *MTLTexture #c_call)objc_msgSend)(self, sel);
    }

    layer :: inline (self: *CAMetalDrawable) -> *CAMetalLayer {
        sel := sel_registerName2("layer");
        return xx (cast((*CAMetalDrawable, Selector) -> *CAMetalLayer #c_call)objc_msgSend)(self, sel);
    }
}

CAMetalLayer :: struct #type_info_none {
    #as using calayer: CALayer;

    /* Get the swap queue's next available drawable. Always blocks until a drawable
    * is available. Can return nil under the following conditions:
    *     1) The layer has an invalid combination of drawable properties.
    *     2) All drawables in the swap queue are in-use and the 1 second timeout
    *        has elapsed. (except when `allowsNextDrawableTimeout' is set to NO)
    *     3) Process is out of memory. */
    nextDrawable :: inline (/* Get the swap queue's next available drawable. Always blocks until a drawable
* is available. Can return nil under the following conditions:
*     1) The layer has an invalid combination of drawable properties.
*     2) All drawables in the swap queue are in-use and the 1 second timeout
*        has elapsed. (except when `allowsNextDrawableTimeout' is set to NO)
*     3) Process is out of memory. */
self: *CAMetalLayer) -> *CAMetalDrawable {
        sel := sel_registerName2("nextDrawable");
        return xx (cast((*CAMetalLayer, Selector) -> *CAMetalDrawable #c_call)objc_msgSend)(self, sel);
    }

    device :: inline (self: *CAMetalLayer) -> *MTLDevice {
        sel := sel_registerName2("device");
        return xx (cast((*CAMetalLayer, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }
    setDevice :: inline (self: *CAMetalLayer, device: *MTLDevice) -> void {
        sel := sel_registerName2("setDevice:");
        return xx (cast((*CAMetalLayer, Selector, *MTLDevice) -> void #c_call)objc_msgSend)(self, sel, device);
    }

    preferredDevice :: inline (self: *CAMetalLayer) -> *MTLDevice {
        sel := sel_registerName2("preferredDevice");
        return xx (cast((*CAMetalLayer, Selector) -> *MTLDevice #c_call)objc_msgSend)(self, sel);
    }

    pixelFormat :: inline (self: *CAMetalLayer) -> MTLPixelFormat {
        sel := sel_registerName2("pixelFormat");
        return xx (cast((*CAMetalLayer, Selector) -> MTLPixelFormat #c_call)objc_msgSend)(self, sel);
    }
    setPixelFormat :: inline (self: *CAMetalLayer, pixelFormat: MTLPixelFormat) -> void {
        sel := sel_registerName2("setPixelFormat:");
        return xx (cast((*CAMetalLayer, Selector, MTLPixelFormat) -> void #c_call)objc_msgSend)(self, sel, pixelFormat);
    }

    framebufferOnly :: inline (self: *CAMetalLayer) -> BOOL {
        sel := sel_registerName2("framebufferOnly");
        return xx (cast((*CAMetalLayer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setFramebufferOnly :: inline (self: *CAMetalLayer, framebufferOnly: BOOL) -> void {
        sel := sel_registerName2("setFramebufferOnly:");
        return xx (cast((*CAMetalLayer, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, framebufferOnly);
    }

    drawableSize :: inline (self: *CAMetalLayer) -> CGSize {
        sel := sel_registerName2("drawableSize");
        return xx (cast((*CAMetalLayer, Selector) -> CGSize #c_call)objc_msgSend)(self, sel);
    }
    setDrawableSize :: inline (self: *CAMetalLayer, drawableSize: CGSize) -> void {
        sel := sel_registerName2("setDrawableSize:");
        return xx (cast((*CAMetalLayer, Selector, CGSize) -> void #c_call)objc_msgSend)(self, sel, drawableSize);
    }

    maximumDrawableCount :: inline (self: *CAMetalLayer) -> NSUInteger {
        sel := sel_registerName2("maximumDrawableCount");
        return xx (cast((*CAMetalLayer, Selector) -> NSUInteger #c_call)objc_msgSend)(self, sel);
    }
    setMaximumDrawableCount :: inline (self: *CAMetalLayer, maximumDrawableCount: NSUInteger) -> void {
        sel := sel_registerName2("setMaximumDrawableCount:");
        return xx (cast((*CAMetalLayer, Selector, NSUInteger) -> void #c_call)objc_msgSend)(self, sel, maximumDrawableCount);
    }

    presentsWithTransaction :: inline (self: *CAMetalLayer) -> BOOL {
        sel := sel_registerName2("presentsWithTransaction");
        return xx (cast((*CAMetalLayer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setPresentsWithTransaction :: inline (self: *CAMetalLayer, presentsWithTransaction: BOOL) -> void {
        sel := sel_registerName2("setPresentsWithTransaction:");
        return xx (cast((*CAMetalLayer, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, presentsWithTransaction);
    }

    colorspace :: inline (self: *CAMetalLayer) -> CGColorSpaceRef {
        sel := sel_registerName2("colorspace");
        return xx (cast((*CAMetalLayer, Selector) -> CGColorSpaceRef #c_call)objc_msgSend)(self, sel);
    }
    setColorspace :: inline (self: *CAMetalLayer, colorspace: CGColorSpaceRef) -> void {
        sel := sel_registerName2("setColorspace:");
        return xx (cast((*CAMetalLayer, Selector, CGColorSpaceRef) -> void #c_call)objc_msgSend)(self, sel, colorspace);
    }

    wantsExtendedDynamicRangeContent :: inline (self: *CAMetalLayer) -> BOOL {
        sel := sel_registerName2("wantsExtendedDynamicRangeContent");
        return xx (cast((*CAMetalLayer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setWantsExtendedDynamicRangeContent :: inline (self: *CAMetalLayer, wantsExtendedDynamicRangeContent: BOOL) -> void {
        sel := sel_registerName2("setWantsExtendedDynamicRangeContent:");
        return xx (cast((*CAMetalLayer, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, wantsExtendedDynamicRangeContent);
    }

    EDRMetadata :: inline (self: *CAMetalLayer) -> *CAEDRMetadata {
        sel := sel_registerName2("EDRMetadata");
        return xx (cast((*CAMetalLayer, Selector) -> *CAEDRMetadata #c_call)objc_msgSend)(self, sel);
    }
    setEDRMetadata :: inline (self: *CAMetalLayer, EDRMetadata: *CAEDRMetadata) -> void {
        sel := sel_registerName2("setEDRMetadata:");
        return xx (cast((*CAMetalLayer, Selector, *CAEDRMetadata) -> void #c_call)objc_msgSend)(self, sel, EDRMetadata);
    }

    displaySyncEnabled :: inline (self: *CAMetalLayer) -> BOOL {
        sel := sel_registerName2("displaySyncEnabled");
        return xx (cast((*CAMetalLayer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setDisplaySyncEnabled :: inline (self: *CAMetalLayer, displaySyncEnabled: BOOL) -> void {
        sel := sel_registerName2("setDisplaySyncEnabled:");
        return xx (cast((*CAMetalLayer, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, displaySyncEnabled);
    }

    allowsNextDrawableTimeout :: inline (self: *CAMetalLayer) -> BOOL {
        sel := sel_registerName2("allowsNextDrawableTimeout");
        return xx (cast((*CAMetalLayer, Selector) -> BOOL #c_call)objc_msgSend)(self, sel);
    }
    setAllowsNextDrawableTimeout :: inline (self: *CAMetalLayer, allowsNextDrawableTimeout: BOOL) -> void {
        sel := sel_registerName2("setAllowsNextDrawableTimeout:");
        return xx (cast((*CAMetalLayer, Selector, BOOL) -> void #c_call)objc_msgSend)(self, sel, allowsNextDrawableTimeout);
    }

    developerHUDProperties :: inline (self: *CAMetalLayer) -> *NSDictionary(id, id) {
        sel := sel_registerName2("developerHUDProperties");
        return xx (cast((*CAMetalLayer, Selector) -> *NSDictionary(id, id) #c_call)objc_msgSend)(self, sel);
    }
    setDeveloperHUDProperties :: inline (self: *CAMetalLayer, developerHUDProperties: *NSDictionary(id, id)) -> void {
        sel := sel_registerName2("setDeveloperHUDProperties:");
        return xx (cast((*CAMetalLayer, Selector, *NSDictionary(id, id)) -> void #c_call)objc_msgSend)(self, sel, developerHUDProperties);
    }

    residencySet :: inline (self: *CAMetalLayer) -> *MTLResidencySet {
        sel := sel_registerName2("residencySet");
        return xx (cast((*CAMetalLayer, Selector) -> *MTLResidencySet #c_call)objc_msgSend)(self, sel);
    }
}

#scope_file

libobjc :: #library,system "libobjc";
