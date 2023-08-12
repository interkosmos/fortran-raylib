! flags.f90
!
! Example program to test window flags. Based on the raylib example
! `core_window_flags.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    character(len=32)    :: str
    integer              :: nframes
    real                 :: ball_radius
    type(rectangle_type) :: rect
    type(vector2_type)   :: ball_pos
    type(vector2_type)   :: ball_speed

    ! Set configuration flags for window creation.
    ! call set_config_flags(FLAG_VSYNC_HINT + FLAG_MSAA_4X_HINT + FLAG_WINDOW_HIGHDPI)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call hide_cursor()

    ball_pos    = vector2_type(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)
    ball_speed  = vector2_type(5.0, 4.0)
    ball_radius = 20.0

    nframes = 0

    do while (.not. window_should_close())
        ! Update state.
        if (is_key_pressed(KEY_F)) call toggle_fullscreen()

        if (is_key_pressed(KEY_R)) then
            if (is_window_state(FLAG_WINDOW_RESIZABLE)) then
                call clear_window_state(FLAG_WINDOW_RESIZABLE)
            else
                call set_window_state(FLAG_WINDOW_RESIZABLE)
            end if
        end if

        if (is_key_pressed(KEY_D)) then
            if (is_window_state(FLAG_WINDOW_UNDECORATED)) then
                call clear_window_state(FLAG_WINDOW_UNDECORATED)
            else
                call set_window_state(FLAG_WINDOW_UNDECORATED)
            end if
        end if

        if (is_key_pressed(KEY_H)) then
            if (.not. is_window_state(FLAG_WINDOW_HIDDEN)) &
                call set_window_state(FLAG_WINDOW_HIDDEN)
            nframes = 0
        end if

        if (is_window_state(FLAG_WINDOW_HIDDEN)) then
            nframes = nframes + 1
            ! Show window after 3 seconds.
            if (nframes >= 240) call clear_window_state(FLAG_WINDOW_HIDDEN)
        end if

        if (is_key_pressed(KEY_N)) then
            if (.not. is_window_state(FLAG_WINDOW_MINIMIZED)) call minimize_window()
            nframes = 0
        end if

        if (is_window_state(FLAG_WINDOW_MINIMIZED)) then
            nframes = nframes + 1
            ! Restore window after 3 seconds.
            if (nframes >= 240) call restore_window()
        end if

        if (is_key_pressed(KEY_M)) then
            ! NOTE: Requires FLAG_WINDOW_RESIZABLE enabled!
            if (is_window_state(FLAG_WINDOW_MAXIMIZED)) then
                call restore_window()
            else
                call maximize_window()
            end if
        end if

        if (is_key_pressed(KEY_U)) then
            if (is_window_state(FLAG_WINDOW_UNFOCUSED)) then
                call clear_window_state(FLAG_WINDOW_UNFOCUSED)
            else
                call set_window_state(FLAG_WINDOW_UNFOCUSED)
            end if
        end if

        if (is_key_pressed(KEY_T)) then
            if (is_window_state(FLAG_WINDOW_TOPMOST)) then
                call clear_window_state(FLAG_WINDOW_TOPMOST)
            else
                call set_window_state(FLAG_WINDOW_TOPMOST)
            end if
        end if

        if (is_key_pressed(KEY_A)) then
            if (is_window_state(FLAG_WINDOW_ALWAYS_RUN)) then
                call clear_window_state(FLAG_WINDOW_ALWAYS_RUN)
            else
                call set_window_state(FLAG_WINDOW_ALWAYS_RUN)
            end if
        end if

        if (is_key_pressed(KEY_V)) then
            if (is_window_state(FLAG_VSYNC_HINT)) then
                call clear_window_state(FLAG_VSYNC_HINT)
            else
                call set_window_state(FLAG_VSYNC_HINT)
            end if
        end if

        ! Bouncing ball logic.
        ball_pos%x = ball_pos%x + ball_speed%x
        ball_pos%y = ball_pos%y + ball_speed%y

        if ((ball_pos%x >= (get_screen_width() - ball_radius)) .or. (ball_pos%x <= ball_radius)) &
            ball_speed%x = -1.0 * ball_speed%x

        if ((ball_pos%y >= (get_screen_height() - ball_radius)) .or. (ball_pos%y <= ball_radius)) &
            ball_speed%y = -1.0 * ball_speed%y

        ! Draw the scene.
        call begin_drawing()

        if (is_window_state(FLAG_WINDOW_TRANSPARENT)) then
            call clear_background(BLANK)
        else
            call clear_background(RAYWHITE)
        end if

        call draw_circle_v(ball_pos, ball_radius, MAROON)

        rect%width  = real(get_screen_width())
        rect%height = real(get_screen_height())

        call draw_rectangle_lines_ex(rect, 4.0, RAYWHITE)
        call draw_circle_v(get_mouse_position(), 10.0, DARKBLUE)
        call draw_fps(10, 10)

        write (str, '("Screen Size: [", i0, ", ", i0, "]")') get_screen_width(), get_screen_height()
        call draw_text(str // c_null_char, 10, 40, 10, GREEN)
        call draw_text('Following flags can be set after window creation:' // c_null_char, 10, 60, 10, GRAY)

        if (is_window_state(FLAG_FULLSCREEN_MODE)) then
            call draw_text('[F] FLAG_FULLSCREEN_MODE: on' // c_null_char, 10, 80, 10, LIME)
        else
            call draw_text('[F] FLAG_FULLSCREEN_MODE: off' // c_null_char, 10, 80, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_RESIZABLE)) then
            call draw_text('[R] FLAG_WINDOW_RESIZABLE: on' // c_null_char, 10, 100, 10, LIME)
        else
            call draw_text('[R] FLAG_WINDOW_RESIZABLE: off' // c_null_char, 10, 100, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_UNDECORATED)) then
            call draw_text('[D] FLAG_WINDOW_UNDECORATED: on' // c_null_char, 10, 120, 10, LIME)
        else
            call draw_text('[D] FLAG_WINDOW_UNDECORATED: off' // c_null_char, 10, 120, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_HIDDEN)) then
            call draw_text('[H] FLAG_WINDOW_HIDDEN: on' // c_null_char, 10, 140, 10, LIME)
        else
            call draw_text('[H] FLAG_WINDOW_HIDDEN: off' // c_null_char, 10, 140, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_MINIMIZED)) then
            call draw_text('[N] FLAG_WINDOW_MINIMIZED: on' // c_null_char, 10, 160, 10, LIME)
        else
            call draw_text('[N] FLAG_WINDOW_MINIMIZED: off' // c_null_char, 10, 160, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_MAXIMIZED)) then
            call draw_text('[M] FLAG_WINDOW_MAXIMIZED: on' // c_null_char, 10, 180, 10, LIME)
        else
            call draw_text('[M] FLAG_WINDOW_MAXIMIZED: off' // c_null_char, 10, 180, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_UNFOCUSED)) then
            call draw_text('[G] FLAG_WINDOW_UNFOCUSED: on' // c_null_char, 10, 200, 10, LIME)
        else
            call draw_text('[U] FLAG_WINDOW_UNFOCUSED: off' // c_null_char, 10, 200, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_TOPMOST)) then
            call draw_text('[T] FLAG_WINDOW_TOPMOST: on' // c_null_char, 10, 220, 10, LIME)
        else
            call draw_text('[T] FLAG_WINDOW_TOPMOST: off' // c_null_char, 10, 220, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_ALWAYS_RUN)) then
            call draw_text('[A] FLAG_WINDOW_ALWAYS_RUN: on' // c_null_char, 10, 240, 10, LIME)
        else
            call draw_text('[A] FLAG_WINDOW_ALWAYS_RUN: off' // c_null_char, 10, 240, 10, MAROON)
        end if

        if (is_window_state(FLAG_VSYNC_HINT)) then
            call draw_text('[V] FLAG_VSYNC_HINT: on' // c_null_char, 10, 260, 10, LIME)
        else
            call draw_text('[V] FLAG_VSYNC_HINT: off' // c_null_char, 10, 260, 10, MAROON)
        end if

        call draw_text('Following flags can only be set before window creation:' // c_null_char, 10, 300, 10, GRAY)

        if (is_window_state(FLAG_WINDOW_HIGHDPI)) then
            call draw_text('FLAG_WINDOW_HIGHDPI: on' // c_null_char, 10, 320, 10, LIME)
        else
            call draw_text('FLAG_WINDOW_HIGHDPI: off' // c_null_char, 10, 320, 10, MAROON)
        end if

        if (is_window_state(FLAG_WINDOW_TRANSPARENT)) then
            call draw_text('FLAG_WINDOW_TRANSPARENT: on' // c_null_char, 10, 340, 10, LIME)
        else
            call draw_text('FLAG_WINDOW_TRANSPARENT: off' // c_null_char, 10, 340, 10, MAROON)
        end if

        if (is_window_state(FLAG_MSAA_4X_HINT)) then
            call draw_text('FLAG_MSAA_4X_HINT: on' // c_null_char, 10, 360, 10, LIME)
        else
            call draw_text('FLAG_MSAA_4X_HINT: off' // c_null_char, 10, 360, 10, MAROON)
        end if

        call end_drawing()
    end do

    call close_window()
end program main
