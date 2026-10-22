// This example works on windows, macos, and linux (x11)
WIDTH :: 640;
HEIGHT :: 480;

DEFAULT_MSAA :: 1;
COLOR_FORMAT :: Format.BGRA8_SRGB;

UP_AXIS :: Vector3.{0, 1, 0};

// The @ShaderShared note and associated supporting build.jai code was copied (with permission) from https://github.com/wrapperup/cool-engine-jai/blob/ae7d0122c8d66ff41f274cab366ca98370f00c16/build.jai
// thanks to vivian (https://github.com/wrapperup). This enables single definition of structs used both in
// cpu and gpu (shader) code. Our build system then generates a slang header (./generated_cube.slang),
// which is pulled in by the actual shader (./cube.slang)
CubeVertex :: struct @ShaderShared {
    position: Vector4;
    uv: Vector2;
};

CubeRootArguments :: struct @ShaderShared {
    vertices: *CubeVertex;
    transform: Matrix4;
};

main :: () {
    defer assert_no_memory_leaks();

    platform_window, device_desc := create_window_and_device("cube");

    device_init: DeviceInit = create_device(*device_desc);
    device: *Device = device_init.device;
    defer destroy_device(device);
    assert(device_init.error == .NONE, "err: %", device_init.error);
    assert(device != null);
    print("created gpu device, name: %\n", to_string(get_device_caps(device).device_name));

    vertex_shader_file :: #run add_shader_file_platform_ext("cube.vert");
    fragment_shader_file :: #run add_shader_file_platform_ext("cube.frag");

    ok: bool;
    vertex_spirv: ByteSpan;
    vertex_spirv, ok = read_entire_file(vertex_shader_file);
    defer free(vertex_spirv.data);
    assert(ok);

    fragment_spirv: ByteSpan;
    fragment_spirv, ok = read_entire_file(fragment_shader_file);
    defer free(fragment_spirv.data);
    assert(ok);

    pso: *PSO = create_graphics_pso(device, GraphicsPSODesc.{
        vertex = ShaderStage.{
            code = vertex_spirv,
            entry_point = "vertexMain",
        },
        fragment = ShaderStage.{
            code = fragment_spirv,
            entry_point = "fragmentMain",
        },
        color_targets = to_span(ColorTargetDesc.{ format = COLOR_FORMAT }),
        depth_format = Format.D32_FLOAT,
        rasterization = RasterizationState.{
            cull = CullMode.CLOCKWISE,
        },
    });
    defer destroy_pso(pso);
    assert(pso != null);

    cube_vertices :: CubeVertex.[
        .{ position = .{ x = -1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },
        .{ position = .{ x = -1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },
        .{ position = .{ x = -1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = -1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },

        .{ position = .{ x = -1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },
        .{ position = .{ x = -1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },

        .{ position = .{ x = -1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },
        .{ position = .{ x = -1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },

        .{ position = .{ x = -1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = -1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },
        .{ position = .{ x = 1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },

        .{ position = .{ x = 1.0, y = 1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = -1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },

        .{ position = .{ x = -1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 1.0 } },
        .{ position = .{ x = 1.0, y = -1.0, z = 1.0, w = 1.0 }, uv = .{ x = 1.0, y = 1.0 } },
        .{ position = .{ x = 1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 1.0, y = 0.0 } },
        .{ position = .{ x = -1.0, y = 1.0, z = 1.0, w = 1.0 }, uv = .{ x = 0.0, y = 0.0 } },
    ];

    cube_indices :: u16.[
        0, 1, 2, 2, 3, 0,
        4, 5, 6, 6, 7, 4,
        8, 9, 10, 10, 11, 8,
        12, 13, 14, 14, 15, 12,
        16, 17, 18, 18, 19, 16,
        20, 21, 22, 22, 23, 20,
    ];


    texture_width: u32 = 256;
    texture_height: u32 = 256;
    texture_heap_size :: 256 * 1024 * 1024;
    radians_per_frame: float = 0.5 * PI / 180.0;

    DATA_HEAP_SIZE :: 1024 * 1024;
    data_heap: GpuHeap = create_gpu_heap(device, DATA_HEAP_SIZE);
    defer destroy_gpu_heap(data_heap);
    data_allocator: BumpAllocator = create_bump_allocator(data_heap.range);
    frame_ranges := BumpAllocator.[create_bump_allocator(BumpAllocator.allocate(*data_allocator, 4096)), create_bump_allocator(BumpAllocator.allocate(*data_allocator, 4096))];
    vertex_allocation: GpuCpuRange(u8) = BumpAllocator.allocate(*data_allocator, size_of(type_of(cube_vertices)));
    index_allocation: GpuCpuRange(u8) = BumpAllocator.allocate(*data_allocator, size_of(type_of(cube_indices)));
    memcpy(vertex_allocation.cpu, cube_vertices.data, size_of(type_of(cube_vertices)));
    memcpy(index_allocation.cpu, cube_indices.data, size_of(type_of(cube_indices)));

    texture_data:, ok = read_entire_file("lunarg_logo_256x256.rgba8");
    defer free(texture_data.data);
    assert(ok);
    upload_allocation: GpuCpuRange(u8) = BumpAllocator.allocate(*data_allocator, texture_data.size);
    memcpy(upload_allocation.cpu, texture_data.data, xx texture_data.size);

    uploads: UploadQueue;
    UploadQueue.Constructor(*uploads, device, texture_data.size);

    texture_descriptor_heap: *TextureDescriptorHeap = create_texture_descriptor_heap(device, 1);
    defer destroy_texture_descriptor_heap(texture_descriptor_heap);
    sampler_descriptor_heap: *SamplerDescriptorHeap = create_sampler_descriptor_heap(device, 1);
    defer destroy_sampler_descriptor_heap(sampler_descriptor_heap);
    texture_heap: TextureHeap = create_texture_heap(device, texture_heap_size);
    defer destroy_texture_heap(texture_heap);
    texture_allocator: TextureAllocator;
    TextureAllocator.Constructor(*texture_allocator, device, texture_heap, max_textures = 16);

    latest_completion := TimelinePoint.{ semaphore = create_timeline_semaphore(device) };
    defer destroy_timeline_semaphore(latest_completion.semaphore);

    command_pools: []*CommandPool = .[create_command_pool(device), create_command_pool(device)];
    defer for command_pools { destroy_command_pool(it); }

    texture_commands: *CommandBuffer = begin_commands(command_pools[0]);

    // Textures
    texture: PlacedTexture = TextureAllocator.allocate(*texture_allocator, texture_commands, .{
        extent = .{texture_width, texture_height, 1},
        format = Format.RGBA8_SRGB,
        usage = TextureUsage.SAMPLED | TextureUsage.TRANSFER_DESTINATION,
    });

    write_texture_descriptor(texture_descriptor_heap, 0, texture.texture, TextureDescriptorType.sampled, TextureDescriptorDesc.{});
    write_sampler_descriptor(sampler_descriptor_heap, 0, .{
        min_filter = Filter.NEAREST,
        mag_filter = Filter.NEAREST,
        address_u = AddressMode.CLAMP_TO_EDGE,
        address_v = AddressMode.CLAMP_TO_EDGE,
    });
    end_commands(texture_commands);
    latest_completion.value += 1;

    submit(device, SubmitDesc.{commands = to_span(texture_commands), completion = latest_completion});
    UploadQueue.upload_texture(*uploads, texture.texture, ByteSpan.{upload_allocation.cpu, texture_data.size},
        TextureCopyDesc.{});
    UploadQueue.wait(*uploads);
    UploadQueue.destroy(*uploads);

    depth: PlacedTexture;
    depth_render_view: *RenderView;
    depth_extent: u32x2;
    frame_index: u64 = 0;
    viewpoint := Vector3.{0, 3, 5};
    look_at: Vector3;
    view: Matrix4 = make_look_at_matrix(viewpoint, look_at, UP_AXIS, x_is_forward = false);

    quit:= false;
    while !quit {
        quit = quit_event_received(platform_window);

        if (latest_completion.value >= 2) {
            wait_timeline(.{
                semaphore = latest_completion.semaphore,
                value = latest_completion.value - 1
            });
        }

        frame_data: BumpAllocator = frame_ranges[latest_completion.value % 2];
        command_pool: *CommandPool = command_pools[latest_completion.value % 2];
        reset_command_pool(command_pool);
        commands: *CommandBuffer = begin_commands(command_pool);

        frame := acquire(commands);
        if !frame.render_view  continue;

        // Handle initial window size and subsequent window resizes
        if (frame.extent.x != depth_extent.x || frame.extent.y != depth_extent.y)
        {
            if (depth.texture) wait_timeline(latest_completion);
            destroy_render_view(depth_render_view);
            TextureAllocator.free(*texture_allocator, *depth);
            depth = TextureAllocator.allocate(*texture_allocator, commands, {
                extent = .{ frame.extent.x, frame.extent.y, 1},
                format = Format.D32_FLOAT,
                usage = TextureUsage.DEPTH_STENCIL_ATTACHMENT,
            });
            depth_render_view = create_render_view(depth.texture, RenderViewDesc.{});
            depth_extent = frame.extent;
        }

        set_texture_descriptor_heap(commands, texture_descriptor_heap);
        set_sampler_descriptor_heap(commands, sampler_descriptor_heap);

        barrier(commands, 
            Stage.DEPTH_STENCIL_TESTS, Access.DEPTH_STENCIL_WRITE, 
            Stage.DEPTH_STENCIL_TESTS, Access.DEPTH_STENCIL_WRITE);

        render_desc := RenderingDesc.{
            colors = to_span(ColorAttachment.{
                render_view = frame.render_view,
                load = LoadOp.CLEAR,
                clear = ClearColor.{0.2, 0.2, 0.2, 0.2},
            }),
            depth = .{
                render_view = depth_render_view,
                load = LoadOp.CLEAR,
                store = StoreOp.DISCARD,
            },
        };
        begin_render_pass(commands, *render_desc);

        set_depth_stencil(commands, DepthStencilState.{depth_test = true, depth_write = true});
        bind_pso(commands, pso);

        projection: Matrix4 = make_projection_matrix(45.0 * PI / 180.0, frame.extent.x.(float) / frame.extent.y.(float), 0.1, 100.0);
        projection.v[1].y = -projection.v[1].y;
        root: GpuCpuRange(u8) = BumpAllocator.allocate(*frame_data, size_of(CubeRootArguments));

        src_data := CubeRootArguments.{
            vertices = xx vertex_allocation.gpu,
            transform = projection * view * make_rotation_matrix(UP_AXIS, radians_per_frame * frame_index.(float)),
        };
        frame_index += 1;
        memcpy(root.cpu, *src_data, size_of(CubeRootArguments));

        draw_indexed(commands, root.gpu, gpu_range(GpuHeap.{index_allocation, null}), IndexType.U16, cube_indices.count);

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

    // Cleanup
    if (depth_render_view) destroy_render_view(depth_render_view);
    if (depth.texture) TextureAllocator.free(*texture_allocator, *depth);
    if (texture.texture) TextureAllocator.free(*texture_allocator, *texture);
}

assert_no_memory_leaks :: () {
    leak_count := make_leak_report().sorted_summaries.count;
    if (leak_count > 0) {
        log("\n\n**** Leak Report: ****\n");
        report_memory_leaks();
        debug_break();
    }
}

make_rotation_matrix :: inline (axis: Vector3, angle: float) -> Matrix4 {
    q: Quaternion = ---;
    set_from_axis_and_angle(*q, axis, angle);
    return rotation_matrix(Matrix4, q);
}

#import "Basic"()(MEMORY_DEBUGGER = true, ENABLE_ASSERT = true);
#import "String";
#import "Math";
#import,file "../module.jai"(DEBUG = true);
#load "platform.jai";
