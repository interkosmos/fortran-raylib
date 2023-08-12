! map.f90
!
! Example program that generates a height map from image. Based on the raylib
! example `models_heightmap.c`.
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
    type(image_type)     :: image
    type(mesh_type)      :: mesh
    type(model_type)     :: model
    type(texture2d_type) :: texture
    type(vector3_type)   :: map_position

    type(material_type),     pointer :: material_ptrs(:)
    type(material_map_type), pointer :: material_map_ptrs(:)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(18.0, 21.0, 18.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    image   = load_image('share/map.png' // c_null_char)
    texture = load_texture_from_image(image)
    mesh    = gen_mesh_heightmap(image, vector3_type(16.0, 8.0, 16.0))
    model   = load_model_from_mesh(mesh)

    ! We have to add 1 to the array indices as a work-around, as we can't set
    ! the lower bounds of the pointer arrays with `c_f_pointer()`.
    call c_f_pointer(model%materials, material_ptrs, [ model%material_count ])
    call c_f_pointer(material_ptrs(1)%maps, material_map_ptrs, [ MATERIAL_MAP_BRDF + 1 ])
    material_map_ptrs(MATERIAL_MAP_DIFFUSE + 1)%texture = texture

    map_position = vector3_type(-8.0, 0.0, -8.0)

    call unload_image(image)

    do while (.not. window_should_close())
        call update_camera(camera, CAMERA_ORBITAL)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_model(model, map_position, 1.0, RED)
                call draw_grid(20, 1.0)
            call end_mode3d()

            call draw_texture(texture, SCREEN_WIDTH - texture%width - 20, 20, WHITE)
            call draw_rectangle_lines(SCREEN_WIDTH - texture%width - 20, 20, &
                                      texture%width, texture%height, GREEN)

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_texture(texture)
    call unload_model(model)

    call close_window()
end program main
