# fortran-raylib

A work-in-progress collection of interface bindings to
[raylib](https://www.raylib.com/) 4.5, for 2-D and 3-D game programming in
Fortran 2018.

## Build Instructions

Install the raylib package suitable for your operating system, or build from
[source](https://github.com/raysan5/raylib/releases/tag/4.5.0):

```
$ cd raylib-4.5.0/
$ mkdir build && cd build/
$ cmake -DUSE_EXTERNAL_GLFW=ON ..
$ make
```

Build the *fortran-raylib* library by executing the provided Makefile:

```
$ git clone --depth 1 https://github.com/interkosmos/fortran-raylib
$ cd fortran-raylib/
$ make
```

You may have to overwrite the libraries to link (argument `LDLIBS`), depending
on you operating system.

Or, instead with *fpm*:

```
$ fpm build --profile release --flag "-fno-range-check"
```

Alternatively, you can add *fortran-raylib* as a dependency to the `fpm.toml` of
your project:

```toml
[dependencies]
fortran-raylib = { git = "https://github.com/interkosmos/fortran-raylib.git" }
```

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
$ gfortran -L/usr/local/lib -I/usr/local/include -o example example.f90 \
  libfortran-raylib.a -lraylib -lGL -lglfw -lpthread -lm
$ ./example
```

## Further Examples

More examples can be found in `examples/`:

* **camera** renders a cube in 3-D.
* **camera3d** renders a 3-D scene, with keyboard and mouse controls.
* **castle** renders a 3-D model loaded from file.
* **cubes** renders waving cubes.
* **flags** shows window flags.
* **font** displays text using bitmap fonts.
* **keys** demonstrates keyboard input.
* **map** renders a height map.
* **plane** demonstrates pitch/yaw/roll of a 3-D model.
* **truck** rotates a 3-D model loaded from file.
* **window** opens a window with raylib.

Build all examples with:

```
$ make examples
```

To link against the static raylib library, run:

```
$ make examples RAYLIB=libraylib.a
```

## Compatibility

Some issues have to be regarded when calling raylib from Fortran:

* All procedure names and dummy arguments have been converted to snake case.
* As Fortran does not feature unsigned data types, use the compiler flag
  `-fno-range-check` to allow signed values to be written into unsigned
  variables where necessary.
* Make sure to properly null-terminate all character strings passed to raylib
  with `c_null_char` from module `iso_c_binding` or simply `achar(0)`.
* Some variadic C functions of raylib are not bound by the interface library,
  like `TextFormat()`. In this particular case, just use the Fortran `write`
  statement instead.
* If a function returns `type(c_ptr)`, the result has to be converted to a
  Fortran pointer with the intrinsic subroutine `c_f_pointer()` first. C char
  pointers may be converted with utility subroutine `c_f_str_ptr()` from module
  `raylib_util`.

## Licence

ISC
