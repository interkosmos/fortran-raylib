! collision.f90
!
! Example program to test collision detection. Based on the raylib example
! `shapes_collision_area.c`.
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
    integer              :: limit, speed
    logical              :: collision, pause
    type(rectangle_type) :: box_a, box_b, box_c

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    box_a = rectangle_type(10.0, &
                           get_screen_height() / 2.0 - 50.0, &
                           200.0, &
                           100.0)
    box_b = rectangle_type(get_screen_width() / 2.0 - 30.0, &
                           get_screen_height() / 2.0 - 30.0, &
                           60.0, &
                           60.0)
    speed = 4
    limit = 40

    pause     = .false.
    collision = .false.

    do while (.not. window_should_close())
        if (.not. pause) box_a%x = box_a%x + speed

        if ((box_a%x + box_a%width >= get_screen_width()) .or. (box_a%x <= 0)) &
            speed = -1 * speed

        box_b%x = get_mouse_x() - box_b%width / 2.0
        box_b%y = get_mouse_y() - box_b%height / 2.0

        if (box_b%x + box_b%width >= get_screen_width()) then
            box_b%x = get_screen_width() - box_b%width
        else if (box_b%x <= 0) then
            box_b%x = 0.0
        end if

        if (box_b%y + box_b%height >= get_screen_height()) then
            box_b%y = get_screen_height() - box_b%height
        else if (box_b%y <= limit) then
            box_b%y = real(limit)
        end if

        collision = check_collision_recs(box_a, box_b)
        if (collision) box_c = get_collision_rec(box_a, box_b)

        if (is_key_pressed(KEY_SPACE)) pause = .not. pause

        call begin_drawing()
            call clear_background(RAYWHITE)

            if (collision) then
                call draw_rectangle(0, 0, screen_width, limit, RED)
            else
                call draw_rectangle(0, 0, screen_width, limit, BLACK)
            end if

            call draw_rectangle_rec(box_a, GOLD)
            call draw_rectangle_rec(box_b, BLUE)

            if (collision) then
                call draw_rectangle_rec(box_c, LIME)
                call draw_text('COLLISION!' // c_null_char, &
                               get_screen_width() / 2 - measure_text('COLLISION!' // c_null_char, 20) / 2, &
                               limit / 2 - 10, 20, BLACK)

                write (str, '("Collision Area: ", i0)') int(box_c%width) * int(box_c%height)
                call draw_text(trim(str) // c_null_char, get_screen_width() / 2 - 100, &
                               limit + 10, 20, BLACK)
            end if

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call close_window()
end program main
