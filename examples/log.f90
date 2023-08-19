! log.f90
!
! Example program that adds a custom log routine. Based on the raylib example
! `core_custom_logging.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    use :: raylib_util
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    call set_trace_log_callback(c_funloc(custom_log))
    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)
            call draw_text('Check out the console output to see the custom logger in action!' // c_null_char, &
                           60, 200, 20, LIGHTGRAY)
        call end_drawing()
    end do

    call close_window()
contains
    subroutine custom_log(type, text, args) bind(c)
        integer(kind=c_int), intent(in), value :: type
        type(c_ptr),         intent(in), value :: text
        type(c_ptr),         intent(in), value :: args

        character(len=:), allocatable :: str
        integer                       :: dt(8)

        call date_and_time(values=dt)

        write (*, '("[", i4, "-", i2.2, "-", i2.2, " ", 2(i2.2, ":"), i2.2, "] ")', advance='no') &
            dt(1:3), dt(5:7)

        call c_f_str_ptr(text, str)

        select case (type)
            case (LOG_INFO)
                print '("[INFO] ", a)', str
            case (LOG_ERROR)
                print '("[ERROR] ", a)', str
            case (LOG_WARNING)
                print '("[WARN] ", a)', str
            case (LOG_DEBUG)
                print '("[DEBUG] ", a)', str
        end select
    end subroutine custom_log
end program main
