#module_parameters (DEBUG := false);

read_entire_file :: (name: string, zero_terminated := false, log_errors := true) -> ByteSpan, bool {
    file, ok := File.read_entire_file(name, zero_terminated, log_errors);

    if !ok return .{}, ok;

    return .{ data = xx file.data, size = xx file.count }, ok;
}

read_entire_file :: (path: string, dest: *void, max_bytes_to_read: s64) -> bool, u64 {
    file, success := File.file_open(path, for_writing=false);
    if !success return false, 0;
    defer File.file_close(*file);

    actual_bytes_read: s64;
    success, actual_bytes_read = File.file_read(file, dest, max_bytes_to_read);
    return success, xx actual_bytes_read;
}

array_to_span :: inline (a: [] $T) -> Span(T) {
    return .{
        data = a.data,
        size = xx a.count,
    };
}

to_span :: inline (s: $T) -> Span(T) {
    // Is this too conservative?
    #assert(type_info(T).*.type == .STRUCT || type_info(T).*.type == .POINTER);
    return array_to_span(T.[s]);
}

create_texture_allocator :: (device: *Device, heap: TextureHeap, max_textures: u32) -> TextureAllocator {
    texture_allocator: TextureAllocator;
    texture_allocator.device_ = device;

    TextureAllocator.Constructor(*texture_allocator, device, heap, max_textures);

    return texture_allocator;
}

create_bump_allocator :: (storage: GpuCpuRange(u8)) -> BumpAllocator {
    gpu_bump_allocator: BumpAllocator;
    BumpAllocator.Constructor(*gpu_bump_allocator, storage);
    assert_range_is_valid(gpu_bump_allocator.storage_);
    return gpu_bump_allocator;
}

reset_bump_allocator :: inline (bump_allocator: *BumpAllocator) {
    BumpAllocator.reset(bump_allocator);
}

assert_range_is_valid :: inline (range: GpuCpuRange($T)) {
    assert(range.size > 0 && range.cpu != null && range.gpu != null, "Invalid GpuCpuRange: %", range);
}

gpu_alloc :: (bump_allocator: *BumpAllocator, size: u64) -> GpuCpuRange(u8) {
    result := BumpAllocator.allocate(bump_allocator, size);
    assert_range_is_valid(result);
    return result;
}

#if OS == .LINUX {
    #load "linux/linux.jai";
} else #if OS == .WINDOWS {
    #load "windows/windows.jai";
} else #if OS == .MACOS {
    #load "macos/macos.jai";
} else {
    #assert false, "unsupported OS";
}
#import "Basic";
File :: #import "File";
