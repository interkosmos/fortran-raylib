! Author:  Philipp Engel
! Licence: ISC
program main
    !! Example program to create a window. Based on the raylib example
    !! `core_basic_window.c`.
    use :: raylib
    use :: raylib_util
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, f_c_str('Fortran + raylib'))
    call set_target_fps(60)

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)
            call draw_text(f_c_str('Congrats! You created your first window!'), 190, 200, 20, LIGHTGRAY)
        call end_drawing()
    end do

    call close_window()
end program main
