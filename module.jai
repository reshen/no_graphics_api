#module_parameters (DEBUG := false);

read_entire_file :: (name: string, zero_terminated := false, log_errors := true) -> ByteSpan, bool {
    File :: #import "File";
    file, ok := File.read_entire_file(name, zero_terminated, log_errors);

    if !ok return .{}, ok;

    return .{ data = xx file.data, size = xx file.count }, ok;
}

array_to_span :: inline (a: [] $T) -> Span(T) {
    return .{
        data = a.data,
        size = xx a.count,
    };
}

to_span :: inline (s: $T) -> Span(T) {
    // Is this too conservative?
    #assert(type_info(T).*.type == .STRUCT || 
            type_info(T).*.type == .POINTER);

    return array_to_span(T.[s]);
}

#if OS == .LINUX {
    #load "linux/linux.jai";
} else #if OS == .WINDOWS {
    #load "windows/windows.jai";
} else {
    #assert false, "unsupported OS";
}
#import "Basic";
