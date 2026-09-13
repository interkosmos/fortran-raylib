! Author:  Philipp Engel
! Licence: ISC
program main
    !! Example program that renders a skybox.
    !!
    !! Skybox texture by "Screaming Brain Studios" (CC0):
    !!
    !!     <https://opengameart.org/content/cloudy-skyboxes-0>
    !!
    use :: raylib
    use :: raylib_gl
    use :: raylib_util
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 1280
    integer, parameter :: SCREEN_HEIGHT = 800

    type(camera3d_type)  :: camera
    type(image_type)     :: image
    type(mesh_type)      :: cube
    type(model_type)     :: skybox
    type(shader_type)    :: shader
    type(texture2d_type) :: cubemap

    integer(c_int), target :: cubemap_slot
    integer(c_int)         :: environment_map_loc

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, f_c_str('Fortran + raylib'))

    ! Define camera.
    camera%position   = vector3_type(0.0, 1.0, 4.0)
    camera%target     = vector3_type(0.0, 1.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 60.0
    camera%projection = CAMERA_PERSPECTIVE

    ! Generate the cube that surrounds the camera.
    cube   = gen_mesh_cube(1.0, 1.0, 1.0)
    skybox = load_model_from_mesh(cube)

    ! Load the skybox shader.
    shader = load_shader(f_c_str('share/skybox.vs'), f_c_str('share/skybox.fs'))

    ! Assign the shader to the first material of the skybox.
    call set_model_shader(skybox, shader)
    environment_map_loc = get_shader_location(shader, f_c_str('environmentMap'))

    cubemap_slot = MATERIAL_MAP_CUBEMAP
    call set_shader_value(shader, environment_map_loc, c_loc(cubemap_slot), SHADER_UNIFORM_INT)

    ! Load the cubemap image. Raylib detects the cubemap layout automatically.
    image   = load_image(f_c_str('share/skybox.png'))
    cubemap = load_texture_cubemap(image, CUBEMAP_LAYOUT_AUTO_DETECT)
    call unload_image(image)

    ! Install the cubemap texture in the model material.
    call set_model_cubemap(skybox, cubemap)

    call disable_cursor()
    call set_target_fps(60)

    do while (.not. window_should_close())
        call update_camera(camera, CAMERA_FIRST_PERSON)

        call begin_drawing()
            call clear_background(BLACK)

            call begin_mode3d(camera)
                ! We are looking at the cube from the inside, so normal back-face culling must temporarily be disabled.
                call rl_disable_backface_culling()

                ! Do not let the skybox write to the depth buffer.
                call rl_disable_depth_mask()

                call draw_model(skybox, vector3_type(0.0, 0.0, 0.0), 1.0, WHITE)

                call rl_enable_depth_mask()
                call rl_enable_backface_culling()

                ! Some ordinary scene geometry for reference.
                call draw_grid(20, 1.0)

                call draw_cube(vector3_type(0.0, 1.0, 0.0), 1.0, 1.0, 1.0, RED)
            call end_mode3d()

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_texture(cubemap)
    call unload_shader(shader)
    call unload_model(skybox)

    call close_window()
contains
    subroutine set_model_shader(model, shader)
        type(model_type),  intent(inout) :: model
        type(shader_type), intent(in)    :: shader

        type(material_type), pointer :: materials(:)

        ! C array element 0 corresponds to Fortran array element 1 after c_f_pointer().
        call c_f_pointer(model%materials, materials, [ model%material_count ])

        materials(1)%shader = shader
    end subroutine set_model_shader

    subroutine set_model_cubemap(model, texture)
        type(model_type),     intent(inout) :: model
        type(texture2d_type), intent(in)    :: texture

        type(material_type),     pointer :: materials(:)
        type(material_map_type), pointer :: material_maps(:)

        call c_f_pointer(model%materials,   materials,     [ model%material_count ])
        call c_f_pointer(materials(1)%maps, material_maps, [ MAX_MATERIAL_MAPS + 1 ])

        material_maps(MATERIAL_MAP_CUBEMAP + 1)%texture = texture
    end subroutine set_model_cubemap
end program main
