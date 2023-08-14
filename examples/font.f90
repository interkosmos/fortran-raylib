! font.f90
!
! Example program that demonstrates bitmap font rendering. Based on the raylib
! example `text_raylib_fonts.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)

    integer, parameter :: MAX_FONTS     = 8
    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer            :: i
    integer            :: spacings(MAX_FONTS)
    character(len=72)  :: messages(MAX_FONTS)
    type(color_type)   :: colors(MAX_FONTS)
    type(font_type)    :: fonts(MAX_FONTS)
    type(vector2_type) :: positions(MAX_FONTS)
    type(vector2_type) :: v2

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    fonts = [ &
        load_font('share/fonts/alagard.png' // c_null_char), &
        load_font('share/fonts/pixelplay.png' // c_null_char), &
        load_font('share/fonts/mecha.png' // c_null_char), &
        load_font('share/fonts/setback.png' // c_null_char), &
        load_font('share/fonts/romulus.png' // c_null_char), &
        load_font('share/fonts/pixantiqua.png' // c_null_char), &
        load_font('share/fonts/alpha_beta.png' // c_null_char), &
        load_font('share/fonts/jupiter_crash.png' // c_null_char) &
    ]

    messages = [ character(len=72) :: &
        'ALAGARD FONT designed by Hewett Tsoi', &
        'PIXELPLAY FONT designed by Aleksander Shevchuk', &
        'MECHA FONT designed by Captain Falcon', &
        'SETBACK FONT designed by Brian Kent (AEnigma)', &
        'ROMULUS FONT designed by Hewett Tsoi', &
        'PIXANTIQUA FONT designed by Gerhard Grossmann', &
        'ALPHA_BETA FONT designed by Brian Kent (AEnigma)', &
        'JUPITER_CRASH FONT designed by Brian Kent (AEnigma)' &
    ]

    spacings = [ 2, 4, 8, 4, 3, 4, 4, 1 ]

    do i = 1, MAX_FONTS
        v2 = measure_text_ex(fonts(i), trim(messages(i)) // c_null_char, fonts(i)%base_size * 2.0, real(spacings(i)))

        positions(i)%x = SCREEN_WIDTH / 2.0 - v2%x / 2.0
        positions(i)%y = 60.0 + fonts(i)%base_size + 45.0 * (i - 1)
    end do

    ! Small Y position corrections.
    positions(4)%y = positions(4)%y + 8
    positions(5)%y = positions(5)%y + 2
    positions(8)%y = positions(8)%y - 8

    colors = [ MAROON, ORANGE, DARKGREEN, DARKBLUE, DARKPURPLE, LIME, GOLD, RED ]

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)

            call draw_text('free fonts included with raylib' // c_null_char, 250, 20, 20, DARKGRAY)
            call draw_line(220, 50, 590, 50, DARKGRAY)

            do i = 1, MAX_FONTS
                call draw_text_ex(fonts(i), &
                                  trim(messages(i)) // c_null_char, &
                                  positions(i), &
                                  fonts(i)%base_size * 2.0, &
                                  real(spacings(i)), &
                                  colors(i))
            end do
        call end_drawing()
    end do

    do i = 1, MAX_FONTS
        call unload_font(fonts(i))
    end do

    call close_window()
end program main
