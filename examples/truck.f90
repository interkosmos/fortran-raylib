! truck.f90
!
! Example program that rotates a 3-D model loaded from file.
! Model (CC0) source: https://kenney.nl/assets/car-kit
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    use :: raylib_math
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    real                :: angle
    type(camera3d_type) :: camera
    type(model_type)    :: model
    type(vector3_type)  :: position
    type(vector3_type)  :: rotation
    type(vector3_type)  :: scale

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call disable_cursor()

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(50.0, 50.0, 50.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    model = load_model('share/truck.obj' // c_null_char)

    angle    = 0.0
    rotation = vector3_type(0.0, 1.0, 0.0)
    scale    = vector3_type(15.0, 15.0, 15.0)

    do while (.not. window_should_close())
        call update_camera(camera, CAMERA_FIRST_PERSON)

        angle = modulo(angle + 0.1, 360.0)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_model_ex(model, position, rotation, angle, scale, WHITE)
                call draw_grid(20, 10.0)
            call end_mode3d()

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_model(model)
    call close_window()
end program main
