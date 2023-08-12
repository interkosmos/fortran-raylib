! keys.f90
!
! Example program to test keyboard input. Based on the raylib example
! `core_input_keys.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    type(vector2_type) :: ball_pos

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    ball_pos = vector2_type(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)

    do while (.not. window_should_close())
        if (is_key_down(KEY_RIGHT)) ball_pos%x = ball_pos%x + 2.0
        if (is_key_down(KEY_LEFT))  ball_pos%x = ball_pos%x - 2.0
        if (is_key_down(KEY_UP))    ball_pos%y = ball_pos%y - 2.0
        if (is_key_down(KEY_DOWN))  ball_pos%y = ball_pos%y + 2.0

        call begin_drawing()
            call clear_background(RAYWHITE)
            call draw_text('move the ball with the arrow keys' // c_null_char, 10, 10, 20, LIGHTGRAY)
            call draw_circle_v(ball_pos, 50.0, MAROON)
        call end_drawing()
    end do

    call close_window()
end program main
