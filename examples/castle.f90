! castle.f90
!
! Example program that renders a 3-D model loaded from file. Based on the raylib
! example `models_loading.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    type(camera3d_type)  :: camera
    type(model_type)     :: model
    type(texture2d_type) :: texture
    type(vector3_type)   :: position

    type(material_type),     pointer :: material_ptrs(:)
    type(material_map_type), pointer :: material_map_ptrs(:)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call disable_cursor()

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(50.0, 50.0, 50.0)
    camera%target     = vector3_type(0.0, 10.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    model = load_model('share/castle.obj' // c_null_char)
    texture = load_texture('share/castle_diffuse.png' // c_null_char)

    ! We have to add 1 to the array indices as a work-around, as we can't set
    ! the lower bounds of the pointer arrays with `c_f_pointer()`.
    call c_f_pointer(model%materials, material_ptrs, [ model%material_count ])
    call c_f_pointer(material_ptrs(1)%maps, material_map_ptrs, [ MATERIAL_MAP_BRDF + 1 ])
    material_map_ptrs(MATERIAL_MAP_DIFFUSE + 1)%texture = texture

    do while (.not. window_should_close())
        call update_camera(camera, CAMERA_FIRST_PERSON)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_model(model, position, 1.0, WHITE)
                call draw_grid(20, 10.0)
            call end_mode3d()

            call draw_text('(c) Castle 3D model by Alberto Cano' // c_null_char, &
                           SCREEN_WIDTH - 200, SCREEN_HEIGHT - 20, 10, GRAY)
            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_texture(texture)
    call unload_model(model)

    call close_window()
end program main
