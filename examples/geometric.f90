! geometric.f90
!
! Example program that renders geometric shapes. Based on the raylib example
! `models_geometric_shapes.c`.
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

    call set_config_flags(FLAG_MSAA_4X_HINT)
    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(0.0, 10.0, 10.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    do while (.not. window_should_close())
        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_cube      (vector3_type(-4.0, 0.0,  2.0), 2.0, 5.0, 2.0, RED)
                call draw_cube_wires(vector3_type(-4.0, 0.0,  2.0), 2.0, 5.0, 2.0, GOLD)
                call draw_cube_wires(vector3_type(-4.0, 0.0, -2.0), 3.0, 6.0, 2.0, MAROON)

                call draw_sphere      (vector3_type(-1.0, 0.0, -2.0), 1.0, GREEN)
                call draw_sphere_wires(vector3_type( 1.0, 0.0,  2.0), 2.0, 16, 16, LIME)

                call draw_cylinder      (vector3_type(4.0,  0.0, -2.0), 1.0, 2.0, 3.0, 4, SKYBLUE)
                call draw_cylinder_wires(vector3_type(4.0,  0.0, -2.0), 1.0, 2.0, 3.0, 4, DARKBLUE)
                call draw_cylinder_wires(vector3_type(4.5, -1.0,  2.0), 1.0, 1.0, 2.0, 6, BROWN)

                call draw_cylinder      (vector3_type(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, GOLD)
                call draw_cylinder_wires(vector3_type(1.0, 0.0, -4.0), 0.0, 1.5, 3.0, 8, PINK)

                call draw_capsule      (vector3_type(-3.0, 1.5, -4.0), vector3_type(-4.0, -1.0, -4.0), 1.2, 8, 8, VIOLET)
                call draw_capsule_wires(vector3_type(-3.0, 1.5, -4.0), vector3_type(-4.0, -1.0, -4.0), 1.2, 8, 8, PURPLE)

                call draw_grid(10, 1.0)
            call end_mode3d()

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call close_window()
end program main
