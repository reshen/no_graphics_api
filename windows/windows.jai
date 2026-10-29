//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



maximum_alignment: u64 : 8;

detail :: struct {
    RemoveConst :: struct(T: Type) {
        using,except(T) removeconst__raw:       RemoveConst__RAW(T);
        #if size_of(RemoveConst__RAW(T)) == 0 {
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }
    }
        // RemoveConst without padding. Needed to generate a C++-equivalent struct layout when "inheriting" from RemoveConst
    RemoveConst__RAW :: struct(T: Type) {
        type :: T;
    }

    RemoveVolatile :: struct(T: Type) {
        using,except(T) removevolatile__raw:    RemoveVolatile__RAW(T);
        #if size_of(RemoveVolatile__RAW(T)) == 0 {
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }
    }
        // RemoveVolatile without padding. Needed to generate a C++-equivalent struct layout when "inheriting" from RemoveVolatile
    RemoveVolatile__RAW :: struct(T: Type) {
        type :: T;
    }

    RemovePointer :: struct(T: Type) {
        using,except(T) removepointer__raw:     RemovePointer__RAW(T);
        #if size_of(RemovePointer__RAW(T)) == 0 {
            __empty_struct_padding: u8; // C++ makes empty structs have length 1
        }
    }
        // RemovePointer without padding. Needed to generate a C++-equivalent struct layout when "inheriting" from RemovePointer
    RemovePointer__RAW :: struct(T: Type) {
        type :: T;
    }

    CallbackPlacement :: enum s32 {
    }
}

Span :: struct(T: Type) {
    data: *T = null;
    size: u64 = 0;
}

ByteSpan :: struct {
    data: *u8 = null;
    size: u64 = 0;

    Constructor :: (this: *ByteSpan) -> void #cpp_method #foreign nographicsapi "??0ByteSpan@gpu@@QEAA@XZ";
}

u32x2 :: struct {
    x: u32 = 0;
    y: u32 = 0;
}

u32x3 :: struct {
    x: u32 = 0;
    y: u32 = 0;
    z: u32 = 0;
}

Device :: struct {}
CommandPool :: struct {}
Texture :: struct {}
RenderView :: struct {}
PSO :: struct {}
CommandBuffer :: struct {}
TimelineSemaphore :: struct {}
GpuHeapOwner :: struct {}
TextureHeapOwner :: struct {}
TextureDescriptorHeap :: struct {}
SamplerDescriptorHeap :: struct {}

Error :: enum u8 {
    NONE          :: 0;
    UNSUPPORTED   :: 1;
    DEVICE_LOST   :: 2;
    DRIVER_ERROR  :: 3;
    OUT_OF_MEMORY :: 4;

    none          :: NONE;
    unsupported   :: UNSUPPORTED;
    device_lost   :: DEVICE_LOST;
    driver_error  :: DRIVER_ERROR;
    out_of_memory :: OUT_OF_MEMORY;
}

ErrorCallback :: #type (message: *u8, fatal: bool) -> void #c_call;

// Synchronous diagnostics on the calling thread; message is valid only during the callback. Do not call graphics APIs recursively.
// The thread-local callback defaults to nullptr. Fatal execution errors still abort after the callback returns.
set_error_callback :: (callback: ErrorCallback) -> void #foreign nographicsapi "?set_error_callback@gpu@@YAXP6AXPEBD_N@_E@Z";

MemoryType :: enum u8 {
    CPU_VISIBLE :: 0;
    GPU_ONLY    :: 1;
    READBACK    :: 2;

    cpu_visible :: CPU_VISIBLE;
    gpu_only    :: GPU_ONLY;
    readback    :: READBACK;
}

SizeAlign :: struct {
    size:  u64 = 0;
    align: u64 = 0;
}

GpuRange :: struct {
    gpu:  *void = null;
    size: u64 = 0;
}

GpuCpuRange :: struct(T: Type) {
    cpu:  *T = null;
    gpu:  *T = null;
    size: u64 = 0; // Bytes, independent of T.
}

GpuHeap :: struct {
    // Copies alias the same allocation. Pass one unchanged copy to destroy_gpu_heap exactly once.
    range: GpuCpuRange(u8);
    owner: *GpuHeapOwner = null;
}

TextureHeap :: struct {
    // Copies alias the same allocation. Pass one unchanged copy to destroy_texture_heap exactly once.
    size:  u64 = 0;
    owner: *TextureHeapOwner = null;
}

TimelinePoint :: struct {
    semaphore: *TimelineSemaphore = null;
    value:     u64 = 0;
}

SubmitDesc :: struct {
    commands:   Span(*CommandBuffer);
    waits:      Span(TimelinePoint); // GPU waits cover all command stages.
    completion: TimelinePoint; // Required for every submission.
}

Format :: enum u8 {
    R8_SRGB           :: 0;
    RG8_SRGB          :: 1;
    RGBA8_SRGB        :: 2;
    BGRA8_SRGB        :: 3;

    RGBA4_UNORM       :: 4;
    R5G5B5A1_UNORM    :: 5;
    R5G6B5_UNORM      :: 6;

    R8_UNORM          :: 7;
    RG8_UNORM         :: 8;
    RGBA8_UNORM       :: 9;
    BGRA8_UNORM       :: 10;
    R16_UNORM         :: 11;
    RG16_UNORM        :: 12;
    RGBA16_UNORM      :: 13;

    R8_UINT           :: 14;
    RG8_UINT          :: 15;
    RGBA8_UINT        :: 16;
    BGRA8_UINT        :: 17;
    R16_UINT          :: 18;
    RG16_UINT         :: 19;
    RGBA16_UINT       :: 20;
    R32_UINT          :: 21;
    RG32_UINT         :: 22;
    RGBA32_UINT       :: 23;

    R16_FLOAT         :: 24;
    RG16_FLOAT        :: 25;
    RGBA16_FLOAT      :: 26;
    R32_FLOAT         :: 27;
    RG32_FLOAT        :: 28;
    RGBA32_FLOAT      :: 29;

    RGB10A2_UNORM     :: 30;
    RG11B10_FLOAT     :: 31;

    D16_UNORM         :: 32;
    D24_UNORM_S8_UINT :: 33;
    D32_FLOAT         :: 34;
    S8_UINT           :: 35;
    D32_FLOAT_S8_UINT :: 36;

    EAC_RG            :: 37;
    ASTC_4X4_SRGB     :: 38;
    ASTC_4X4_UNORM    :: 39;
    BC3_SRGB          :: 40;
    BC3_UNORM         :: 41;
    BC5_RG            :: 42;
    BC6H_UFLOAT       :: 43;
    BC6H_SFLOAT       :: 44;
    BC7_SRGB          :: 45;
    BC7_UNORM         :: 46;

    UNDEFINED         :: 47;

    r8_srgb           :: R8_SRGB;
    rg8_srgb          :: RG8_SRGB;
    rgba8_srgb        :: RGBA8_SRGB;
    bgra8_srgb        :: BGRA8_SRGB;

    rgba4_unorm       :: RGBA4_UNORM;
    r5g5b5a1_unorm    :: R5G5B5A1_UNORM;
    r5g6b5_unorm      :: R5G6B5_UNORM;

    r8_unorm          :: R8_UNORM;
    rg8_unorm         :: RG8_UNORM;
    rgba8_unorm       :: RGBA8_UNORM;
    bgra8_unorm       :: BGRA8_UNORM;
    r16_unorm         :: R16_UNORM;
    rg16_unorm        :: RG16_UNORM;
    rgba16_unorm      :: RGBA16_UNORM;

    r8_uint           :: R8_UINT;
    rg8_uint          :: RG8_UINT;
    rgba8_uint        :: RGBA8_UINT;
    bgra8_uint        :: BGRA8_UINT;
    r16_uint          :: R16_UINT;
    rg16_uint         :: RG16_UINT;
    rgba16_uint       :: RGBA16_UINT;
    r32_uint          :: R32_UINT;
    rg32_uint         :: RG32_UINT;
    rgba32_uint       :: RGBA32_UINT;

    r16_float         :: R16_FLOAT;
    rg16_float        :: RG16_FLOAT;
    rgba16_float      :: RGBA16_FLOAT;
    r32_float         :: R32_FLOAT;
    rg32_float        :: RG32_FLOAT;
    rgba32_float      :: RGBA32_FLOAT;

    rgb10a2_unorm     :: RGB10A2_UNORM;
    rg11b10_float     :: RG11B10_FLOAT;

    d16_unorm         :: D16_UNORM;
    d24_unorm_s8_uint :: D24_UNORM_S8_UINT;
    d32_float         :: D32_FLOAT;
    s8_uint           :: S8_UINT;
    d32_float_s8_uint :: D32_FLOAT_S8_UINT;

    eac_rg            :: EAC_RG;
    astc_4x4_srgb     :: ASTC_4X4_SRGB;
    astc_4x4_unorm    :: ASTC_4X4_UNORM;
    bc3_srgb          :: BC3_SRGB;
    bc3_unorm         :: BC3_UNORM;
    bc5_rg            :: BC5_RG;
    bc6h_ufloat       :: BC6H_UFLOAT;
    bc6h_sfloat       :: BC6H_SFLOAT;
    bc7_srgb          :: BC7_SRGB;
    bc7_unorm         :: BC7_UNORM;

    undefined         :: UNDEFINED;
}

TextureFormatInfo :: struct {
    block_extent:    u32x2;
    bytes_per_block: u32 = 0;
    depth            := false;
    stencil          := false;
}

// NOTE: removed constexpr (to prevent inlining) and moved implementation to NoGraphicsAPI.cpp/mm to ensure the built library exports the symbol
// for c-binding
get_texture_format_info :: (format: Format) -> TextureFormatInfo #foreign nographicsapi "?get_texture_format_info@gpu@@YA?AUTextureFormatInfo@1@W4Format@1@@Z";

TextureType :: enum u8 {
    ONE_D       :: 0;
    TWO_D       :: 1;
    THREE_D     :: 2;
    CUBE        :: 3;
    TWO_D_ARRAY :: 4;
    CUBE_ARRAY  :: 5;

    one_d       :: ONE_D;
    two_d       :: TWO_D;
    three_d     :: THREE_D;
    cube        :: CUBE;
    two_d_array :: TWO_D_ARRAY;
    cube_array  :: CUBE_ARRAY;
}

TextureUsage :: enum u32 {
    NONE                     :: 0;
    SAMPLED                  :: 1;
    STORAGE                  :: 2;
    COLOR_ATTACHMENT         :: 4;
    DEPTH_STENCIL_ATTACHMENT :: 8;
    TRANSFER_SOURCE          :: 16;
    TRANSFER_DESTINATION     :: 32;

    none                     :: NONE;
    sampled                  :: SAMPLED;
    storage                  :: STORAGE;
    color_attachment         :: COLOR_ATTACHMENT;
    depth_stencil_attachment :: DEPTH_STENCIL_ATTACHMENT;
    transfer_source          :: TRANSFER_SOURCE;
    transfer_destination     :: TRANSFER_DESTINATION;
}

TextureDescriptorType :: enum u8 {
    AMPLED :: 0;
    TORAGE :: 1;

    sampled :: AMPLED;
    storage :: TORAGE;
}

TextureAspect :: enum u8 {
    AUTOMATIC :: 0;
    COLOR     :: 1;
    DEPTH     :: 2;
    STENCIL   :: 3;

    automatic :: AUTOMATIC;
    color     :: COLOR;
    depth     :: DEPTH;
    stencil   :: STENCIL;
}

Filter :: enum u8 {
    NEAREST :: 0;
    LINEAR  :: 1;

    nearest :: NEAREST;
    linear  :: LINEAR;
}

AddressMode :: enum u8 {
    REPEAT          :: 0;
    MIRRORED_REPEAT :: 1;
    CLAMP_TO_EDGE   :: 2;

    repeat          :: REPEAT;
    mirrored_repeat :: MIRRORED_REPEAT;
    clamp_to_edge   :: CLAMP_TO_EDGE;
}

CompareOp :: enum u8 {
    NEVER         :: 0;
    LESS          :: 1;
    EQUAL         :: 2;
    LESS_EQUAL    :: 3;
    GREATER       :: 4;
    NOT_EQUAL     :: 5;
    GREATER_EQUAL :: 6;
    ALWAYS        :: 7;

    never         :: NEVER;
    less          :: LESS;
    equal         :: EQUAL;
    less_equal    :: LESS_EQUAL;
    greater       :: GREATER;
    not_equal     :: NOT_EQUAL;
    greater_equal :: GREATER_EQUAL;
    always        :: ALWAYS;
}

CullMode :: enum u8 {
    NONE              :: 0;
    CLOCKWISE         :: 1;
    COUNTER_CLOCKWISE :: 2;

    none              :: NONE;
    clockwise         :: CLOCKWISE;
    counter_clockwise :: COUNTER_CLOCKWISE;
}

BlendFactor :: enum u8 {
    ZERO                        :: 0;
    ONE                         :: 1;
    SOURCE_COLOR                :: 2;
    ONE_MINUS_SOURCE_COLOR      :: 3;
    DESTINATION_COLOR           :: 4;
    ONE_MINUS_DESTINATION_COLOR :: 5;
    SOURCE_ALPHA                :: 6;
    ONE_MINUS_SOURCE_ALPHA      :: 7;
    DESTINATION_ALPHA           :: 8;
    ONE_MINUS_DESTINATION_ALPHA :: 9;
    SOURCE_ALPHA_SATURATE       :: 10;

    zero                        :: ZERO;
    one                         :: ONE;
    source_color                :: SOURCE_COLOR;
    one_minus_source_color      :: ONE_MINUS_SOURCE_COLOR;
    destination_color           :: DESTINATION_COLOR;
    one_minus_destination_color :: ONE_MINUS_DESTINATION_COLOR;
    source_alpha                :: SOURCE_ALPHA;
    one_minus_source_alpha      :: ONE_MINUS_SOURCE_ALPHA;
    destination_alpha           :: DESTINATION_ALPHA;
    one_minus_destination_alpha :: ONE_MINUS_DESTINATION_ALPHA;
    source_alpha_saturate       :: SOURCE_ALPHA_SATURATE;
}

BlendOp :: enum u8 {
    ADD              :: 0;
    SUBTRACT         :: 1;
    REVERSE_SUBTRACT :: 2;
    MINIMUM          :: 3;
    MAXIMUM          :: 4;

    add              :: ADD;
    subtract         :: SUBTRACT;
    reverse_subtract :: REVERSE_SUBTRACT;
    minimum          :: MINIMUM;
    maximum          :: MAXIMUM;
}

IndexType :: enum u8 {
    U16 :: 0;
    U32 :: 1;

    uint16 :: U16;
    uint32 :: U32;
}

LoadOp :: enum u8 {
    LOAD    :: 0;
    CLEAR   :: 1;
    DISCARD :: 2;

    load    :: LOAD;
    clear   :: CLEAR;
    discard :: DISCARD;
}

StoreOp :: enum u8 {
    STORE   :: 0;
    DISCARD :: 1;

    store   :: STORE;
    discard :: DISCARD;
}

StencilOp :: enum u8 {
    KEEP            :: 0;
    ZERO            :: 1;
    REPLACE         :: 2;
    INCREMENT_CLAMP :: 3;
    DECREMENT_CLAMP :: 4;
    INVERT          :: 5;
    INCREMENT_WRAP  :: 6;
    DECREMENT_WRAP  :: 7;

    keep            :: KEEP;
    zero            :: ZERO;
    replace         :: REPLACE;
    increment_clamp :: INCREMENT_CLAMP;
    decrement_clamp :: DECREMENT_CLAMP;
    invert          :: INVERT;
    increment_wrap  :: INCREMENT_WRAP;
    decrement_wrap  :: DECREMENT_WRAP;
}

// Ordered by Vulkan's logical execution order where stages are comparable.
// A barrier's before execution scope includes the selected and logically earlier
// stages; its after execution scope includes the selected and logically later
// stages. Vertex and task/mesh are alternative graphics branches, depth_stencil_tests
// spans early and late tests around fragment, compute and transfer are separate
// pipelines, host is a pseudo-stage, and none/all_commands are special masks.
Stage :: enum u64 {
    NONE                :: 0;
    INDIRECT            :: 1;
    INDEX_INPUT         :: 2;
    VERTEX              :: 4;
    TASK                :: 8;
    MESH                :: 16;
    DEPTH_STENCIL_TESTS :: 32;
    FRAGMENT            :: 64;
    COLOR_OUTPUT        :: 128;
    COMPUTE             :: 256;
    TRANSFER            :: 512;
    HOST                :: 1024;
    ALL_COMMANDS        :: 2048;

    none                :: NONE;
    indirect            :: INDIRECT;
    index_input         :: INDEX_INPUT;
    vertex              :: VERTEX;
    task                :: TASK;
    mesh                :: MESH;
    depth_stencil_tests :: DEPTH_STENCIL_TESTS;
    fragment            :: FRAGMENT;
    color_output        :: COLOR_OUTPUT;
    compute             :: COMPUTE;
    transfer            :: TRANSFER;
    host                :: HOST;
    all_commands        :: ALL_COMMANDS;
}

operator| :: (lhs: Stage, rhs: Stage) -> Stage #foreign nographicsapiutility_uploads "??Ugpu@@YA?AW4Stage@0@W410@0@Z";

Access :: enum u64 {
    NONE                :: 0;
    TRANSFER_READ       :: 1;
    TRANSFER_WRITE      :: 2;
    SHADER_READ         :: 4;
    SHADER_WRITE        :: 8;
    COLOR_READ          :: 16;
    COLOR_WRITE         :: 32;
    DEPTH_STENCIL_READ  :: 64;
    DEPTH_STENCIL_WRITE :: 128;
    INDIRECT_READ       :: 256;
    INDEX_READ          :: 512;
    HOST_READ           :: 1024;
    DESCRIPTOR_READ     :: 2048;

    none                :: NONE;
    transfer_read       :: TRANSFER_READ;
    transfer_write      :: TRANSFER_WRITE;
    shader_read         :: SHADER_READ;
    shader_write        :: SHADER_WRITE;
    color_read          :: COLOR_READ;
    color_write         :: COLOR_WRITE;
    depth_stencil_read  :: DEPTH_STENCIL_READ;
    depth_stencil_write :: DEPTH_STENCIL_WRITE;
    indirect_read       :: INDIRECT_READ;
    index_read          :: INDEX_READ;
    host_read           :: HOST_READ;
    descriptor_read     :: DESCRIPTOR_READ;
}

operator| :: (lhs: Access, rhs: Access) -> Access #foreign nographicsapiutility_uploads "??Ugpu@@YA?AW4Access@0@W410@0@Z";

DeviceCaps :: struct {
    device_name:              *u8 = null;

    // Flat queue indices: general first, then compute-only, then copy-only. Queue zero supports presentation.
    queue_count:              u32 = 0;
    general_queue_count:      u32 = 0;
    compute_queue_count:      u32 = 0;
    copy_queue_count:         u32 = 0;

    // Copy-only texture offsets/extents align to these texel-block counts, except at mip edges. Zero means whole mip levels only.
    copy_texture_granularity: u32x3;
    max_push_data_size:       u64 = 0;

    // Common element size for suballocating TextureHeap storage; every SizeAlign::align divides this value.
    texture_heap_alignment:   u64 = 0;
    timestamp_period_ns:      float = 0.0; // Nanoseconds per timestamp tick; zero when profiling is unavailable.
    sub_texel_precision_bits: u32 = 0; // Fractional filtering precision, for conservative sampled-field bounds.
    texture_compression_bc    := false;
    texture_compression_astc  := false;
    storage_input_output16    := false;
    indirect_mesh_draw        := false;
}

ColorSpace :: enum u32 {
    SRGB                 :: 0;
    EXTENDED_SRGB_LINEAR :: 1;
    srgb                 :: SRGB;
    extended_srgb_linear :: EXTENDED_SRGB_LINEAR;
}

// Win32 windowed device lifecycle, swapchain format/extent changes, acquire, and presentation stay on the window's message-pump thread.
// Metal calls may use a render thread; synchronize CAMetalLayer access with native UI/layer changes.
// The window/layer must outlive the device. Other calls follow the object-level threading contract below.
// On Linux, display must additionally be set to the xcb_connection_t that owns window.
DeviceDesc :: struct {
    window:                        *void = null; // HWND on Windows; CAMetalLayer* on macOS/iOS. xcb_window_t cast to void* on Linux. Null creates a headless device.
    display:                       *void = null; // Unused on Windows/macOS; xcb_connection_t* on Linux.
    swapchain_format:              Format = .UNDEFINED;
    swapchain_color_space:         ColorSpace = .SRGB;
    desired_swapchain_image_count: u32 = 2; // Vulkan: 1..8 presentation contexts. Metal clamps to 2..3 drawables.
    steam_overlay_compatibility    := false; // macOS only: allow drawable texture views and use classic Metal presentation.

    desired_queue_count:           u32 = 1; // General graphics + compute queues; must be nonzero.
    desired_compute_queue_count:   u32 = 0;
    desired_copy_queue_count:      u32 = 0;
    timestamp_query_count:         u32 = 256; // Per command buffer; zero disables timestamps.
}

DeviceInit :: struct {
    device: *Device = null;
    error:  Error = .NONE;
}

SwapchainFrame :: struct {
    render_view: *RenderView = null;
    extent:      u32x2;
}

TextureDesc :: struct {
    type:           TextureType = .TWO_D;
    extent:         u32x3;
    mip_levels:     u32 = 1;
    layer_count:    u32 = 1; // Vulkan array layers; cube faces are individual layers.
    format:         Format = .RGBA8_UNORM;
    mutable_format  := false; // Allow format-compatible descriptor views, but could lose DCC.
    usage:          TextureUsage = .SAMPLED;
}

RenderViewDesc :: struct {
    mip_level: u32 = 0;
    slice:     u32 = 0; // Physical array slice; cube faces are individual slices.
}

TextureDescriptorDesc :: struct {
    format:      Format = .UNDEFINED; // Undefined inherits the texture format.
    aspect:      TextureAspect = .AUTOMATIC; // Automatic selects color, or depth before stencil.
    base_mip:    u32 = 0;
    mip_count:   u32 = 0; // Zero selects every remaining mip level.
    base_layer:  u32 = 0; // Vulkan array layer; cube faces are individual layers.
    layer_count: u32 = 0; // Vulkan array layers; zero selects every remaining layer.
}

TextureCopyDesc :: struct {
    mip_level:         u32 = 0;
    base_slice:        u32 = 0; // Physical array slice; cube faces are individual slices.
    slice_count:       u32 = 0; // Zero selects every remaining physical slice.
    offset:            u32x3;
    extent:            u32x3; // Zero components select the remaining mip extent.
    row_pitch_bytes:   u64 = 0; // Zero is tightly packed.
    slice_pitch_bytes: u64 = 0; // Zero is tightly packed.
}

SamplerDesc :: struct {
    min_filter:      Filter = .LINEAR;
    mag_filter:      Filter = .LINEAR;
    mip_filter:      Filter = .LINEAR;
    address_u:       AddressMode = .REPEAT;
    address_v:       AddressMode = .REPEAT;
    address_w:       AddressMode = .REPEAT;
    anisotropic      := false; // Uses the API's fixed 4x profile.
    compare_enabled  := false;
    compare:         CompareOp = .LESS_EQUAL;
}

BlendComponentState :: struct {
    source:      BlendFactor = .ONE;
    destination: BlendFactor = .ZERO;
    operation:   BlendOp = .ADD;
}

BlendState :: struct {
    enabled  := false;
    color:   BlendComponentState;
    alpha:   BlendComponentState;
}

ColorTargetDesc :: struct {
    format:     Format = .UNDEFINED;
    blend:      BlendState;
    write_mask: u8 = 15;
}

RasterizationState :: struct {
    cull:                CullMode = .NONE;
    depth_bias_constant: float = 0.0;
    depth_bias_clamp:    float = 0.0;
    depth_bias_slope:    float = 0.0;
}

Viewport :: struct {
    x:         float = 0.0;
    y:         float = 0.0;
    width:     float = 1.0;
    height:    float = 1.0;
    min_depth: float = 0.0;
    max_depth: float = 1.0;
}

Scissor :: struct {
    x:      s32 = 0;
    y:      s32 = 0;
    width:  u32 = 1;
    height: u32 = 1;
}

StencilFaceState :: struct {
    compare:    CompareOp = .ALWAYS;
    fail:       StencilOp = .KEEP;
    pass:       StencilOp = .KEEP;
    depth_fail: StencilOp = .KEEP;
    reference:  u8 = 0;
}

DepthStencilState :: struct {
    depth_test          := false;
    depth_write         := false;
    depth_compare:      CompareOp = .LESS_EQUAL;
    stencil_test        := false;
    stencil_read_mask:  u8 = 255;
    stencil_write_mask: u8 = 255;
    front:              StencilFaceState;
    back:               StencilFaceState;
}

ShaderStage :: struct {
    // Precompiled SPIR-V on Vulkan (4-byte-aligned words), metallib on Metal. Empty omits an optional stage.
    code:             ByteSpan;
    entry_point:      *u8 = "main";

    // Metal compute/task/mesh dimensions must match the compiled numthreads. Vulkan uses the SPIR-V metadata.
    threadgroup_size: u32x3;
}

GraphicsPSODesc :: struct {
    vertex:         ShaderStage;
    fragment:       ShaderStage; // Empty omits the fragment stage, for depth-only rasterization.
    color_targets:  Span(ColorTargetDesc);
    depth_format:   Format = .UNDEFINED;
    stencil_format: Format = .UNDEFINED;
    rasterization:  RasterizationState;
}

MeshPSODesc :: struct {
    task:           ShaderStage; // Empty launches mesh workgroups directly; otherwise draws launch task workgroups.
    mesh:           ShaderStage;
    fragment:       ShaderStage; // Empty omits the fragment stage, for depth-only rasterization.
    color_targets:  Span(ColorTargetDesc);
    depth_format:   Format = .UNDEFINED;
    stencil_format: Format = .UNDEFINED;
    rasterization:  RasterizationState;
}

ClearColor :: struct {
    x: float = 0.0;
    y: float = 0.0;
    z: float = 0.0;
    w: float = 1.0;
}

ColorAttachment :: struct {
    render_view: *RenderView = null;
    load:        LoadOp = .LOAD;
    store:       StoreOp = .STORE;
    clear:       ClearColor;
}

DepthAttachment :: struct {
    render_view: *RenderView = null;
    load:        LoadOp = .LOAD;
    store:       StoreOp = .STORE;
    clear:       float = 1.0;
}

StencilAttachment :: struct {
    render_view: *RenderView = null;
    load:        LoadOp = .LOAD;
    store:       StoreOp = .STORE;
    clear:       u8 = 0;
}

RenderingDesc :: struct {
    colors:              Span(ColorAttachment);
    depth:               DepthAttachment;
    stencil:             StencilAttachment;

    // NOTE: Only used in Metal rendering, where the default NoGraphicsAPI behavior (false)
    // set front-face winding to CounterClockwise and inverts the viewport. When set to true
    // we do ClockWise and standard viewport orientation, so y-up points to the top of the
    // viewport
    metal_y_up_viewport  := false;
}

RenderingFlags :: enum u32 {
    NONE       :: 0;
    SUSPENDING :: 2;
    RESUMING   :: 4;

    none       :: NONE;
    suspending :: SUSPENDING;
    resuming   :: RESUMING;
}

// Rendering and raster PSOs accept at most eight color attachments. A render pass needs at least one attachment to infer its area.
// All resource destruction is immediate. Destroy resources only when no recorded or executing GPU frame uses them.
// The optional NoGraphicsAPIUtility DeleteQueue can defer destruction until a submitted frame completes.
// Wait for all submitted frames to drain before destroying the device.
// Distinct resource creation/destruction, immutable queries, and timeline waits may run concurrently on one device.
// Resource lifetime changes must be synchronized with every CPU/GPU use of that resource.
// Concurrent descriptor updates require disjoint destinations, and copy source slots must not be modified by another update.
// Each (device, queue_index) and command pool (including recording its buffers) is externally synchronized; different queues/pools may run concurrently.
// Device idle/destruction requires exclusive access. Destroy command pools before their device. There are no internal queue or pool locks.
// Initialization and resource creation failures return an Error, nullptr, or an empty aggregate; details go to the optional error callback.
create_device :: (desc: *DeviceDesc) -> DeviceInit #foreign nographicsapi "?create_device@gpu@@YA?AUDeviceInit@1@AEBUDeviceDesc@1@@Z";
create_device :: (desc: DeviceDesc) -> DeviceInit #no_context {
    return create_device(*desc);
}
destroy_device :: (device: *Device) -> void #foreign nographicsapi "?destroy_device@gpu@@YAXPEAUDevice@1@@Z";
get_device_caps :: (device: *Device) -> *DeviceCaps #foreign nographicsapi "?get_device_caps@gpu@@YAAEBUDeviceCaps@1@PEBUDevice@1@@Z";
supports_texture_format :: (device: *Device, format: Format, usage: TextureUsage) -> bool #foreign nographicsapi "?supports_texture_format@gpu@@YA_NPEBUDevice@1@W4Format@1@W4TextureUsage@1@@Z";
get_drawable_extent :: (device: *Device) -> u32x2 #foreign nographicsapi "?get_drawable_extent@gpu@@YA?AUuint32x2@1@PEAUDevice@1@@Z";

// Call after wait_idle, outside an acquired frame. Unsupported pairs leave the current mode unchanged.
// A zero-size drawable defers swapchain recreation until acquire sees a nonzero extent.
set_swapchain_format :: (device: *Device, format: Format, color_space: ColorSpace) -> Error #foreign nographicsapi "?set_swapchain_format@gpu@@YA?AW4Error@1@PEAUDevice@1@W4Format@1@W4ColorSpace@1@@Z";

create_timeline_semaphore :: (device: *Device, initial_value: u64 = 0) -> *TimelineSemaphore #foreign nographicsapi "?create_timeline_semaphore@gpu@@YAPEAUTimelineSemaphore@1@PEAUDevice@1@_K@Z";
destroy_timeline_semaphore :: (semaphore: *TimelineSemaphore) -> void #foreign nographicsapi "?destroy_timeline_semaphore@gpu@@YAXPEAUTimelineSemaphore@1@@Z";
timeline_completed_value :: (semaphore: *TimelineSemaphore) -> u64 #foreign nographicsapi "?timeline_completed_value@gpu@@YA_KPEBUTimelineSemaphore@1@@Z";
wait_timeline :: (point: TimelinePoint) -> void #foreign nographicsapi "?wait_timeline@gpu@@YAXUTimelinePoint@1@@Z";
wait_idle :: (device: *Device) -> void #foreign nographicsapi "?wait_idle@gpu@@YAXPEAUDevice@1@@Z";

// Acquire outside a render pass. Later buffers in the same presentation submission may also access the returned image.
// submit_and_present prepares the image for presentation after all submitted buffers.
// Empty while the drawable extent is zero. A nonempty acquire must be submitted with submit_and_present on queue zero.
acquire :: (commands: *CommandBuffer) -> SwapchainFrame #foreign nographicsapi "?acquire@gpu@@YA?AUSwapchainFrame@1@PEAUCommandBuffer@1@@Z";
submit_and_present :: (device: *Device, desc: *SubmitDesc) -> void #foreign nographicsapi "?submit_and_present@gpu@@YAXPEAUDevice@1@AEBUSubmitDesc@1@@Z";
submit_and_present :: (device: *Device, desc: SubmitDesc) #no_context {
    submit_and_present(device, *desc);
}

// Every non-null returned pointer is 16-byte aligned. GPU heaps are raw blocks for application-side suballocation.
// Metal and Vulkan without device-address commands support at most 64 live GPU heaps per device.
create_gpu_heap :: (device: *Device, byte_count: u64, memory: MemoryType = .CPU_VISIBLE) -> GpuHeap #foreign nographicsapi "?create_gpu_heap@gpu@@YA?AUGpuHeap@1@PEAUDevice@1@_KW4MemoryType@1@@Z";
destroy_gpu_heap :: (heap: *GpuHeap) -> void #foreign nographicsapi "?destroy_gpu_heap@gpu@@YAXAEBUGpuHeap@1@@Z";
destroy_gpu_heap :: (heap: GpuHeap) #no_context {
    destroy_gpu_heap(*heap);
}

// NOTE: removed constexpr (to prevent inlining) and moved implementation to NoGraphicsAPI.cpp/mm to ensure the built library exports the symbol
// for c-binding
gpu_range :: (heap: *GpuHeap) -> GpuRange #foreign nographicsapi "?gpu_range@gpu@@YA?AUGpuRange@1@AEBUGpuHeap@1@@Z";
gpu_range :: (heap: GpuHeap) -> GpuRange #no_context {
    return gpu_range(*heap);
}

// Texture heaps use one device-selected GPU-only memory type and must outlive every placed texture.
// Placements must satisfy get_texture_size_align(). Overlapping textures require disjoint periods of GPU use and reinitialization after aliased writes.
// DeviceCaps::texture_heap_alignment can be used as a common allocator element size, avoiding per-placement leading alignment padding.
create_texture_heap :: (device: *Device, byte_count: u64) -> TextureHeap #foreign nographicsapi "?create_texture_heap@gpu@@YA?AUTextureHeap@1@PEAUDevice@1@_K@Z";
destroy_texture_heap :: (heap: *TextureHeap) -> void #foreign nographicsapi "?destroy_texture_heap@gpu@@YAXAEBUTextureHeap@1@@Z";
destroy_texture_heap :: (heap: TextureHeap) #no_context {
    destroy_texture_heap(*heap);
}
get_texture_size_align :: (device: *Device, desc: *TextureDesc) -> SizeAlign #foreign nographicsapi "?get_texture_size_align@gpu@@YA?AUSizeAlign@1@PEAUDevice@1@AEBUTextureDesc@1@@Z";
get_texture_size_align :: (device: *Device, desc: TextureDesc) -> SizeAlign #no_context {
    return get_texture_size_align(device, *desc);
}

// Creates an uninitialized texture without recording GPU commands. Views and descriptors can be created before initialize_texture().
create_texture :: (device: *Device, desc: *TextureDesc, heap: *TextureHeap, offset: u64) -> *Texture #foreign nographicsapi "?create_texture@gpu@@YAPEAUTexture@1@PEAUDevice@1@AEBUTextureDesc@1@AEBUTextureHeap@1@_K@Z";
create_texture :: (device: *Device, desc: TextureDesc, heap: TextureHeap, offset: u64) -> *Texture #no_context {
    return create_texture(device, *desc, *heap, offset);
}
destroy_texture :: (texture: *Texture) -> void #foreign nographicsapi "?destroy_texture@gpu@@YAXPEAUTexture@1@@Z";
create_render_view :: (texture: *Texture, desc: *RenderViewDesc) -> *RenderView #foreign nographicsapi "?create_render_view@gpu@@YAPEAURenderView@1@PEAUTexture@1@AEBURenderViewDesc@1@@Z";
create_render_view :: (texture: *Texture, desc: RenderViewDesc) -> *RenderView #no_context {
    return create_render_view(texture, *desc);
}
destroy_render_view :: (render_view: *RenderView) -> void #foreign nographicsapi "?destroy_render_view@gpu@@YAXPEAURenderView@1@@Z";

// Descriptor slots form application-owned namespaces. Writes and copies require indices within capacity;
// do not modify slots until all commands using their previous contents have completed. Copies may overlap.
create_texture_descriptor_heap :: (device: *Device, capacity: u32) -> *TextureDescriptorHeap #foreign nographicsapi "?create_texture_descriptor_heap@gpu@@YAPEAUTextureDescriptorHeap@1@PEAUDevice@1@I@Z";
destroy_texture_descriptor_heap :: (heap: *TextureDescriptorHeap) -> void #foreign nographicsapi "?destroy_texture_descriptor_heap@gpu@@YAXPEAUTextureDescriptorHeap@1@@Z";
write_texture_descriptor :: (heap: *TextureDescriptorHeap, index: u32, texture: *Texture, type: TextureDescriptorType, desc: *TextureDescriptorDesc) -> void #foreign nographicsapi "?write_texture_descriptor@gpu@@YAXPEAUTextureDescriptorHeap@1@IPEBUTexture@1@W4TextureDescriptorType@1@AEBUTextureDescriptorDesc@1@@Z";
write_texture_descriptor :: (heap: *TextureDescriptorHeap, index: u32, texture: *Texture, type: TextureDescriptorType, desc: TextureDescriptorDesc) #no_context {
    write_texture_descriptor(heap, index, texture, type, *desc);
}

copy_texture_descriptors :: (source: *TextureDescriptorHeap, source_index: u32, destination: *TextureDescriptorHeap, destination_index: u32, count: u32) -> void #foreign nographicsapi "?copy_texture_descriptors@gpu@@YAXPEBUTextureDescriptorHeap@1@IPEAU21@II@Z";

create_sampler_descriptor_heap :: (device: *Device, capacity: u32) -> *SamplerDescriptorHeap #foreign nographicsapi "?create_sampler_descriptor_heap@gpu@@YAPEAUSamplerDescriptorHeap@1@PEAUDevice@1@I@Z";
destroy_sampler_descriptor_heap :: (heap: *SamplerDescriptorHeap) -> void #foreign nographicsapi "?destroy_sampler_descriptor_heap@gpu@@YAXPEAUSamplerDescriptorHeap@1@@Z";
write_sampler_descriptor :: (heap: *SamplerDescriptorHeap, index: u32, desc: *SamplerDesc) -> void #foreign nographicsapi "?write_sampler_descriptor@gpu@@YAXPEAUSamplerDescriptorHeap@1@IAEBUSamplerDesc@1@@Z";
write_sampler_descriptor :: (heap: *SamplerDescriptorHeap, index: u32, desc: SamplerDesc) #no_context {
    write_sampler_descriptor(heap, index, *desc);
}
copy_sampler_descriptors :: (source: *SamplerDescriptorHeap, source_index: u32, destination: *SamplerDescriptorHeap, destination_index: u32, count: u32) -> void #foreign nographicsapi "?copy_sampler_descriptors@gpu@@YAXPEBUSamplerDescriptorHeap@1@IPEAU21@II@Z";

create_graphics_pso :: (device: *Device, desc: *GraphicsPSODesc) -> *PSO #foreign nographicsapi "?create_graphics_pso@gpu@@YAPEAUPSO@1@PEAUDevice@1@AEBUGraphicsPSODesc@1@@Z";
create_graphics_pso :: (device: *Device, desc: GraphicsPSODesc) -> *PSO #no_context {
    return create_graphics_pso(device, *desc);
}
create_mesh_pso :: (device: *Device, desc: *MeshPSODesc) -> *PSO #foreign nographicsapi "?create_mesh_pso@gpu@@YAPEAUPSO@1@PEAUDevice@1@AEBUMeshPSODesc@1@@Z";
create_mesh_pso :: (device: *Device, desc: MeshPSODesc) -> *PSO #no_context {
    return create_mesh_pso(device, *desc);
}
create_compute_pso :: (device: *Device, compute: *ShaderStage) -> *PSO #foreign nographicsapi "?create_compute_pso@gpu@@YAPEAUPSO@1@PEAUDevice@1@AEBUShaderStage@1@@Z";
create_compute_pso :: (device: *Device, compute: ShaderStage) -> *PSO #no_context {
    return create_compute_pso(device, *compute);
}
destroy_pso :: (pso: *PSO) -> void #foreign nographicsapi "?destroy_pso@gpu@@YAXPEAUPSO@1@@Z";

// Pools retain command storage until destruction. Reset only after every submitted buffer from this pool completes; unsubmitted buffers are discarded.
// Reset invalidates all previously returned CommandBuffer handles. Use one pool per worker and in-flight frame for independent recording/reuse.
// Buffers from a pool must be submitted to the selected queue's family.
create_command_pool :: (device: *Device, queue_index: u32 = 0) -> *CommandPool #foreign nographicsapi "?create_command_pool@gpu@@YAPEAUCommandPool@1@PEAUDevice@1@I@Z";
destroy_command_pool :: (pool: *CommandPool) -> void #foreign nographicsapi "?destroy_command_pool@gpu@@YAXPEAUCommandPool@1@@Z";
reset_command_pool :: (pool: *CommandPool) -> void #foreign nographicsapi "?reset_command_pool@gpu@@YAXPEAUCommandPool@1@@Z";
begin_commands :: (pool: *CommandPool) -> *CommandBuffer #foreign nographicsapi "?begin_commands@gpu@@YAPEAUCommandBuffer@1@PEAUCommandPool@1@@Z";
end_commands :: (commands: *CommandBuffer) -> void #foreign nographicsapi "?end_commands@gpu@@YAXPEAUCommandBuffer@1@@Z";

// Submit any ended subset exactly once before pool reset. Order completion semaphore signal values across queues.
// queue_index must be less than DeviceCaps::queue_count; omitted selects queue zero.
submit :: (device: *Device, desc: *SubmitDesc, queue_index: u32 = 0) -> void #foreign nographicsapi "?submit@gpu@@YAXPEAUDevice@1@AEBUSubmitDesc@1@I@Z";
submit :: (device: *Device, desc: SubmitDesc, queue_index: u32 = 0) #no_context {
    submit(device, *desc, queue_index);
}

set_texture_descriptor_heap :: (commands: *CommandBuffer, heap: *TextureDescriptorHeap) -> void #foreign nographicsapi "?set_texture_descriptor_heap@gpu@@YAXPEAUCommandBuffer@1@PEAUTextureDescriptorHeap@1@@Z";
set_sampler_descriptor_heap :: (commands: *CommandBuffer, heap: *SamplerDescriptorHeap) -> void #foreign nographicsapi "?set_sampler_descriptor_heap@gpu@@YAXPEAUCommandBuffer@1@PEAUSamplerDescriptorHeap@1@@Z";

// Initialize whole-texture metadata outside a render pass before first GPU use and before reuse after writes through an alias.
// Texture aliasing uses overlapping placements in one TextureHeap; no creation flag is required.
// Synchronize prior storage accesses and make their writes available with barriers or timeline waits first; these do not initialize metadata.
// Discards contents; clear or overwrite before reading. Orders initialization before subsequent texture accesses on this queue.
initialize_texture :: (commands: *CommandBuffer, texture: *Texture) -> void #foreign nographicsapi "?initialize_texture@gpu@@YAXPEAUCommandBuffer@1@PEAUTexture@1@@Z";

// Command GPU ranges must lie within one GPU heap.
copy_memory :: (commands: *CommandBuffer, source: GpuRange, destination: GpuRange) -> void #foreign nographicsapi "?copy_memory@gpu@@YAXPEAUCommandBuffer@1@UGpuRange@1@1@Z";

// Depth/stencil copies require a general queue. Copy-only queues also require DeviceCaps::copy_texture_granularity alignment.
copy_memory_to_texture :: (commands: *CommandBuffer, source: GpuRange, destination: *Texture, copy: *TextureCopyDesc) -> void #foreign nographicsapi "?copy_memory_to_texture@gpu@@YAXPEAUCommandBuffer@1@UGpuRange@1@PEAUTexture@1@AEBUTextureCopyDesc@1@@Z";
copy_memory_to_texture :: (commands: *CommandBuffer, source: GpuRange, destination: *Texture, copy: TextureCopyDesc) #no_context {
    copy_memory_to_texture(commands, source, destination, *copy);
}
copy_texture_to_memory :: (commands: *CommandBuffer, source: *Texture, destination: GpuRange, copy: *TextureCopyDesc) -> void #foreign nographicsapi "?copy_texture_to_memory@gpu@@YAXPEAUCommandBuffer@1@PEAUTexture@1@UGpuRange@1@AEBUTextureCopyDesc@1@@Z";
copy_texture_to_memory :: (commands: *CommandBuffer, source: *Texture, destination: GpuRange, copy: TextureCopyDesc) #no_context {
    copy_texture_to_memory(commands, source, destination, *copy);
}

barrier :: (commands: *CommandBuffer, before: Stage, before_access: Access, after: Stage, after_access: Access) -> void #foreign nographicsapi "?barrier@gpu@@YAXPEAUCommandBuffer@1@W4Stage@1@W4Access@1@12@Z";

// Up to DeviceDesc::timestamp_query_count markers per command buffer. stage must map to a single GPU pipeline stage.
// Ignored, leaving the destination unchanged, when timestamps are disabled or the queue lacks profiling support.
// Destinations are ordinary CPU memory and must remain valid and distinct until read_timestamps retrieves the results.
write_timestamp :: (commands: *CommandBuffer, cpu_destination: *u64, stage: Stage = .ALL_COMMANDS) -> void #foreign nographicsapi "?write_timestamp@gpu@@YAXPEAUCommandBuffer@1@PEA_KW4Stage@1@@Z";

// Retrieve unread timestamps from submitted buffers after every submission from this pool completes. Does not wait.
// Call before resetting the pool; reset discards unread results. Unsubmitted buffers are ignored.
read_timestamps :: (pool: *CommandPool) -> void #foreign nographicsapi "?read_timestamps@gpu@@YAXPEAUCommandPool@1@@Z";

// Every render pass starts with no graphics PSO. Bind one inside the pass before drawing, including every resumed segment.
// Render-pass boundaries invalidate the current PSO selection; rebind a compute PSO before dispatching after a render pass.
// Each segment needs matching attachments, load/store operations, and clear values, and its own begin/end_render_pass pair.
// Submit the complete suspend/resume chain in order in one batch. No action or synchronization commands may occur between segments.
// The first/last segments apply the requested load/store operations.
// Command-buffer bindings are not inherited.
begin_render_pass :: (commands: *CommandBuffer, desc: *RenderingDesc, flags: RenderingFlags = .NONE) -> void #foreign nographicsapi "?begin_render_pass@gpu@@YAXPEAUCommandBuffer@1@AEBURenderingDesc@1@W4RenderingFlags@1@@Z";
begin_render_pass :: (commands: *CommandBuffer, desc: RenderingDesc, flags: RenderingFlags = .NONE) #no_context {
    begin_render_pass(commands, *desc, flags);
}
end_render_pass :: (commands: *CommandBuffer) -> void #foreign nographicsapi "?end_render_pass@gpu@@YAXPEAUCommandBuffer@1@@Z";

// begin_render_pass resets a full render-area viewport and scissor and disables depth/stencil; these commands override those defaults until the next pass
set_viewport :: (commands: *CommandBuffer, viewport: *Viewport) -> void #foreign nographicsapi "?set_viewport@gpu@@YAXPEAUCommandBuffer@1@AEBUViewport@1@@Z";
set_viewport :: (commands: *CommandBuffer, viewport: Viewport) #no_context {
    set_viewport(commands, *viewport);
}
set_scissor :: (commands: *CommandBuffer, scissor: *Scissor) -> void #foreign nographicsapi "?set_scissor@gpu@@YAXPEAUCommandBuffer@1@AEBUScissor@1@@Z";
set_scissor :: (commands: *CommandBuffer, scissor: Scissor) #no_context {
    set_scissor(commands, *scissor);
}
set_depth_stencil :: (commands: *CommandBuffer, state: *DepthStencilState) -> void #foreign nographicsapi "?set_depth_stencil@gpu@@YAXPEAUCommandBuffer@1@AEBUDepthStencilState@1@@Z";
set_depth_stencil :: (commands: *CommandBuffer, state: DepthStencilState) #no_context {
    set_depth_stencil(commands, *state);
}

// Bind graphics/mesh PSOs inside an active render pass; bind compute PSOs outside render passes.
bind_pso :: (commands: *CommandBuffer, pso: *PSO) -> void #foreign nographicsapi "?bind_pso@gpu@@YAXPEAUCommandBuffer@1@PEBUPSO@1@@Z";

// root uses the shared constant-buffer layout and a 16-byte-aligned GPU address, or nullptr for rootless shaders.
// Retain its storage through GPU completion.
// Finish CPU writes before submission; wait for prior GPU users before overwriting. Synchronize GPU writes before consuming the root.
// Storage is application-owned; these commands do not copy root bytes or allocate memory.
draw :: (commands: *CommandBuffer, root: *void, vertex_count: u32, instance_count: u32 = 1, first_vertex: u32 = 0, first_instance: u32 = 0) -> void #foreign nographicsapi "?draw@gpu@@YAXPEAUCommandBuffer@1@PEBXIIII@Z";

draw_indexed :: (commands: *CommandBuffer, root: *void, indices: GpuRange, type: IndexType, index_count: u32, instance_count: u32 = 1, first_index: u32 = 0, vertex_offset: s32 = 0, first_instance: u32 = 0) -> void #foreign nographicsapi "?draw_indexed@gpu@@YAXPEAUCommandBuffer@1@PEBXUGpuRange@1@W4IndexType@1@IIIHI@Z";

draw_indirect :: (commands: *CommandBuffer, root: *void, arguments: GpuRange, draw_count: u32 = 1, stride: u32 = 0) -> void #foreign nographicsapi "?draw_indirect@gpu@@YAXPEAUCommandBuffer@1@PEBXUGpuRange@1@II@Z";
draw_indexed_indirect :: (commands: *CommandBuffer, root: *void, indices: GpuRange, type: IndexType, arguments: GpuRange, draw_count: u32 = 1, stride: u32 = 0) -> void #foreign nographicsapi "?draw_indexed_indirect@gpu@@YAXPEAUCommandBuffer@1@PEBXUGpuRange@1@W4IndexType@1@2II@Z";

dispatch :: (commands: *CommandBuffer, root: *void, group_count: u32x3) -> void #foreign nographicsapi "?dispatch@gpu@@YAXPEAUCommandBuffer@1@PEBXUuint32x3@1@@Z";
dispatch_indirect :: (commands: *CommandBuffer, root: *void, arguments: GpuRange) -> void #foreign nographicsapi "?dispatch_indirect@gpu@@YAXPEAUCommandBuffer@1@PEBXUGpuRange@1@@Z";
draw_meshlets :: (commands: *CommandBuffer, root: *void, group_count: u32x3) -> void #foreign nographicsapi "?draw_meshlets@gpu@@YAXPEAUCommandBuffer@1@PEBXUuint32x3@1@@Z";

// Requires DeviceCaps::indirect_mesh_draw. Direct task/mesh draws remain available on every supported device.
draw_meshlets_indirect :: (commands: *CommandBuffer, root: *void, arguments: GpuRange, draw_count: u32 = 1, stride: u32 = 0) -> void #foreign nographicsapi "?draw_meshlets_indirect@gpu@@YAXPEAUCommandBuffer@1@PEBXUGpuRange@1@II@Z";

BumpAllocator :: struct {
    alignment: u64 : 16;

    // Storage must be nonempty, expose at least one address, and align every exposed address to 16 bytes.
    Constructor :: (this: *BumpAllocator, storage: GpuCpuRange(u8)) -> void #cpp_method #foreign nographicsapiutility_allocators "??0BumpAllocator@gpu@@QEAA@U?$GpuCpuRange@E@1@@Z";

    // The request must be nonzero. Reservations are rounded up to 16 bytes; an empty allocation reports exhausted storage.
    allocate :: (this: *BumpAllocator, byte_size: u64) -> GpuCpuRange(u8) #cpp_method #foreign nographicsapiutility_allocators "?allocate@BumpAllocator@gpu@@QEAA?AU?$GpuCpuRange@E@2@_K@Z";

    // Intended for concurrent bump allocation from worker threads. Successful concurrent calls to allocate_atomic() return disjoint ranges.
    // The request must be nonzero. Reservations are rounded up to 16 bytes; an empty allocation reports exhausted storage.
    // Every other operation, including allocate(), reset(), move construction/assignment, and destruction, requires exclusive access.
    // None may execute concurrently with allocate() or allocate_atomic().
    allocate_atomic :: (this: *BumpAllocator, byte_size: u64) -> GpuCpuRange(u8) #cpp_method #foreign nographicsapiutility_allocators "?allocate_atomic@BumpAllocator@gpu@@QEAA?AU?$GpuCpuRange@E@2@_K@Z";

    // Reset invalidates every previous allocation.
    reset :: (this: *BumpAllocator) -> void #cpp_method #foreign nographicsapiutility_allocators "?reset@BumpAllocator@gpu@@QEAAXXZ";

    storage_:  GpuCpuRange(u8);
    offset_:   u64 = 0;
}

// Stores one trivial noexcept void callback in StorageSize inline bytes. Clear before setting a new callback.
FixedFunction :: struct(StorageSize: u64) {
    Invoke :: #type (unknown0: *void) -> void #c_call;

    storage_: [StorageSize] u8;
    invoke_:  Invoke = null;
}

DeleteQueue :: struct {
    // Capacity must be nonzero, every callback must run before destruction, and the timeline must be live when tick() is called.
    Constructor :: (this: *DeleteQueue, timeline: *TimelineSemaphore, capacity: u32) -> void #cpp_method #foreign nographicsapiutility_allocators "??0DeleteQueue@gpu@@QEAA@PEAUTimelineSemaphore@1@I@Z";
    Destructor :: (this: *DeleteQueue) -> void #cpp_method #foreign nographicsapiutility_allocators "??1DeleteQueue@gpu@@QEAA@XZ";

    tick :: (this: *DeleteQueue) -> void #cpp_method #foreign nographicsapiutility_allocators "?tick@DeleteQueue@gpu@@QEAAXXZ";
    drain :: (this: *DeleteQueue) -> void #cpp_method #foreign nographicsapiutility_allocators "?drain@DeleteQueue@gpu@@QEAAXXZ";

    Entry :: struct {
        retire_value: u64;
        callback:     FixedFunction(128);
    }

    collect :: (this: *DeleteQueue, completed_value: u64) -> void #cpp_method #foreign nographicsapiutility_allocators "?collect@DeleteQueue@gpu@@AEAAX_K@Z";

    timeline_: *TimelineSemaphore = null;
    entries_:  *Entry = null;
    capacity_: u32 = 0;
    head_:     u32 = 0;
    tail_:     u32 = 0;
    count_:    u32 = 0;
    ticking_   := false;
}

HeapAllocation :: struct(T: Type) {
    range: GpuCpuRange(T); // Size is in bytes.
    token: u32 = 4294967295;
}

HeapAllocator :: struct {
    alignment:                u64 : 16;

    maximum_allocation_count: u32 : (4294967295 - 1) / 2;

    // Storage must expose at least one address, align every exposed address to 16 bytes, and contain 16..maximum_size bytes.
    // max_allocations must be 1..maximum_allocation_count.
    // A trailing partial element is unused.
    Constructor :: (this: *HeapAllocator, storage: GpuCpuRange(u8), max_allocations: u32) -> void #cpp_method #foreign nographicsapiutility_allocators "??0HeapAllocator@gpu@@QEAA@U?$GpuCpuRange@E@1@I@Z";

    // The request must be nonzero. An allocation with an empty range reports exhausted storage.
    allocate :: (this: *HeapAllocator, byte_size: u64) -> HeapAllocation(u8) #cpp_method #foreign nographicsapiutility_allocators "?allocate@HeapAllocator@gpu@@QEAA?AU?$HeapAllocation@E@2@_K@Z";

    reset :: (this: *HeapAllocator) -> void #cpp_method #foreign nographicsapiutility_allocators "?reset@HeapAllocator@gpu@@QEAAXXZ";

    NodeIndex :: u32;

    unused_node:              NodeIndex : 4294967295;
    top_bin_count:            u32 : 32;
    bins_per_leaf:            u32 : 8;
    leaf_bin_count:           u32 : top_bin_count * bins_per_leaf;

    Range :: struct {
        offset: u32 = unused_node;
        token:  NodeIndex = unused_node;
    }

    RangeAllocator :: struct {
        Node :: struct {
            offset:            u32 = 0;
            size:              u32 = 0;
            bin_previous:      NodeIndex = unused_node;
            bin_next:          NodeIndex = unused_node;
            neighbor_previous: NodeIndex = unused_node;
            neighbor_next:     NodeIndex = unused_node;
            used               := false;
        }

        Constructor :: (this: *RangeAllocator, byte_size: u64, max_allocations: u32, element_size: u64) -> void #cpp_method #foreign nographicsapiutility_allocators "??0RangeAllocator@HeapAllocator@gpu@@QEAA@_KI0@Z";

        Destructor :: (this: *RangeAllocator) -> void #cpp_method #foreign nographicsapiutility_allocators "??1RangeAllocator@HeapAllocator@gpu@@QEAA@XZ";

        allocate :: (this: *RangeAllocator, byte_size: u64) -> Range #cpp_method #foreign nographicsapiutility_allocators "?allocate@RangeAllocator@HeapAllocator@gpu@@QEAA?AURange@23@_K@Z";
        free :: (this: *RangeAllocator, token: NodeIndex) -> void #cpp_method #foreign nographicsapiutility_allocators "?free@RangeAllocator@HeapAllocator@gpu@@QEAAXI@Z";
        reset :: (this: *RangeAllocator) -> void #cpp_method #foreign nographicsapiutility_allocators "?reset@RangeAllocator@HeapAllocator@gpu@@QEAAXXZ";

        move_from :: (this: *RangeAllocator, other: *RangeAllocator) -> void #cpp_method #foreign nographicsapiutility_allocators "?move_from@RangeAllocator@HeapAllocator@gpu@@QEAAXAEAU123@@Z";
        acquire_node :: (this: *RangeAllocator) -> NodeIndex #cpp_method #foreign nographicsapiutility_allocators "?acquire_node@RangeAllocator@HeapAllocator@gpu@@QEAAIXZ";
        release_node :: (this: *RangeAllocator, node_index: NodeIndex) -> void #cpp_method #foreign nographicsapiutility_allocators "?release_node@RangeAllocator@HeapAllocator@gpu@@QEAAXI@Z";
        insert_free_node :: (this: *RangeAllocator, node_index: NodeIndex) -> void #cpp_method #foreign nographicsapiutility_allocators "?insert_free_node@RangeAllocator@HeapAllocator@gpu@@QEAAXI@Z";
        remove_free_node :: (this: *RangeAllocator, node_index: NodeIndex) -> void #cpp_method #foreign nographicsapiutility_allocators "?remove_free_node@RangeAllocator@HeapAllocator@gpu@@QEAAXI@Z";

        element_size:     u64 = 0;
        capacity:         u32 = 0;
        max_allocations:  u32 = 0;
        allocation_count: u32 = 0;
        node_capacity:    u32 = 0;
        free_node_count:  u32 = 0;
        used_top_bins:    u32 = 0;
        used_leaf_bins:   [32] u8;
        bin_indices:      [256] NodeIndex;
        nodes:            *Node = null;
        free_nodes:       *NodeIndex = null;
    }

    storage_:                 GpuCpuRange(u8);
    ranges_:                  RangeAllocator;
}

PlacedTexture :: struct {
    texture: *Texture;
    token:   u32;
}

TextureAllocator :: struct {
    // max_textures must be 1..HeapAllocator::maximum_allocation_count.
    Constructor :: (this: *TextureAllocator, device: *Device, heap: *TextureHeap, max_textures: u32) -> void #cpp_method #foreign nographicsapiutility_textures "??0TextureAllocator@gpu@@QEAA@PEAUDevice@1@AEBUTextureHeap@1@I@Z";
    Constructor :: (this: *TextureAllocator, device: *Device, heap: TextureHeap, max_textures: u32) #no_context {
        Constructor(this, device, *heap, max_textures);
    }

    // Returns an uninitialized texture. Externally synchronize this allocator.
    // An empty result reports exhausted heap space. Free once with the same allocator after all views and GPU use have finished.
    allocate :: (this: *TextureAllocator, desc: *TextureDesc) -> PlacedTexture #cpp_method #foreign nographicsapiutility_textures "?allocate@TextureAllocator@gpu@@QEAA?AUPlacedTexture@2@AEBUTextureDesc@2@@Z";
    allocate :: (this: *TextureAllocator, desc: TextureDesc) -> PlacedTexture #no_context {
        return allocate(this, *desc);
    }
    free :: (this: *TextureAllocator, texture: *PlacedTexture) -> void #cpp_method #foreign nographicsapiutility_textures "?free@TextureAllocator@gpu@@QEAAXAEAUPlacedTexture@2@@Z";

    device_: *Device = null;
    heap_:   TextureHeap;
    ranges_: HeapAllocator.RangeAllocator;
}

UploadQueueStats :: struct {
    capacity:           u64 = 0;
    bytes_in_use:       u64 = 0;
    peak_bytes:         u64 = 0;
    submissions:        u64 = 0;
    waits:              u64 = 0;
    pending_batches:    u32 = 0;
    pending_operations: u32 = 0;
}

// Externally synchronize this uploader and its selected queue. Destination and callback resource lifetimes remain caller-owned.
// Order texture initialization and prior resource use on that queue before enqueuing uploads, including any waits on other queues.
UploadQueue :: struct {
    operation_limit: u32 : 4096;
    alignment:       u64 : 16;

    // Capacity must be a positive multiple of 16. queue_index must be less than DeviceCaps::queue_count.
    // max_pending_batches must be nonzero; normally match the number of frames in flight.
    Constructor :: (this: *UploadQueue, device: *Device, capacity: u64 = 64 * 1024 * 1024, queue_index: u32 = 0, max_pending_batches: u32 = 2) -> void #cpp_method #foreign nographicsapiutility_uploads "??0UploadQueue@gpu@@QEAA@PEAUDevice@1@_KII@Z";
    Destructor :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "??1UploadQueue@gpu@@QEAA@XZ";

    // Flushes and waits for uploads. Finish external submissions using returned timeline points before destruction or move assignment.
    destroy :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "?destroy@UploadQueue@gpu@@QEAAXXZ";

    // Sources are copied immediately. Staging and batch storage never grow; reuse waits for completion when needed.
    // Flush between overlapping transfer writes. Buffer copies follow copy_memory's requirements; large sources are split to fit.
    upload_buffer :: (this: *UploadQueue, destination: GpuRange, source: ByteSpan) -> void #cpp_method #foreign nographicsapiutility_uploads "?upload_buffer@UploadQueue@gpu@@QEAAXUGpuRange@2@UByteSpan@2@@Z";

    // Source covers one complete region, including pitch padding, and must fit capacity. The region follows copy_memory_to_texture's requirements.
    upload_texture :: (this: *UploadQueue, destination: *Texture, source: ByteSpan, copy: *TextureCopyDesc) -> void #cpp_method #foreign nographicsapiutility_uploads "?upload_texture@UploadQueue@gpu@@QEAAXPEAUTexture@2@UByteSpan@2@AEBUTextureCopyDesc@2@@Z";
    upload_texture :: (this: *UploadQueue, destination: *Texture, source: ByteSpan, copy: TextureCopyDesc) #no_context {
        upload_texture(this, destination, source, *copy);
    }

    // The device's per-command-buffer timestamp limit applies to each batch. Keep CPU destinations valid until the batch is reclaimed.
    write_timestamp :: (this: *UploadQueue, cpu_destination: *u64) -> void #cpp_method #foreign nographicsapiutility_uploads "?write_timestamp@UploadQueue@gpu@@QEAAXPEA_K@Z";

    // Returns the latest upload completion point, borrowing this uploader's semaphore. Other queues can consume it through SubmitDesc::waits.
    flush :: (this: *UploadQueue) -> TimelinePoint #cpp_method #foreign nographicsapiutility_uploads "?flush@UploadQueue@gpu@@QEAA?AUTimelinePoint@2@XZ";

    // Optional synchronous submission handoff. The callback must submit the batch exactly once before returning,
    // using the supplied queue and completion point. It must not access this uploader. Change only with exclusive ownership.
    SubmitCallback :: #type (_context: *void, device: *Device, commands: *CommandBuffer, completion: TimelinePoint, queue_index: u32) -> void #c_call;
    set_submit_callback :: (this: *UploadQueue, callback: SubmitCallback, _context: *void = null) -> void #cpp_method #foreign nographicsapiutility_uploads "?set_submit_callback@UploadQueue@gpu@@QEAAXP6AXPEAXPEAUDevice@2@PEAUCommandBuffer@2@UTimelinePoint@2@I@_E0@Z";
    wait :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "?wait@UploadQueue@gpu@@QEAAXXZ";

    // Retrieves timestamps and reclaims completed batches without waiting or flushing pending uploads. wait() also reclaims all batches.
    reclaim :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "?reclaim@UploadQueue@gpu@@QEAAXXZ";

    // Occupied bytes and pending batches reflect retirements observed by the most recent operation.
    stats :: (this: *UploadQueue) -> UploadQueueStats #cpp_method #foreign nographicsapiutility_uploads "?stats@UploadQueue@gpu@@QEBA?AUUploadQueueStats@2@XZ";

    Batch :: struct {
        pool:  *CommandPool = null;
        end:   u64 = 0;
        value: u64 = 0;
    }

    State :: struct {
        device:              *Device = null;
        heap:                GpuHeap;
        completion:          TimelinePoint;
        commands:            *CommandBuffer = null;
        head:                u64 = 0;
        tail:                u64 = 0;
        batches:             *Batch = null;
        max_pending_batches: u32 = 0;
        queue_index:         u32 = 0;
        upload_stages:       Stage = .TRANSFER;
        upload_access:       Access;
        queue_access:        Access;
        texture_granularity: u32x3;
        retirement_first:    u32 = 0;
        retirement_count:    u32 = 0;
        operation_count:     u32 = 0;
        in_callback          := false;
        submissions:         u64 = 0;
        waits:               u64 = 0;
        peak_bytes:          u64 = 0;
        submit_callback:     SubmitCallback = null;
        submit_context:      *void = null;
    }

    begin :: (this: *UploadQueue) -> *CommandBuffer #cpp_method #foreign nographicsapiutility_uploads "?begin@UploadQueue@gpu@@AEAAPEAUCommandBuffer@2@XZ";
    wait_oldest :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "?wait_oldest@UploadQueue@gpu@@AEAAXXZ";
    reserve :: (this: *UploadQueue, byte_size: u64) -> GpuCpuRange(u8) #cpp_method #foreign nographicsapiutility_uploads "?reserve@UploadQueue@gpu@@AEAA?AU?$GpuCpuRange@E@2@_K@Z";
    begin_compute :: (this: *UploadQueue, byte_size: u64) -> GpuCpuRange(u8) #cpp_method #foreign nographicsapiutility_uploads "?begin_compute@UploadQueue@gpu@@AEAA?AU?$GpuCpuRange@E@2@_K@Z";
    end_compute :: (this: *UploadQueue) -> void #cpp_method #foreign nographicsapiutility_uploads "?end_compute@UploadQueue@gpu@@AEAAXXZ";

    state_:          State;
}

// Description must match the destination. Source contains the tightly packed region; pitches must be zero.
// Combined depth/stencil formats are unsupported. Splits respect the selected queue's texture granularity;
// staging must fit at least one granularity-sized block (clipped at the mip edge).
upload_texture :: (queue: *UploadQueue, destination: *Texture, description: *TextureDesc, source: ByteSpan, copy: *TextureCopyDesc) -> void #foreign nographicsapiutility_uploads "?upload_texture@gpu@@YAXAEAVUploadQueue@1@PEAUTexture@1@AEBUTextureDesc@1@UByteSpan@1@AEBUTextureCopyDesc@1@@Z";
upload_texture :: (queue: *UploadQueue, destination: *Texture, description: TextureDesc, source: ByteSpan, copy: TextureCopyDesc) #no_context {
    upload_texture(queue, destination, *description, source, *copy);
}

#scope_file

#if DEBUG {
    nographicsapi :: #library,no_dll "Debug/NoGraphicsAPI";
    nographicsapiutility_uploads :: #library,no_dll "Debug/NoGraphicsAPIUtility_uploads";
    nographicsapiutility_allocators :: #library,no_dll "Debug/NoGraphicsAPIUtility_allocators";
    nographicsapiutility_textures :: #library,no_dll "Debug/NoGraphicsAPIUtility_textures";
} else {
    nographicsapi :: #library,no_dll "Release/NoGraphicsAPI";
    nographicsapiutility_uploads :: #library,no_dll "Release/NoGraphicsAPIUtility_uploads";
    nographicsapiutility_allocators :: #library,no_dll "Release/NoGraphicsAPIUtility_allocators";
    nographicsapiutility_textures :: #library,no_dll "Release/NoGraphicsAPIUtility_textures";
}
