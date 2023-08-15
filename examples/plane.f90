! plane.f90
!
! Example program that shows pitch/yaw/roll of a 3-D model. Based on the
! raylib example `models_yaw_pitch_roll.c`.
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

    real                 :: pitch, roll, yaw
    type(camera3d_type)  :: camera
    type(model_type)     :: model
    type(texture2d_type) :: texture
    type(vector3_type)   :: position
    type(vector3_type)   :: rotation

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call disable_cursor()

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(0.0, 50.0, -120.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 30.0
    camera%projection = CAMERA_PERSPECTIVE

    model   = load_model('share/plane.obj' // c_null_char)
    texture = load_texture('share/plane_diffuse.png' // c_null_char)

    call set_model_diffuse(model, texture)

    ! Initial values.
    pitch = 0.0
    roll  = 0.0
    yaw   = 0.0

    position = vector3_type(0.0, -8.0, 0.0)

    do while (.not. window_should_close())
        ! Plane pitch (x-axis) controls.
        if (is_key_down(KEY_DOWN)) then
            pitch = pitch + 0.6
        else if (is_key_down(KEY_UP)) then
            pitch = pitch - 0.6
        else
            if (pitch > 0.3) then
                pitch = pitch - 0.3
            else if (pitch < -0.3) then
                pitch = pitch + 0.3
            end if
        end if

        ! Plane yaw (y-axis) controls.
        if (is_key_down(KEY_S)) then
            yaw = yaw - 1.0
        else if (is_key_down(KEY_A)) then
            yaw = yaw + 1.0
        else
            if (yaw > 0.0) then
                yaw = yaw - 0.5
            else if (yaw < 0.0) then
                yaw = yaw + 0.5
            end if
        end if

        ! Plane roll (z-axis) controls.
        if (is_key_down(KEY_LEFT)) then
            roll = roll - 1.0
        else if (is_key_down(KEY_RIGHT)) then
            roll = roll + 1.0
        else
            if (roll > 0.0) then
                roll = roll - 0.5
            else if (roll < 0.0) then
                roll = roll + 0.5
            end if
        end if

        rotation = vector3_type(deg2rad(pitch), deg2rad(yaw), deg2rad(roll))
        model%transform = matrix_rotate_xyz(rotation)

        call begin_drawing()
            call clear_background(RAYWHITE)

            ! Draw 3D model (recommended to draw 3D always before 2D).
            call begin_mode3d(camera)
                call draw_model(model, position, 1.0, WHITE)
                call draw_grid(10, 10.0)
            call end_mode3d()

            ! Draw controls info.
            call draw_rectangle(30, 370, 260, 70, fade(GREEN, 0.5))
            call draw_rectangle_lines(30, 370, 260, 70, fade(DARKGREEN, 0.5))
            call draw_text('Pitch controlled with: KEY_UP / KEY_DOWN' // c_null_char, 40, 380, 10, DARKGRAY)
            call draw_text('Roll controlled with: KEY_LEFT / KEY_RIGHT' // c_null_char, 40, 400, 10, DARKGRAY)
            call draw_text('Yaw controlled with: KEY_A / KEY_S' // c_null_char, 40, 420, 10, DARKGRAY)

            call draw_text('(c) WWI plane model created by GiaHanLam' // c_null_char, &
                           SCREEN_WIDTH - 240, SCREEN_HEIGHT - 20, 10, DARKGRAY)
            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_texture(texture)
    call unload_model(model)
    call close_window()
contains
    subroutine set_model_diffuse(model, texture)
        type(model_type),     intent(inout) :: model
        type(texture2d_type), intent(inout) :: texture

        type(material_type),     pointer :: material_ptrs(:)
        type(material_map_type), pointer :: material_map_ptrs(:)

        ! We have to add 1 to the array indices as a work-around, as we can't set
        ! the lower bounds of the pointer arrays with `c_f_pointer()`.
        call c_f_pointer(model%materials, material_ptrs, [ model%material_count ])
        call c_f_pointer(material_ptrs(1)%maps, material_map_ptrs, [ MATERIAL_MAP_BRDF + 1 ])
        material_map_ptrs(MATERIAL_MAP_DIFFUSE + 1)%texture = texture
    end subroutine set_model_diffuse
end program main
