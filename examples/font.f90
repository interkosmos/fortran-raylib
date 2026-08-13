! Author:  Philipp Engel
! Licence: ISC
program main
    !! Example program that demonstrates bitmap font rendering. Based on the
    !! raylib example `text_raylib_fonts.c`.
    use :: raylib
    use :: raylib_util
    implicit none (type, external)

    integer, parameter :: MAX_FONTS     = 8
    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer            :: i
    integer            :: spacings(MAX_FONTS)
    character(72)      :: messages(MAX_FONTS)
    type(color_type)   :: colors(MAX_FONTS)
    type(font_type)    :: fonts(MAX_FONTS)
    type(vector2_type) :: positions(MAX_FONTS)
    type(vector2_type) :: v2

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, f_c_str('Fortran + raylib'))
    call set_target_fps(60)

    fonts = [ &
        load_font(f_c_str('share/fonts/alagard.png')), &
        load_font(f_c_str('share/fonts/pixelplay.png')), &
        load_font(f_c_str('share/fonts/mecha.png')), &
        load_font(f_c_str('share/fonts/setback.png')), &
        load_font(f_c_str('share/fonts/romulus.png')), &
        load_font(f_c_str('share/fonts/pixantiqua.png')), &
        load_font(f_c_str('share/fonts/alpha_beta.png')), &
        load_font(f_c_str('share/fonts/jupiter_crash.png')) &
    ]

    messages = [ character(72) :: &
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
        v2 = measure_text_ex(fonts(i), f_c_str(messages(i)), fonts(i)%base_size * 2.0, real(spacings(i)))

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

            call draw_text(f_c_str('free fonts included with raylib'), 250, 20, 20, DARKGRAY)
            call draw_line(220, 50, 590, 50, DARKGRAY)

            do i = 1, MAX_FONTS
                call draw_text_ex(fonts(i), &
                                  f_c_str(messages(i)), &
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
