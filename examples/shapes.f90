! shapes.f90
!
! Example program that renders basic shapes. Based on the raylib example
! `shapes_basic_shapes.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    real :: rotation

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    rotation = 0.0

    do while (.not. window_should_close())
        rotation = modulo(rotation + 0.2, 360.0)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call draw_text('some basic shapes available on raylib' // c_null_char, 20, 20, 20, DARKGRAY)

            ! Circle shapes and lines.
            call draw_circle(SCREEN_WIDTH / 5, 120, 35.0, DARKBLUE)
            call draw_circle_gradient(SCREEN_WIDTH / 5, 220, 60.0, GREEN, SKYBLUE)
            call draw_circle_lines(SCREEN_WIDTH / 5, 340, 80.0, DARKBLUE)

            ! Rectangle shapes and lines.
            call draw_rectangle(SCREEN_WIDTH / 4 * 2 - 60, 100, 120, 60, RED)
            call draw_rectangle_gradient_h(SCREEN_WIDTH / 4 * 2 - 90, 170, 180, 130, MAROON, GOLD)
            call draw_rectangle_lines(SCREEN_WIDTH / 4 * 2 - 40, 320, 80, 60, ORANGE)

            ! Triangle shapes and lines.
            call draw_triangle(vector2_type(SCREEN_WIDTH / 4.0 * 3.0, 80.0), &
                               vector2_type(SCREEN_WIDTH / 4.0 * 3.0 - 60.0, 150.0), &
                               vector2_type(SCREEN_WIDTH / 4.0 * 3.0 + 60.0, 150.0), VIOLET)

            call draw_triangle_lines(vector2_type(SCREEN_WIDTH / 4.0 * 3.0, 160.0), &
                                     vector2_type(SCREEN_WIDTH / 4.0 * 3.0 - 20.0, 230.0), &
                                     vector2_type(SCREEN_WIDTH / 4.0 * 3.0 + 20.0, 230.0), DARKBLUE)

            ! Polygon shapes and lines.
            call draw_poly(vector2_type(SCREEN_WIDTH / 4.0 * 3, 330.0), 6, 80.0, rotation, BROWN)
            call draw_poly_lines(vector2_type(SCREEN_WIDTH / 4.0 * 3, 330.0), 6, 90.0, rotation, BROWN)
            call draw_poly_lines_ex(vector2_type(SCREEN_WIDTH / 4.0 * 3, 330.0), 6, 85.0, rotation, 6.0, BEIGE)

            ! NOTE: We draw all lines based shapes together to optimise
            ! internal drawing, this way, all lines are rendered in a single
            ! draw pass.
            call draw_line(18, 42, SCREEN_WIDTH - 18, 42, BLACK)
        call end_drawing()
    end do

    call close_window()
end program main
