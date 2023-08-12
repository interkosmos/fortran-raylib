! raylib_camera.f90
!
! Additional camera routines for raylib 4.5, from `rcamera.h`.
!
! Author:  Philipp Engel
! Licence: ISC
module raylib_camera
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)
    private

    public :: camera_move_forward
    public :: camera_move_right
    public :: camera_move_to_target
    public :: camera_move_up
    public :: camera_pitch
    public :: camera_roll
    public :: camera_yaw
    public :: get_camera_forward
    public :: get_camera_projection_matrix
    public :: get_camera_right
    public :: get_camera_up
    public :: get_camera_view_matrix

    interface
        ! void CameraMoveForward(Camera *camera, float distance, bool moveInWorldPlane)
        subroutine camera_move_forward(camera, distance, move_in_world_plane) bind(c, name='CameraMoveForward')
            import :: c_bool, c_float, camera3d_type
            implicit none
            type(camera3d_type),  intent(inout)     :: camera
            real(kind=c_float),   intent(in), value :: distance
            logical(kind=c_bool), intent(in), value :: move_in_world_plane
        end subroutine camera_move_forward

        ! void CameraMoveRight(Camera *camera, float distance, bool moveInWorldPlane)
        subroutine camera_move_right(camera, distance, move_in_world_plane) bind(c, name='CameraMoveRight')
            import :: c_bool, c_float, camera3d_type
            implicit none
            type(camera3d_type),  intent(inout)     :: camera
            real(kind=c_float),   intent(in), value :: distance
            logical(kind=c_bool), intent(in), value :: move_in_world_plane
        end subroutine camera_move_right

        ! void CameraMoveToTarget(Camera *camera, float delta)
        subroutine camera_move_to_target(camera, delta) bind(c, name='CameraMoveToTarget')
            import :: c_float, camera3d_type
            implicit none
            type(camera3d_type), intent(inout)     :: camera
            real(kind=c_float),  intent(in), value :: delta
        end subroutine camera_move_to_target

        ! void CameraMoveUp(Camera *camera, float distance)
        subroutine camera_move_up(camera, distance) bind(c, name='CameraMoveUp')
            import :: c_float, camera3d_type
            implicit none
            type(camera3d_type),intent(inout)     :: camera
            real(kind=c_float), intent(in), value :: distance
        end subroutine camera_move_up

        ! void CameraPitch(Camera *camera, float angle, bool lockView, bool rotateAroundTarget, bool rotateUp)
        subroutine camera_pitch(camera, angle, lock_view, rotate_around_target, rotate_up) bind(c, name='CameraPitch')
            import :: c_bool, c_float, camera3d_type
            implicit none
            type(camera3d_type),  intent(inout)     :: camera
            real(kind=c_float),   intent(in), value :: angle
            logical(kind=c_bool), intent(in), value :: lock_view
            logical(kind=c_bool), intent(in), value :: rotate_around_target
            logical(kind=c_bool), intent(in), value :: rotate_up
        end subroutine camera_pitch

        ! void CameraRoll(Camera *camera, float angle)
        subroutine camera_roll(camera, angle) bind(c, name='CameraRoll')
            import :: c_float, camera3d_type
            implicit none
            type(camera3d_type),intent(inout)     :: camera
            real(kind=c_float), intent(in), value :: angle
        end subroutine camera_roll

        ! void CameraYaw(Camera *camera, float angle, bool rotateAroundTarget)
        subroutine camera_yaw(camera, angle, rotate_around_target) bind(c, name='CameraYaw')
            import :: c_bool, c_float, camera3d_type
            implicit none
            type(camera3d_type),  intent(inout)     :: camera
            real(kind=c_float),   intent(in), value :: angle
            logical(kind=c_bool), intent(in), value :: rotate_around_target
        end subroutine camera_yaw

        ! Vector3 GetCameraForward(Camera *camera)
        function get_camera_forward(camera) bind(c, name='GetCameraForward')
            import :: camera3d_type, vector3_type
            implicit none
            type(camera3d_type), intent(inout) :: camera
            type(vector3_type)                 :: get_camera_forward
        end function get_camera_forward

        ! Matrix GetCameraProjectionMatrix(Camera* camera, float aspect)
        function get_camera_projection_matrix(camera, aspect) bind(c, name='GetCameraProjectionMatrix')
            import :: c_float, camera3d_type, matrix_type
            implicit none
            type(camera3d_type),intent(inout)     :: camera
            real(kind=c_float), intent(in), value :: aspect
            type(matrix_type)                     :: get_camera_projection_matrix
        end function get_camera_projection_matrix

        ! Vector3 GetCameraRight(Camera *camera)
        function get_camera_right(camera) bind(c, name='GetCameraRight')
            import :: camera3d_type, vector3_type
            implicit none
            type(camera3d_type), intent(inout) :: camera
            type(vector3_type)                 :: get_camera_right
        end function get_camera_right

        ! Vector3 GetCameraUp(Camera *camera)
        function get_camera_up(camera) bind(c, name='GetCameraUp')
            import :: camera3d_type, vector3_type
            implicit none
            type(camera3d_type), intent(inout) :: camera
            type(vector3_type)                 :: get_camera_up
        end function get_camera_up

        ! Matrix GetCameraViewMatrix(Camera *camera)
        function get_camera_view_matrix(camera) bind(c, name='GetCameraViewMatrix')
            import :: camera3d_type, matrix_type
            implicit none
            type(camera3d_type), intent(inout) :: camera
            type(matrix_type)                  :: get_camera_view_matrix
        end function get_camera_view_matrix
    end interface
end module raylib_camera
