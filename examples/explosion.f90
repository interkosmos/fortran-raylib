! explosion.f90
!
! Example program that renders a sprite explosion. Based on the raylib example
! `textures_sprite_explosion.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer, parameter :: NCOLS = 5
    integer, parameter :: NROWS = 5

    integer              :: frame, col, row
    logical              :: active
    real                 :: width, height
    type(sound_type)     :: boom
    type(rectangle_type) :: rectangle
    type(texture2d_type) :: explosion
    type(vector2_type)   :: position

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call init_audio_device()

    call set_target_fps(120)

    boom = load_sound('share/boom.wav' // c_null_char)
    explosion = load_texture('share/explosion.png' // c_null_char)

    width  = real(explosion%width / NCOLS)
    height = real(explosion%height / NROWS)

    col = 0
    row = 0

    rectangle = rectangle_type(0.0, 0.0, width, height)

    active = .false.
    frame = 0

    do while (.not. window_should_close())
        if (is_mouse_button_pressed(MOUSE_BUTTON_LEFT) .and. .not. active) then
            active = .true.
            call play_sound(boom)

            position = get_mouse_position()
            position%x = position%x - (width / 2.0)
            position%y = position%y - (height / 2.0)
        end if

        if (active) then
            frame = frame + 1

            if (frame > 2) then
                col = col + 1

                if (col >= NCOLS) then
                    col = 0
                    row = row + 1

                    if (row >= NROWS) then
                        row = 0
                        active = .false.
                    end if
                end if

                frame = 0
            end if
        end if

        rectangle%x = width * col
        rectangle%y = height * row

        call begin_drawing()
            call clear_background(RAYWHITE)

            if (active) then
                call draw_texture_rec(explosion, rectangle, position, WHITE)
            end if
        call end_drawing()
    end do

    call unload_texture(explosion)
    call unload_sound(boom)

    call close_audio_device()
    call close_window()
end program main
