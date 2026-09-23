# NoGraphicsAPI

This repository contains Jai bindings for [Sebastian Aaltonen](https://github.com/sebbbi)'s [NoGraphicsAPI](https://github.com/sebbbi/NoGraphicsAPI) library.

## Usage

Include this repository in your modules, run `jai generate`, which will both build the
NoGraphicsAPI native library and generate jai bindings. This module contains a DEBUG
parameter that can be used to switch between Debug and Release builds.

## Useful references

- [Sebastian Aaltonen](https://github.com/sebbbi)'s [NoGraphicsAPI](https://github.com/sebbbi/NoGraphicsAPI) library
- [sgpu](https://github.com/roeyb1/sgpu) - a native jai implementation of Sebastian's work, created by [Roey Borsteinas](https://github.com/roeyb1)
- [jai-on-linux](https://github.com/valignatev/jai-on-linux/tree/master) - Quality of life things to make writing jai programs for linux easier.
  Of particular interest is the XCB work, e.g., [xcb_simple.jai](https://github.com/valignatev/jai-on-linux/blob/master/examples/xcb_simple.jai),
  which exposes the necessary X11 windowing data/APIs that can be provided to NoGraphicsAPI.

## License

This repository, NoGraphicsAPI, and NoGraphicsAPIUtility use the [MIT License](LICENSE).
Transitive dependencies use other licenses, see those dependencies for details.
