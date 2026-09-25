# NoGraphicsAPI

This repository contains Jai bindings for [Sebastian Aaltonen](https://github.com/sebbbi)'s [NoGraphicsAPI](https://github.com/sebbbi/NoGraphicsAPI) library.

## Usage

Include this repository in your modules, make sure to update git submodules so the
NoGraphicsAPI repo is fetched, run `jai generate`, which will both build the
NoGraphicsAPI native library and generate jai bindings. This module contains a
DEBUG parameter that can be used to switch between Debug and Release builds.

## Examples

At this time, Linux (uses X11 via XCB thanks to [jai-on-linux](https://github.com/valignatev/jai-on-linux/tree/master)) and Windows are working.
Validated on Fedora 44 and Windows 11 using LunarG's VulkanSDK 1.4.357.0.

1. Ensure your system has vulkan installed, see https://vulkan.lunarg.com/sdk/home
2. Ensure your system has std c++ libraries installed, e.g., `libstdc++` on fedora
3. Navigate into the `examples/` subdir, run `jai build.jai - -run`. This will compile and
   launch a triangle example.

## Future improvements / TODO

- Support wayland. This requires updates to NoGraphicsAPI (briefly discussed in [NoGraphicsAPI/issues/9](https://github.com/sebbbi/NoGraphicsAPI/issues/9))
  and an example of our own built on jai wayland example in [jai-on-linux](https://github.com/valignatev/jai-on-linux/tree/master).
- Add utilities to assist in compiling slang to spirv, we can likely reuse sgpu's [shader_compiler.jai](https://github.com/roeyb1/sgpu/blob/main/shader_compiler.jai)
- There may be an opportunity to improve the ergonomics of using NoGraphicsAPI in jai, e.g.,
  `Span`s feel a bit annoying to use - we ought to be able to automatically calculate size at compile time
  and make the enclosed type (what you really care about) the thing you're immediately expressing. 
  Maybe this is just as simple as a `to_span` helper?
- It'd be nice if NoGraphicsAPI provided an API to pass in/use custom allocators, i.e.,
  enable jai memory debugging and get proper insights into runtime consumption


## Useful references

- [Sebastian Aaltonen](https://github.com/sebbbi)'s [NoGraphicsAPI](https://github.com/sebbbi/NoGraphicsAPI) library
- [sgpu](https://github.com/roeyb1/sgpu) - a native jai implementation of Sebastian's work, created by [Roey Borsteinas](https://github.com/roeyb1)
- [jai-on-linux](https://github.com/valignatev/jai-on-linux/tree/master) - Quality of life things to make writing jai programs for linux easier.
  Of particular interest is the XCB work, e.g., [xcb_simple.jai](https://github.com/valignatev/jai-on-linux/blob/master/examples/xcb_simple.jai),
  which exposes the necessary X11 windowing data/APIs that can be provided to NoGraphicsAPI.

## License

This repository, NoGraphicsAPI, NoGraphicsAPIUtility, and jai-on-linux use the [MIT License](LICENSE).
Transitive dependencies use other licenses, see those dependencies for details.
