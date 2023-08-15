! julia.f90
!
! Example program that renders animated Julia set, using the GLSL 3.30 shader
! `share/julia.fs`. Based on the raylib example `shaders_julia_set.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)

    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer :: inc_speed
    integer :: c_idx
    integer :: offset_idx
    integer :: zoom_idx

    logical :: pause
    logical :: controls

    real(kind=c_float)         :: amount
    real(kind=c_float)         :: points(2, 6)
    real(kind=c_float), target :: c(2)
    real(kind=c_float), target :: offset(2)
    real(kind=c_float), target :: zoom
    real(kind=c_float), target :: screen_dims(2)

    type(render_texture2d_type) :: target
    type(shader_type)           :: shader
    type(vector2_type)          :: mouse_pos
    type(vector2_type)          :: offset_speed

    ! Points of interest.
    points = reshape([ -0.348827,  0.607167, &
                       -0.786268,  0.169728, &
                       -0.800000,  0.156000, &
                        0.285000,  0.000000, &
                       -0.835000, -0.232100, &
                       -0.701760, -0.384200 ], [ 2, 6 ])

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)

    ! Load julia set shader. Passing `NULL` for vertex shader forces
    ! usage of internal default vertex shader.
    shader = load_shader(c_null_char, 'share/julia.fs' // c_null_char)

    ! Create a RenderTexture2D to be used for render to texture.
    target = load_render_texture(get_screen_width(), get_screen_height())

    ! Constant `c` to use in `z^2 + c`.
    c = [ points(1, 1), points(2, 1) ]

    ! Offset and zoom to draw the Julia set at (centered on screen and
    ! default size.
    offset = [ -1.0 * (get_screen_width() / 2), &
               -1.0 * (get_screen_height() / 2) ]
    offset_speed = vector2_type(0.0, 0.0)

    zoom = 1.0

    ! Get variable (uniform) locations on the shader to connect with the
    ! program. If uniform variable could not be found in the shader, function
    ! returns -1.
    c_idx      = get_shader_location(shader, 'c' // c_null_char)
    offset_idx = get_shader_location(shader, 'offset' // c_null_char)
    zoom_idx   = get_shader_location(shader, 'zoom' // c_null_char)

    screen_dims = [ real(get_screen_width()), real(get_screen_height()) ]

    call set_shader_value(shader, &
                          get_shader_location(shader, 'screenDims' // c_null_char), &
                          c_loc(screen_dims), &
                          SHADER_UNIFORM_VEC2)

    call set_shader_value(shader, c_idx,      c_loc(c),      SHADER_UNIFORM_VEC2)
    call set_shader_value(shader, offset_idx, c_loc(offset), SHADER_UNIFORM_VEC2)
    call set_shader_value(shader, zoom_idx,   c_loc(zoom),   SHADER_UNIFORM_FLOAT)

    inc_speed = 0
    controls  = .true.
    pause     = .false.

    do while (.not. window_should_close())
        if (is_key_pressed(KEY_ONE)  .or. is_key_pressed(KEY_TWO)  .or. is_key_pressed(KEY_THREE) .or. &
            is_key_pressed(KEY_FOUR) .or. is_key_pressed(KEY_FIVE) .or. is_key_pressed(KEY_SIX)) then
            if (is_key_pressed(KEY_ONE)) then
                c = points(:, 1)
            else if (is_key_pressed(KEY_TWO)) then
                c = points(:, 2)
            else if (is_key_pressed(KEY_THREE)) then
                c = points(:, 3)
            else if (is_key_pressed(KEY_FOUR)) then
                c = points(:, 4)
            else if (is_key_pressed(KEY_FIVE)) then
                c = points(:, 5)
            else if (is_key_pressed(KEY_SIX)) then
                c = points(:, 6)
            end if

            call set_shader_value(shader, c_idx, c_loc(c), SHADER_UNIFORM_VEC2)
        end if

        if (is_key_pressed(KEY_SPACE)) pause = .not. pause
        if (is_key_pressed(KEY_F1)) controls = .not. controls

        if (.not. pause) then
            if (is_key_pressed(KEY_RIGHT)) then
                inc_speed = inc_speed + 1
            else if (is_key_pressed(KEY_LEFT)) then
                inc_speed = inc_speed - 1
            end if

            if (is_mouse_button_down(MOUSE_BUTTON_LEFT) .or. &
                is_mouse_button_down(MOUSE_BUTTON_RIGHT)) then
                if (is_mouse_button_down(MOUSE_BUTTON_LEFT))  zoom = zoom + (zoom * 0.003)
                if (is_mouse_button_down(MOUSE_BUTTON_RIGHT)) zoom = zoom - (zoom * 0.003)

                mouse_pos = get_mouse_position()

                offset_speed%x = mouse_pos%x - (SCREEN_WIDTH / 2)
                offset_speed%y = mouse_pos%y - (SCREEN_HEIGHT / 2)

                ! Slowly move camera to target offset.
                offset(1) = offset(1) + get_frame_time() * offset_speed%x * 0.8
                offset(2) = offset(2) + get_frame_time() * offset_speed%y * 0.8
            else
                offset_speed = vector2_type(0.0, 0.0)
            end if

            amount = get_frame_time() * inc_speed * 0.0005
            c = c + amount

            call set_shader_value(shader, c_idx,      c_loc(c),      SHADER_UNIFORM_VEC2)
            call set_shader_value(shader, offset_idx, c_loc(offset), SHADER_UNIFORM_VEC2)
            call set_shader_value(shader, zoom_idx,   c_loc(zoom),   SHADER_UNIFORM_FLOAT)
        end if

        ! Enable drawing to texture.
        call begin_texture_mode(target)
            call clear_background(BLACK)

            ! Draw a rectangle in shader mode to be used as shader canvas.
            ! Rectangle uses font white character texture coordinates, so shader
            ! can not be applied here directly because input vertexTexCoord do
            ! not represent full screen coordinates (space where want to apply
            ! shader).
            call draw_rectangle(0, 0, get_screen_width(), get_screen_height(), BLACK)
        call end_texture_mode()

        call begin_drawing()
            call clear_background(BLACK)

            ! Draw the saved texture and rendered julia set with shader.  We do
            ! not invert texture on Y, already considered inside shader.
            call begin_shader_mode(shader)
                ! WARNING: If FLAG_WINDOW_HIGHDPI is enabled, HighDPI monitor
                ! scaling should be considered when rendering the RenderTexture2D
                ! to fit in the HighDPI scaled Window.
                call draw_texture_ex(target%texture, vector2_type(0.0, 0.0), 0.0, 1.0, WHITE)
            call end_shader_mode()

            if (controls) then
                call draw_text('Press Mouse buttons right/left to zoom in/out and move' // c_null_char, 10, 15, 10, RAYWHITE)
                call draw_text('Press KEY_F1 to toggle these controls' // c_null_char, 10, 30, 10, RAYWHITE)
                call draw_text('Press KEYS [1 - 6] to change point of interest' // c_null_char, 10, 45, 10, RAYWHITE)
                call draw_text('Press KEY_LEFT | KEY_RIGHT to change speed' // c_null_char, 10, 60, 10, RAYWHITE)
                call draw_text('Press KEY_SPACE to pause movement animation' // c_null_char, 10, 75, 10, RAYWHITE)
            end if
        call end_drawing()
    end do

    call unload_shader(shader)
    call unload_render_texture(target)
    call close_window()
end program main
