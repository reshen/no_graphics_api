#module_parameters (DEBUG := false);

#if OS == .LINUX {
    #load "linux/linux.jai";
} else #if OS == .WINDOWS {
    #load "windows/windows.jai";
} else {
    #assert false, "unsupported OS";
}
