! cubes.f90
!
! Example program that renders waving cubes. Based on the raylib
! example `models_waving_cubes.c`.
!
! Author:  Philipp Engel
! Licence: ISC
program main
    use, intrinsic :: iso_c_binding, only: c_null_char
    use, intrinsic :: iso_fortran_env, only: r8 => real64
    use :: raylib
    implicit none (type, external)

    integer, parameter :: NBLOCKS       = 15
    integer, parameter :: SCREEN_WIDTH  = 800
    integer, parameter :: SCREEN_HEIGHT = 450

    integer             :: x, y, z
    real                :: block_scale, cube_size, scale, scatter
    real(kind=r8)       :: camera_time, time
    type(camera3d_type) :: camera
    type(color_type)    :: cube_color
    type(vector3_type)  :: cube_pos

    call init_window(SCREEN_WIDTH, SCREEN_HEIGHT, 'Fortran + raylib' // c_null_char)
    call set_target_fps(60)
    call disable_cursor()

    ! Define camera to look into our 3-D world.
    camera%position   = vector3_type(30.0, 20.0, 30.0)
    camera%target     = vector3_type(0.0, 0.0, 0.0)
    camera%up         = vector3_type(0.0, 1.0, 0.0)
    camera%fov_y      = 70.0
    camera%projection = CAMERA_PERSPECTIVE

    do while (.not. window_should_close())
        time = get_time()
        scale = real(2.0 + sin(time)) * 0.7
        camera_time = time * 0.3

        camera%position%x = real(cos(camera_time)) * 40.0
        camera%position%z = real(sin(camera_time)) * 40.0

        call begin_drawing()
        call clear_background(RAYWHITE)

        call begin_mode3d(camera)
        call draw_grid(10, 5.0)

        do x = 0, NBLOCKS - 1
            do y = 0, NBLOCKS - 1
                do z = 0, NBLOCKS - 1
                    block_scale = (x + y + z) / 30.0
                    scatter = sin(block_scale * 20.0 + real(time * 4.0))

                    cube_pos = vector3_type( &
                        x = (x - NBLOCKS / 2) * (scale * 3.0) + scatter, &
                        y = (y - NBLOCKS / 2) * (scale * 2.0) + scatter, &
                        z = (z - NBLOCKS / 2) * (scale * 3.0) + scatter &
                    )
                    cube_color = color_from_hsv(real(modulo((x + y + z) * 18, 360)), 0.75, 0.9)
                    cube_size = (2.4 - scale) * block_scale

                    call draw_cube(cube_pos, cube_size, cube_size, cube_size, cube_color)
                end do
            end do
        end do

        call end_mode3d()

        call draw_fps(10, 10)
        call end_drawing()
    end do

    call close_window()
end program main
