! mesh.f90
!
! Example program based on `shaders_mesh_instancing.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    use :: raylib_math
    implicit none (type, external)

    character(len=*), parameter :: FS_FILE_NAME = 'share/lighting.fs'
    character(len=*), parameter :: VS_FILE_NAME = 'share/lighting_instancing.vs'

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer, parameter :: MAX_INSTANCES = 10000
    integer, parameter :: MAX_LIGHTS    = 4

    ! LightType
    integer, parameter :: LIGHT_DIRECTIONAL = 0
    integer, parameter :: LIGHT_POINT       = 1

    type :: light_type
        integer(kind=c_int) :: type            = LIGHT_DIRECTIONAL
        integer(kind=c_int) :: enabled         = 0
        type(vector3_type)  :: position
        type(vector3_type)  :: target
        type(color_type)    :: color
        real(kind=c_float)  :: attenuation     = 0.0
        integer(kind=c_int) :: enabled_loc     = 0
        integer(kind=c_int) :: type_loc        = 0
        integer(kind=c_int) :: position_loc    = 0
        integer(kind=c_int) :: target_loc      = 0
        integer(kind=c_int) :: color_loc       = 0
        integer(kind=c_int) :: attenuation_loc = 0
    end type light_type

    integer :: lights_count = 0

    integer             :: ambient, i, stat
    integer, pointer    :: locs(:)
    real                :: angle
    real, target        :: camera_pos(3), vector(4)
    type(camera3d_type) :: camera
    type(material_type) :: material_default, material_instances
    type(matrix_type)   :: rotation, translation
    type(mesh_type)     :: cube
    type(shader_type)   :: shader
    type(vector3_type)  :: axis

    type(matrix_type), allocatable :: transforms(:)

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)

    camera%position   = vector3_type(-125.0, 125.0, -125.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 45.0
    camera%projection = CAMERA_PERSPECTIVE

    cube = gen_mesh_cube(1.0, 1.0, 1.0)

    allocate (transforms(MAX_INSTANCES), stat=stat)
    if (stat /= 0) error stop 'failed to allocate memory'

    do i = 1, MAX_INSTANCES
        translation = matrix_translate(real(get_random_value(-50, 50)), &
                                       real(get_random_value(-50, 50)), &
                                       real(get_random_value(-50, 50)))

        axis = vector3_normalize(vector3_type(get_random_value(0, 360), &
                                              get_random_value(0, 360), &
                                              get_random_value(0, 360)))

        angle    = deg2rad(real(get_random_value(0, 180)))
        rotation = matrix_rotate(axis, angle)

        transforms(i) = matrix_multiply(rotation, translation)
    end do

    shader = load_shader(VS_FILE_NAME // c_null_char, FS_FILE_NAME // c_null_char)

    call c_f_pointer(shader%locs, locs, [ MAX_SHADER_LOCATIONS + 1 ])
    locs(SHADER_LOC_MATRIX_MVP + 1)  = get_shader_location(shader, 'mvp' // c_null_char)
    locs(SHADER_LOC_VECTOR_VIEW + 1) = get_shader_location(shader, 'viewPos' // c_null_char)

    ! Set shader value: ambient light level.
    ambient = get_shader_location(shader, 'ambient')
    vector  = [ 0.2, 0.2, 0.2, 1.0 ]
    call set_shader_value(shader, ambient, c_loc(vector), SHADER_UNIFORM_VEC4)

    ! Create one light.
    call create_light(LIGHT_DIRECTIONAL, vector3_type(50.0, 50.0, 0.0), vector3_type(), WHITE, shader)

    block
        ! NOTE: We are assigning the intancing shader to `material%shader` to be used
        ! on mesh drawing with `draw_mesh_instanced()`.
        type(material_map_type), pointer :: maps(:)

        material_instances        = load_material_default()
        material_instances%shader = shader
        call c_f_pointer(material_instances%maps, maps, [ MAX_MATERIAL_MAPS + 1 ])
        maps(MATERIAL_MAP_DIFFUSE + 1)%color = RED
    end block

    block
        ! Load default material (using raylib internal default shader) for
        ! non-instanced mesh drawing.
        !
        ! WARNING: Default shader enables vertex color attribute BUT `gen_mesh_cube()`
        ! does not generate vertex colors, so, when drawing the color attribute is
        ! disabled and a default color value is provided as input for the vertex
        ! attribute.
        type(material_map_type), pointer :: maps(:)

        material_default = load_material_default()
        call c_f_pointer(material_default%maps, maps, [ MAX_MATERIAL_MAPS + 1 ])
        maps(MATERIAL_MAP_DIFFUSE + 1)%color = BLUE
    end block

    call set_target_fps(60)

    do while (.not. window_should_close())
        call update_camera(camera, CAMERA_ORBITAL)

        ! Update the light shader with the camera view position.
        camera_pos = [ camera%position%x, camera%position%y, camera%position%z ]
        call set_shader_value(shader, locs(SHADER_LOC_VECTOR_VIEW + 1), c_loc(camera_pos), SHADER_UNIFORM_VEC3)

        call begin_drawing()
            call clear_background(RAYWHITE)

            call begin_mode3d(camera)
                ! Draw cube mesh with default material (BLUE).
                call draw_mesh(cube, material_default, matrix_translate(-10.0, 0.0, 0.0))

                ! Draw meshes instanced using material containing instancing shader (RED +
                ! lighting), `transforms` for the instances should be provided, they are dynamically
                ! updated in GPU every frame, so we can animate the different mesh instances.
                call draw_mesh_instanced(cube, material_instances, transforms, MAX_INSTANCES)

                ! Draw cube mesh with default material (BLUE).
                call draw_mesh(cube, material_default, matrix_translate(10.0, 0.0, 0.0))
            call end_mode3d()

            call draw_fps(10, 10)
        call end_drawing()
    end do

    call unload_shader(shader)
    call close_window()
contains
    subroutine create_light(type, position, target, color, shader)
        integer,            intent(in) :: type
        type(vector3_type), intent(in) :: position
        type(vector3_type), intent(in) :: target
        type(color_type),   intent(in) :: color
        type(shader_type),  intent(in) :: shader

        character(len=32) :: string
        type(light_type)  :: light

        if (lights_count < MAX_LIGHTS) then
            light%enabled  = 1
            light%type     = type
            light%position = position
            light%target   = target
            light%color    = color

            ! NOTE: Lighting shader naming must be the provided ones.
            write (string, '("lights[", i0, "].enabled")') lights_count
            light%enabled_loc = get_shader_location(shader, trim(string) // c_null_char)

            write (string, '("lights[", i0, "].type")') lights_count
            light%type_loc = get_shader_location(shader, trim(string) // c_null_char)

            write (string, '("lights[", i0, "].position")') lights_count
            light%position_loc = get_shader_location(shader, trim(string) // c_null_char)

            write (string, '("lights[", i0, "].target")') lights_count
            light%target_loc = get_shader_location(shader, trim(string) // c_null_char)

            write (string, '("lights[", i0, "].color")') lights_count
            light%color_loc = get_shader_location(shader, trim(string) // c_null_char)

            call update_light_values(shader, light)

            lights_count = lights_count + 1
        end if
    end subroutine create_light

    subroutine update_light_values(shader, light)
        type(shader_type),        intent(in) :: shader
        type(light_type), target, intent(in) :: light

        real, target :: color(4), position(3), target(3)

        ! Send to shader light enabled state and type.
        call set_shader_value(shader, light%enabled_loc, c_loc(light%enabled), SHADER_UNIFORM_INT)
        call set_shader_value(shader, light%type_loc, c_loc(light%type), SHADER_UNIFORM_INT)

        ! Send to shader light position values.
        position = [ light%position%x, light%position%y, light%position%z ]
        call set_shader_value(shader, light%position_loc, c_loc(position), SHADER_UNIFORM_VEC3)

        ! Send to shader light target position values.
        target = [ light%target%x, light%target%y, light%target%z ]
        call set_shader_value(shader, light%target_loc, c_loc(target), SHADER_UNIFORM_VEC3)

        ! Send to shader light color values.
        color = [ light%color%r / 255.0, &
                  light%color%g / 255.0, &
                  light%color%b / 255.0, &
                  light%color%a / 255.0 ]
        call set_shader_value(shader, light%color_loc, c_loc(color), SHADER_UNIFORM_VEC4)
    end subroutine update_light_values
end program main
