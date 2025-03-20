# fortran-raylib

A work-in-progress collection of interface bindings to
[raylib](https://www.raylib.com/) 5.5, for 2-D and 3-D game programming in
Fortran 2018. The library has been tested with GNU Fortran 14 and Flang 20.

## Build Instructions

Install the raylib package suitable for your operating system, or build from
[source](https://github.com/raysan5/raylib/releases/tag/5.5):

```
$ cd raylib-5.5/
$ mkdir build && cd build/
$ cmake ..
$ make PLATFORM=PLATFORM_DESKTOP
$ make install
```
Select platform `PLATFORM_DESKTOP_SDL` for the SDL 2.0 back-end:

```
$ make PLATFORM=PLATFORM_DESKTOP_SDL
```

### Make

Build the *fortran-raylib* library with GNU Fortran by executing the provided
Makefile:

```
$ git clone --depth 1 https://github.com/interkosmos/fortran-raylib
$ cd fortran-raylib/
$ make
```

Or, to compile with Flang:

```
$ make FC=flang20
```

Pass argument `RAYLIB` to override the raylib library to link. For example, if
the static library `libraylib.a` is in the same directory:

```
$ make RAYLIB=libraylib.a
```

You may have to set the libraries to link manually (argument `LDLIBS`),
depending on your operating system.


### Fortran Package Manager

Building the library and all examples with *fpm*:

```
$ fpm build --profile release
```

Alternatively, you can add *fortran-raylib* as a dependency to the `fpm.toml` of
your project:

```toml
[dependencies]
fortran-raylib = { git = "https://github.com/interkosmos/fortran-raylib.git" }
```

### Linking

Link your Fortran application against `libfortran-raylib.a`, `-lraylib`, and
additional platform-dependent libraries:

| System          | Linker Libraries                                                                                         |
|-----------------|----------------------------------------------------------------------------------------------------------|
| FreeBSD         | `-lraylib -lglfw -lGL -lpthread -lm`                                                                     |
| Linux           | `-lraylib -lGL -lm -lpthread -ldl -lrt -lX11`                                                            |
| Linux (Wayland) | `-lraylib -lGL -lm -lpthread -ldl -lrt -lwayland-client -lwayland-cursor -lwayland-egl -lxkbcommon`      |
| macOS           | `-lraylib -framework OpenGL -framework Cocoa -framework IOKit -framework CoreAudio -framework CoreVideo` |
| Raspberry Pi    | `-lraylib -lbrcmGLESv2 -lbrcmEGL -lpthread -lrt -lm -lbcm_host -ldl -latomic`                            |
| Windows         | `-lraylib -lopengl32 -lgdi32 -lwinmm`                                                                    |

## Example

The following example program opens a window and draws some text.

```fortran
! example.f90
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)
            call draw_text('Hello, World!' // c_null_char, 190, 200, 20, LIGHTGRAY)
        call end_drawing()
    end do

    call close_window()
end program main
```

Compile and link the example program:

```
$ gfortran -L/usr/local/lib -o example example.f90 libfortran-raylib.a -lraylib -lGL -lpthread -lm
$ ./example
```

Depending on the build flags chosen for *raylib*, you may have to link with
`-lglfw` additionally.

## Further Examples

More examples can be found in `examples/`:

* **bunny** is a bunny benchmark.
* **camera** renders a cube in 3-D.
* **camera3d** renders a 3-D scene, with keyboard and mouse controls.
* **castle** renders a 3-D model loaded from file.
* **collision** shows 2-D collision detection.
* **cubes** renders waving cubes.
* **explosion** renders sprites and plays sound.
* **flags** shows window flags.
* **geometric** renders basic geometric shapes.
* **font** displays text using bitmap fonts.
* **julia** renders animated Julia set (via GLSL shader).
* **keys** demonstrates keyboard input.
* **log** adds a custom logging routine.
* **map** renders a height map.
* **maze** renders a 3-D maze in first-person view.
* **mesh** demonstrates mesh instancing.
* **plane** demonstrates pitch/yaw/roll of a 3-D model.
* **shapes** renders basic shapes.
* **ship** rotates a 3-D model loaded from file.
* **window** opens a window with raylib.

Build all examples with:

```
$ make examples
```

To link against a static raylib library, run:

```
$ make examples RAYLIB=libraylib.a
```

## Compatibility

Some issues have to be regarded when calling raylib from Fortran:

* Loading models in Wavefront OBJ format is broken since raylib 5.0
  ([issue](https://github.com/raysan5/raylib/issues/3576)).
* All procedure names and dummy arguments have been converted to snake case.
* Make sure to properly null-terminate all character strings passed to raylib
  with `c_null_char` from module `iso_c_binding` or simply `achar(0)`.
* Some variadic C functions of raylib are not bound by the interface library,
  like `TextFormat()`. In this particular case, just use the Fortran `write`
  statement instead.
* If a function returns `type(c_ptr)`, the result has to be converted to a
  Fortran pointer with the intrinsic subroutine `c_f_pointer()` first. C char
  pointers may be converted with utility subroutine `c_f_str_ptr()` from module
  `raylib_util`, or the intrinsic `c_f_strpointer()` (Fortran 2023).

## Licence

ISC
