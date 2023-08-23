! bunny.f90
!
! Example program that renders thousands of textures (bunny benchmark). Based
! on the raylib example `textures_bunnymark.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450
    integer, parameter :: MAX_BUNNIES   = 50000

    type :: bunny_type
        type(vector2_type) :: position
        type(vector2_type) :: speed
        type(color_type)   :: color
    end type bunny_type

    character(len=32)    :: str
    integer              :: i, x, y
    integer              :: nbunnies
    type(texture2d_type) :: texture

    type(bunny_type), allocatable :: bunnies(:)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    texture = load_texture('share/wabbit.png' // c_null_char)

    allocate (bunnies(MAX_BUNNIES))
    nbunnies = 0

    do while (.not. window_should_close())
        if (is_mouse_button_down(MOUSE_BUTTON_LEFT)) then
            ! Create more bunnies.
            do i = 1, 100
                if (nbunnies >= MAX_BUNNIES) exit
                nbunnies = nbunnies + 1

                bunnies(nbunnies)%position = get_mouse_position()
                bunnies(nbunnies)%speed%x  = get_random_value(-250, 250) / 60.0
                bunnies(nbunnies)%speed%y  = get_random_value(-250, 250) / 60.0
                bunnies(nbunnies)%color    = color_type(r = int(get_random_value( 50, 240), c_unsigned_char), &
                                                        g = int(get_random_value( 80, 240), c_unsigned_char), &
                                                        b = int(get_random_value(100, 240), c_unsigned_char), &
                                                        a = int(255, c_unsigned_char))
            end do
        end if

        ! Update bunnies.
        do concurrent (i = 1:nbunnies)
            bunnies(i)%position%x = bunnies(i)%position%x + bunnies(i)%speed%x
            bunnies(i)%position%y = bunnies(i)%position%y + bunnies(i)%speed%y

            x = bunnies(i)%position%x + texture%width / 2
            y = bunnies(i)%position%y + texture%height / 2

            if (x > SCREEN_WIDTH  .or. x < 0)      bunnies(i)%speed%x = -1 * bunnies(i)%speed%x
            if (y > SCREEN_HEIGHT .or. y - 40 < 0) bunnies(i)%speed%y = -1 * bunnies(i)%speed%x
        end do

        call begin_drawing()
            call clear_background(RAYWHITE)

            ! Render bunnies.
            do i = 1, nbunnies
                x = int(bunnies(i)%position%x)
                y = int(bunnies(i)%position%y)
                call draw_texture(texture, x, y, bunnies(i)%color)
            end do

            write (str, '("bunnies: ", i0)') nbunnies
            call draw_rectangle(0, 0, SCREEN_WIDTH, 40, BLACK)
            call draw_text(trim(str) // c_null_char, 120, 10, 20, GREEN)
            call draw_fps(10, 10)
        call end_drawing()
    end do

    deallocate (bunnies)
    call unload_texture(texture)
    call close_window()
end program main
