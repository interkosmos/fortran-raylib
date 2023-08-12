! window.f90
!
! Example program to create a window. Based on the raylib example
! `core_basic_window.c`.
!
! Author:  Philipp Engel
! Licence: ISC
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
            call draw_text('Congrats! You created your first window!' // c_null_char, 190, 200, 20, LIGHTGRAY)
        call end_drawing()
    end do

    call close_window()
end program main
