! maze.f90
!
! Example program to render a maze in first-person view. Based on the raylib
! example `models_first_person_maze.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer :: map_x, map_y, x, y
    real    :: radius

    type(camera3d_type)  :: camera
    type(image_type)     :: image
    type(mesh_type)      :: mesh
    type(model_type)     :: model
    type(rectangle_type) :: rectangle
    type(texture2d_type) :: cubic, texture
    type(vector2_type)   :: player, position
    type(vector3_type)   :: map_position, old_camera

    type(color_type), pointer :: pixels(:)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call disable_cursor()
    call set_target_fps(60)

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(0.2, 0.4, 0.2)
    camera%target     = vector3_type(0.185, 0.4, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    image = load_image('share/cubicmap.png' // c_null_char)
    cubic = load_texture_from_image(image)
    mesh  = gen_mesh_cubicmap(image, vector3_type(1.0, 1.0, 1.0))
    model = load_model_from_mesh(mesh)

    texture = load_texture('share/cubicmap_atlas.png' // c_null_char)
    call set_model_diffuse(model, texture)

    pixels(0:) => get_pixels(image)
    call unload_image(image)

    map_position = vector3_type(-16.0, 0.0, -8.0)
    radius = 0.1 ! Player radius.

    do while (.not. window_should_close())
        old_camera = camera%position
        call update_camera(camera, CAMERA_FIRST_PERSON)

        player%x = camera%position%x
        player%y = camera%position%z

        map_x = int(player%x - map_position%x + 0.5)
        map_y = int(player%y - map_position%z + 0.5)
        map_x = min(cubic%width - 1, max(map_x, 0))
        map_y = min(cubic%height - 1, max(map_y, 0))

        ! Collision detection.
        do y = 0, cubic%height - 1
            do x = 0, cubic%width - 1
                rectangle = rectangle_type(map_position%x - 0.5 + x, &
                                           map_position%z - 0.5 + y, &
                                           1.0, 1.0)

                ! Converting 255 into an unsigned char requires the compiler
                ! flag `-fno-range-check`. Otherwise, we would have to convert
                ! via the intrinsic `transfer()`.
                if (pixels(y * cubic%width + x)%r == int(Z'FF', c_unsigned_char) .and. &
                    check_collision_circle_rec(player, radius, rectangle)) then
                    camera%position = old_camera
                end if
            end do
        end do

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                call draw_model(model, map_position, 1.0, WHITE)
            call end_mode3d()

            position = vector2_type(get_screen_width() - cubic%width * 4.0 - 20, 20.0)
            call draw_texture_ex(cubic, position, 0.0, 4.0, WHITE)

            call draw_rectangle_lines(get_screen_width() - cubic%width * 4 - 20, 20, cubic%width * 4, cubic%height * 4, GREEN)
            call draw_rectangle(get_screen_width() - cubic%width * 4 - 20 + map_x * 4, 20 + map_y * 4, 4, 4, RED)

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_image_colors(pixels)
    call unload_texture(cubic)
    call unload_texture(texture)
    call unload_model(model)

    call close_window()
contains
    function get_pixels(image) result(pixels)
        type(image_type), intent(inout) :: image
        type(color_type), pointer       :: pixels(:)

        call c_f_pointer(load_image_colors(image), pixels, [ image%width * image%height ])
    end function get_pixels

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
