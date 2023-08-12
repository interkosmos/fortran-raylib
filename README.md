# fortran-raylib

A work-in-progress collection of interface bindings to
[raylib](https://www.raylib.com/) 4.2, for 2-D and 3-D game programming in
Fortran 2018.

## Build Instructions

Simply run the provided Makefile:

```
$ make
```

You may have to overwrite the libraries to link (argument `LDLIBS`), depending
on you operating system.

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

Link the example against `libfortran-raylib.a`, `-lraylib`, and additional
platform-dependent libraries:

```
$ gfortran -L/usr/local/lib -I/usr/local/include -o example example.f90 \
  libfortran-raylib.a -lraylib -lGL -lpthread -lm
$ ./example
```

## Further Examples

More examples can be found in `examples/`:

* **camera** renders a cube in 3-D.
* **flags** shows window flags.
* **keys** demonstrates keyboard input.
* **window** opens a window with raylib.

Build all examples with:

```
$ make examples
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
* If a function returns `c_ptr`, the result has to be converted to a Fortran
  pointer with the intrinsic subroutine `c_f_pointer()` first. C char pointers
  may be converted with utility subroutine `c_f_str_ptr()` from module
  `raylib_util`.

## Licence

ISC
