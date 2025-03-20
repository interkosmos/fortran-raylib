! camera3d.f90
!
! Example program that shows a 3-D scene from first-person. Based on the raylib
! example `core_3d_camera_first_person.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_bool, c_null_char
    use :: raylib
    use :: raylib_camera
    implicit none (type, external)

    integer, parameter :: MAX_COLUMNS   = 20
    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    character(len=32)   :: text
    integer             :: camera_mode, i
    real                :: heights(MAX_COLUMNS)
    type(camera3d_type) :: camera
    type(color_type)    :: colors(MAX_COLUMNS)
    type(vector3_type)  :: positions(MAX_COLUMNS)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call disable_cursor()

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(0.0, 2.0, 4.0)
    camera%target     = vector3_type(0.0, 2.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 60.0
    camera%projection = CAMERA_PERSPECTIVE

    camera_mode = CAMERA_FIRST_PERSON

    do i = 1, MAX_COLUMNS
        heights(i)   = real(get_random_value(1, 12))
        positions(i) = vector3_type(x = real(get_random_value(-15, 15)), &
                                    y = heights(i) / 2.0, &
                                    z = real(get_random_value(-15, 15)))
        colors(i)    = color_type(r = get_random_value(20, 255), &
                                  g = get_random_value(10, 55), &
                                  b = int(30, c_unsigned_char), &
                                  a = int(z'FF', c_unsigned_char))
    end do


    do while (.not. window_should_close())
        if (is_key_pressed(KEY_ONE)) then
            camera_mode = CAMERA_FREE
            camera%up   = vector3_type(0.0, 1.0, 0.0)
        end if

        if (is_key_pressed(KEY_TWO)) then
            camera_mode = CAMERA_FIRST_PERSON
            camera%up   = vector3_type(0.0, 1.0, 0.0)
        end if

        if (is_key_pressed(KEY_THREE)) then
            camera_mode = CAMERA_THIRD_PERSON
            camera%up   = vector3_type(0.0, 1.0, 0.0)
        end if

        if (is_key_pressed(KEY_FOUR)) then
            camera_mode = CAMERA_ORBITAL
            camera%up   = vector3_type(0.0, 1.0, 0.0)
        end if

        if (is_key_pressed(KEY_P)) then
            if (camera%projection == CAMERA_PERSPECTIVE) then
                ! Create isometric view.
                camera_mode = CAMERA_THIRD_PERSON

                ! Note: The target distance is related to the render distance in
                ! the orthographic projection.
                camera%position   = vector3_type(0.0, 2.0, -100.0)
                camera%target     = vector3_type(0.0, 2.0, 0.0)
                camera%up         = vector3_type(0.0, 1.0, 0.0)
                camera%projection = CAMERA_ORTHOGRAPHIC
                camera%fov_y      = 20.0 ! near plane width in CAMERA_ORTHOGRAPHIC

                call camera_yaw(camera, deg2rad(-135.0), .true._c_bool)
                call camera_pitch(camera, deg2rad(-45.0), .true._c_bool, .true._c_bool, .false._c_bool)
            else if (camera%projection == CAMERA_ORTHOGRAPHIC) then
                ! Reset to default view
                camera_mode = CAMERA_THIRD_PERSON

                camera%position   = vector3_type(0.0, 2.0, 10.0)
                camera%target     = vector3_type(0.0, 2.0, 0.0)
                camera%up         = vector3_type(0.0, 1.0, 0.0)
                camera%projection = CAMERA_PERSPECTIVE
                camera%fov_y      = 60.0
            end if
        end if

        ! Update camera computes movement internally depending on the camera
        ! mode. Some default standard keyboard/mouse inputs are hardcoded to
        ! simplify use. For advance camera controls, it's reecommended to
        ! compute camera movement manually.
        call update_camera(camera, camera_mode)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_plane(vector3_type(0.0, 0.0, 0.0), vector2_type(32.0, 32.0), LIGHTGRAY)
                call draw_cube(vector3_type(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, BLUE)
                call draw_cube(vector3_type(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, LIME)
                call draw_cube(vector3_type(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, GOLD)

                ! Draw some cubes around.
                do i = 1, MAX_COLUMNS
                    call draw_cube(positions(i), 2.0, heights(i), 2.0, colors(i))
                    call draw_cube_wires(positions(i), 2.0, heights(i), 2.0, maroon)
                end do

                ! Draw player cube.
                if (camera_mode == CAMERA_THIRD_PERSON) then
                    call draw_cube(camera%target, 0.5, 0.5, 0.5, purple)
                    call draw_cube_wires(camera%target, 0.5, 0.5, 0.5, DARKPURPLE)
                end if
            call end_mode3d()

            call draw_rectangle(5, 5, 330, 100, fade(SKYBLUE, 0.5))
            call draw_rectangle_lines(5, 5, 330, 100, BLUE)

            call draw_text('Camera controls:' // c_null_char, 15, 15, 10, BLACK)
            call draw_text('- Move keys: W, A, S, D, Space, Left-Ctrl' // c_null_char, 15, 30, 10, BLACK)
            call draw_text('- Look around: arrow keys or mouse' // c_null_char, 15, 45, 10, BLACK)
            call draw_text('- Camera mode keys: 1, 2, 3, 4' // c_null_char, 15, 60, 10, BLACK)
            call draw_text('- Zoom keys: num-plus, num-minus or mouse scroll' // c_null_char, 15, 75, 10, BLACK)
            call draw_text('- Camera projection key: P' // c_null_char, 15, 90, 10, BLACK)

            call draw_rectangle(600, 5, 195, 100, fade(SKYBLUE, 0.5))
            call draw_rectangle_lines(600, 5, 195, 100, BLUE)

            call draw_text('Camera status:' // c_null_char, 610, 15, 10, BLACK)

            select case (camera_mode)
                case (CAMERA_FREE)
                    text = '- Mode: FREE'
                case (CAMERA_FIRST_PERSON)
                    text = '- Mode: FIRST_PERSON'
                case (CAMERA_THIRD_PERSON)
                    text = '- Mode: THIRD_PERSON'
                case (CAMERA_ORBITAL)
                    text = '- Mode: ORBITAL'
            end select

            call draw_text(trim(text) // c_null_char, 610, 30, 10, BLACK)

            select case (camera%projection)
                case (CAMERA_PERSPECTIVE)
                    text = '- Projection: PERSPECTIVE'
                case (CAMERA_ORTHOGRAPHIC)
                    text = '- Projection: ORTHOGRAPHIC'
                case default
                    text = '- Projection: CUSTOM'
            end select

            call draw_text(trim(text) // c_null_char, 610, 45, 10, BLACK)

            write (text, '("Position: ", f6.3, 2(", ", f6.3))') camera%position%x, camera%position%y, camera%position%z
            call draw_text(trim(text) // c_null_char, 610, 60, 10, BLACK)

            write (text, '("Target: ", f6.3, 2(", ", f6.3))') camera%target%x, camera%target%y, camera%target%z
            call draw_text(trim(text) // c_null_char, 610, 75, 10, BLACK)

            write (text, '("Up: ", f6.3, 2(", ", f6.3))') camera%up%x, camera%up%y, camera%up%z
            call draw_text(trim(text) // c_null_char, 610, 90, 10, BLACK)
        call end_drawing()
    end do

    call close_window()
end program main
