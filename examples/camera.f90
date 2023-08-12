! camera.f90
!
! Example program to test camera modes. Based on the raylib example
! `core_3d_camera_mode.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    type(camera3d_type) :: camera
    type(vector3_type)  :: cube_pos

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(0.0, 10.0, 10.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    cube_pos = vector3_type(0.0, 0.0, 0.0)

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_cube(cube_pos, 2.0, 2.0, 2.0, RED)
                call draw_cube_wires(cube_pos, 2.0, 2.0, 2.0, MAROON)
                call draw_grid(10, 1.0)
            call end_mode3d()

            call draw_text('Welcome to the third dimension!' // c_null_char, 10, 40, 20, DARKGRAY)
            call draw_fps(10, 10)
        call end_drawing()
    end do

    call close_window()
end program main
