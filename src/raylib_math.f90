! raylib_math.f90
!
! Fortran 2018 interface bindings to `raymath.h`.
!
! Author:  Philipp Engel
! Licence: ISC
module raylib_math
    use, intrinsic :: iso_c_binding
    use :: raylib
    implicit none (type, external)
    private

    ! float3
    type, bind(c), public :: float3_type
        real(kind=c_float) :: v(0:2)
    end type float3_type

    ! float16
    type, bind(c), public :: float16_type
        real(kind=c_float) :: v(0:15)
    end type float16_type

    public :: clamp
    public :: float_equals
    public :: lerp
    public :: matrix_add
    public :: matrix_determinant
    public :: matrix_frustum
    public :: matrix_identity
    public :: matrix_invert
    public :: matrix_look_at
    public :: matrix_multiply
    public :: matrix_ortho
    public :: matrix_perspective
    public :: matrix_rotate
    public :: matrix_rotate_x
    public :: matrix_rotate_xyz
    public :: matrix_rotate_y
    public :: matrix_rotate_z
    public :: matrix_rotate_zyx
    public :: matrix_scale
    public :: matrix_subtract
    public :: matrix_to_float_v
    public :: matrix_trace
    public :: matrix_translate
    public :: matrix_transpose
    public :: normalize
    public :: quaternion_add
    public :: quaternion_add_value
    public :: quaternion_divide
    public :: quaternion_equals
    public :: quaternion_from_axis_angle
    public :: quaternion_from_euler
    public :: quaternion_from_matrix
    public :: quaternion_from_vector3_to_vector3
    public :: quaternion_identity
    public :: quaternion_invert
    public :: quaternion_length
    public :: quaternion_lerp
    public :: quaternion_multiply
    public :: quaternion_nlerp
    public :: quaternion_normalize
    public :: quaternion_scale
    public :: quaternion_slerp
    public :: quaternion_subtract
    public :: quaternion_subtract_value
    public :: quaternion_to_axis_angle
    public :: quaternion_to_euler
    public :: quaternion_to_matrix
    public :: quaternion_transform
    public :: remap
    public :: vector2_add
    public :: vector2_add_value
    public :: vector2_angle
    public :: vector2_clamp
    public :: vector2_clamp_value
    public :: vector2_distance
    public :: vector2_distance_sqr
    public :: vector2_divide
    public :: vector2_dot_product
    public :: vector2_equals
    public :: vector2_invert
    public :: vector2_length
    public :: vector2_length_sqr
    public :: vector2_lerp
    public :: vector2_line_angle
    public :: vector2_move_towards
    public :: vector2_multiply
    public :: vector2_negate
    public :: vector2_normalize
    public :: vector2_one
    public :: vector2_reflect
    public :: vector2_rotate
    public :: vector2_scale
    public :: vector2_subtract
    public :: vector2_subtract_value
    public :: vector2_transform
    public :: vector2_zero
    public :: vector3_add
    public :: vector3_add_value
    public :: vector3_angle
    public :: vector3_barycenter
    public :: vector3_clamp
    public :: vector3_clamp_value
    public :: vector3_cross_product
    public :: vector3_distance
    public :: vector3_distance_sqr
    public :: vector3_divide
    public :: vector3_dot_product
    public :: vector3_equals
    public :: vector3_invert
    public :: vector3_length
    public :: vector3_length_sqr
    public :: vector3_lerp
    public :: vector3_max
    public :: vector3_min
    public :: vector3_multiply
    public :: vector3_negate
    public :: vector3_normalize
    public :: vector3_one
    public :: vector3_ortho_normalize
    public :: vector3_perpendicular
    public :: vector3_reflect
    public :: vector3_refract
    public :: vector3_rotate_by_axis_angle
    public :: vector3_rotate_by_quaternion
    public :: vector3_scale
    public :: vector3_subtract
    public :: vector3_subtract_value
    public :: vector3_to_float_v
    public :: vector3_transform
    public :: vector3_unproject
    public :: vector3_zero
    public :: wrap

    interface
        ! float Clamp(float value, float min, float max)
        function clamp(value, min, max) bind(c, name='Clamp')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: value
            real(kind=c_float), intent(in), value :: min
            real(kind=c_float), intent(in), value :: max
            real(kind=c_float)                    :: clamp
        end function clamp

        ! int FloatEquals(float x, float y)
        function float_equals(x, y) bind(c, name='FloatEquals')
            import :: c_float, c_int
            implicit none
            real(kind=c_float), intent(in), value :: x
            real(kind=c_float), intent(in), value :: y
            integer(kind=c_int)                   :: float_equals
        end function float_equals

        ! float Lerp(float start, float end, float amount)
        function lerp(start, end, amount) bind(c, name='Lerp')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: start
            real(kind=c_float), intent(in), value :: end
            real(kind=c_float), intent(in), value :: amount
            real(kind=c_float)                    :: lerp
        end function lerp

        ! Matrix MatrixAdd(Matrix left, Matrix right)
        function matrix_add(left, right) bind(c, name='MatrixAdd')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: left
            type(matrix_type), intent(in), value :: right
            type(matrix_type)                    :: matrix_add
        end function matrix_add

        ! float MatrixDeterminant(Matrix mat)
        function matrix_determinant(mat) bind(c, name='MatrixDeterminant')
            import :: c_float, matrix_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            real(kind=c_float)                   :: matrix_determinant
        end function matrix_determinant

        ! Matrix MatrixFrustum(double left, double right, double bottom, double top, double near, double far)
        function matrix_frustum(left, right, bottom, top, near, far) bind(c, name='MatrixFrustum')
            import :: c_double, matrix_type
            implicit none
            real(kind=c_double), intent(in), value :: left
            real(kind=c_double), intent(in), value :: right
            real(kind=c_double), intent(in), value :: bottom
            real(kind=c_double), intent(in), value :: top
            real(kind=c_double), intent(in), value :: near
            real(kind=c_double), intent(in), value :: far
            type(matrix_type)                      :: matrix_frustum
        end function matrix_frustum

        ! Matrix MatrixIdentity(void)
        function matrix_identity() bind(c, name='MatrixIdentity')
            import :: matrix_type
            implicit none
            type(matrix_type) :: matrix_identity
        end function matrix_identity

        ! Matrix MatrixInvert(Matrix mat)
        function matrix_invert(mat) bind(c, name='MatrixInvert')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            type(matrix_type)                    :: matrix_invert
        end function matrix_invert

        ! Matrix MatrixLookAt(Vector3 eye, Vector3 target, Vector3 up)
        function matrix_look_at(eye, target, up) bind(c, name='MatrixLookAt')
            import :: matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: eye
            type(vector3_type), intent(in), value :: target
            type(vector3_type), intent(in), value :: up
            type(matrix_type)                     :: matrix_look_at
        end function matrix_look_at

        ! Matrix MatrixMultiply(Matrix left, Matrix right)
        function matrix_multiply(left, right) bind(c, name='MatrixMultiply')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: left
            type(matrix_type), intent(in), value :: right
            type(matrix_type)                    :: matrix_multiply
        end function matrix_multiply

        ! Matrix MatrixOrtho(double left, double right, double bottom, double top, double near, double far)
        function matrix_ortho(left, right, bottom, top, near, far) bind(c, name='MatrixOrtho')
            import :: c_double, matrix_type
            implicit none
            real(kind=c_double), intent(in), value :: left
            real(kind=c_double), intent(in), value :: right
            real(kind=c_double), intent(in), value :: bottom
            real(kind=c_double), intent(in), value :: top
            real(kind=c_double), intent(in), value :: near
            real(kind=c_double), intent(in), value :: far
            type(matrix_type)                      :: matrix_ortho
        end function matrix_ortho

        ! Matrix MatrixPerspective(double fovy, double aspect, double near, double far)
        function matrix_perspective(fovy, aspect, near, far) bind(c, name='MatrixPerspective')
            import :: c_double, matrix_type
            implicit none
            real(kind=c_double), intent(in), value :: fovy
            real(kind=c_double), intent(in), value :: aspect
            real(kind=c_double), intent(in), value :: near
            real(kind=c_double), intent(in), value :: far
            type(matrix_type)                      :: matrix_perspective
        end function matrix_perspective

        ! Matrix MatrixRotate(Vector3 axis, float angle)
        function matrix_rotate(axis, angle) bind(c, name='MatrixRotate')
            import :: c_float, matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: axis
            real(kind=c_float), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate
        end function matrix_rotate

        ! Matrix MatrixRotateX(float angle)
        function matrix_rotate_x(angle) bind(c, name='MatrixRotateX')
            import :: c_float, matrix_type
            implicit none
            real(kind=c_float), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate_x
        end function matrix_rotate_x

        ! Matrix MatrixRotateXYZ(Vector3 angle)
        function matrix_rotate_xyz(angle) bind(c, name='MatrixRotateXYZ')
            import :: matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate_xyz
        end function matrix_rotate_xyz

        ! Matrix MatrixRotateY(float angle)
        function matrix_rotate_y(angle) bind(c, name='MatrixRotateY')
            import :: c_float, matrix_type
            implicit none
            real(kind=c_float), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate_y
        end function matrix_rotate_y

        ! Matrix MatrixRotateZ(float angle)
        function matrix_rotate_z(angle) bind(c, name='MatrixRotateZ')
            import :: c_float, matrix_type
            implicit none
            real(kind=c_float), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate_z
        end function matrix_rotate_z

        ! Matrix MatrixRotateZYX(Vector3 angle)
        function matrix_rotate_zyx(angle) bind(c, name='MatrixRotateZYX')
            import :: matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: angle
            type(matrix_type)                     :: matrix_rotate_zyx
        end function matrix_rotate_zyx

        ! Matrix MatrixScale(float x, float y, float z)
        function matrix_scale(x, y, z) bind(c, name='MatrixScale')
            import :: c_float, matrix_type
            implicit none
            real(kind=c_float), intent(in), value :: x
            real(kind=c_float), intent(in), value :: y
            real(kind=c_float), intent(in), value :: z
            type(matrix_type)                     :: matrix_scale
        end function matrix_scale

        ! Matrix MatrixSubtract(Matrix left, Matrix right)
        function matrix_subtract(left, right) bind(c, name='MatrixSubtract')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: left
            type(matrix_type), intent(in), value :: right
            type(matrix_type)                    :: matrix_subtract
        end function matrix_subtract

        ! float16 MatrixToFloatV(Matrix mat)
        function matrix_to_float_v(mat) bind(c, name='MatrixToFloatV')
            import :: float16_type, matrix_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            type(float16_type)                   :: matrix_to_float_v
        end function matrix_to_float_v

        ! float MatrixTrace(Matrix mat)
        function matrix_trace(mat) bind(c, name='MatrixTrace')
            import :: c_float, matrix_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            real(kind=c_float)                   :: matrix_trace
        end function matrix_trace

        ! Matrix MatrixTranslate(float x, float y, float z)
        function matrix_translate(x, y, z) bind(c, name='MatrixTranslate')
            import :: c_float, matrix_type
            implicit none
            real(kind=c_float), intent(in), value :: x
            real(kind=c_float), intent(in), value :: y
            real(kind=c_float), intent(in), value :: z
            type(matrix_type)                     :: matrix_translate
        end function matrix_translate

        ! Matrix MatrixTranspose(Matrix mat)
        function matrix_transpose(mat) bind(c, name='MatrixTranspose')
            import :: matrix_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            type(matrix_type)                    :: matrix_transpose
        end function matrix_transpose

        ! float Normalize(float value, float start, float end)
        function normalize(value, start, end) bind(c, name='Normalize')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: value
            real(kind=c_float), intent(in), value :: start
            real(kind=c_float), intent(in), value :: end
            real(kind=c_float)                    :: normalize
        end function normalize

        ! Quaternion QuaternionAdd(Quaternion q1, Quaternion q2)
        function quaternion_add(q1, q2) bind(c, name='QuaternionAdd')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            type(quaternion_type)                    :: quaternion_add
        end function quaternion_add

        ! Quaternion QuaternionAddValue(Quaternion q, float add)
        function quaternion_add_value(q, add) bind(c, name='QuaternionAddValue')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            real(kind=c_float),    intent(in), value :: add
            type(quaternion_type)                    :: quaternion_add_value
        end function quaternion_add_value

        ! Quaternion QuaternionDivide(Quaternion q1, Quaternion q2)
        function quaternion_divide(q1, q2) bind(c, name='QuaternionDivide')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            type(quaternion_type)                    :: quaternion_divide
        end function quaternion_divide

        ! int QuaternionEquals(Quaternion p, Quaternion q)
        function quaternion_equals(p, q) bind(c, name='QuaternionEquals')
            import :: c_int, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: p
            type(quaternion_type), intent(in), value :: q
            integer(kind=c_int)                      :: quaternion_equals
        end function quaternion_equals

        ! Quaternion QuaternionFromAxisAngle(Vector3 axis, float angle)
        function quaternion_from_axis_angle(axis, angle) bind(c, name='QuaternionFromAxisAngle')
            import :: c_float, quaternion_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: axis
            real(kind=c_float), intent(in), value :: angle
            type(quaternion_type)                 :: quaternion_from_axis_angle
        end function quaternion_from_axis_angle

        ! Quaternion QuaternionFromEuler(float pitch, float yaw, float roll)
        function quaternion_from_euler(pitch, yaw, roll) bind(c, name='QuaternionFromEuler')
            import :: c_float, quaternion_type
            implicit none
            real(kind=c_float), intent(in), value :: pitch
            real(kind=c_float), intent(in), value :: yaw
            real(kind=c_float), intent(in), value :: roll
            type(quaternion_type)                 :: quaternion_from_euler
        end function quaternion_from_euler

        ! Quaternion QuaternionFromMatrix(Matrix mat)
        function quaternion_from_matrix(mat) bind(c, name='QuaternionFromMatrix')
            import :: matrix_type, quaternion_type
            implicit none
            type(matrix_type), intent(in), value :: mat
            type(quaternion_type)                :: quaternion_from_matrix
        end function quaternion_from_matrix

        ! Quaternion QuaternionFromVector3ToVector3(Vector3 from, Vector3 to)
        function quaternion_from_vector3_to_vector3(from, to) bind(c, name='QuaternionFromVector3ToVector3')
            import :: quaternion_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: from
            type(vector3_type), intent(in), value :: to
            type(quaternion_type)                 :: quaternion_from_vector3_to_vector3
        end function quaternion_from_vector3_to_vector3

        ! Quaternion QuaternionIdentity(void)
        function quaternion_identity() bind(c, name='QuaternionIdentity')
            import :: quaternion_type
            implicit none
            type(quaternion_type) :: quaternion_identity
        end function quaternion_identity

        ! Quaternion QuaternionInvert(Quaternion q)
        function quaternion_invert(q) bind(c, name='QuaternionInvert')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(quaternion_type)                    :: quaternion_invert
        end function quaternion_invert

        ! float QuaternionLength(Quaternion q)
        function quaternion_length(q) bind(c, name='QuaternionLength')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            real(kind=c_float)                       :: quaternion_length
        end function quaternion_length

        ! Quaternion QuaternionLerp(Quaternion q1, Quaternion q2, float amount)
        function quaternion_lerp(q1, q2, amount) bind(c, name='QuaternionLerp')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            real(kind=c_float),    intent(in), value :: amount
            type(quaternion_type)                    :: quaternion_lerp
        end function quaternion_lerp

        ! Quaternion QuaternionMultiply(Quaternion q1, Quaternion q2)
        function quaternion_multiply(q1, q2) bind(c, name='QuaternionMultiply')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            type(quaternion_type)                    :: quaternion_multiply
        end function quaternion_multiply

        ! Quaternion QuaternionNlerp(Quaternion q1, Quaternion q2, float amount)
        function quaternion_nlerp(q1, q2, amount) bind(c, name='QuaternionNlerp')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            real(kind=c_float),    intent(in), value :: amount
            type(quaternion_type)                    :: quaternion_nlerp
        end function quaternion_nlerp

        ! Quaternion QuaternionNormalize(Quaternion q)
        function quaternion_normalize(q) bind(c, name='QuaternionNormalize')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(quaternion_type)                    :: quaternion_normalize
        end function quaternion_normalize

        ! Quaternion QuaternionScale(Quaternion q, float mul)
        function quaternion_scale(q, mul) bind(c, name='QuaternionScale')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            real(kind=c_float),    intent(in), value :: mul
            type(quaternion_type)                    :: quaternion_scale
        end function quaternion_scale

        ! Quaternion QuaternionSlerp(Quaternion q1, Quaternion q2, float amount)
        function quaternion_slerp(q1, q2, amount) bind(c, name='QuaternionSlerp')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            real(kind=c_float),    intent(in), value :: amount
            type(quaternion_type)                    :: quaternion_slerp
        end function quaternion_slerp

        ! Quaternion QuaternionSubtract(Quaternion q1, Quaternion q2)
        function quaternion_subtract(q1, q2) bind(c, name='QuaternionSubtract')
            import :: quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q1
            type(quaternion_type), intent(in), value :: q2
            type(quaternion_type)                    :: quaternion_subtract
        end function quaternion_subtract

        ! Quaternion QuaternionSubtractValue(Quaternion q, float sub)
        function quaternion_subtract_value(q, sub) bind(c, name='QuaternionSubtractValue')
            import :: c_float, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            real(kind=c_float),    intent(in), value :: sub
            type(quaternion_type)                    :: quaternion_subtract_value
        end function quaternion_subtract_value

        ! void QuaternionToAxisAngle(Quaternion q, Vector3 *outAxis, float *outAngle)
        subroutine quaternion_to_axis_angle(q, out_axis, out_angle) bind(c, name='QuaternionToAxisAngle')
            import :: c_float, quaternion_type, vector3_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(vector3_type),    intent(inout)     :: out_axis(*)
            real(kind=c_float),    intent(out)       :: out_angle
        end subroutine quaternion_to_axis_angle

        ! Vector3 QuaternionToEuler(Quaternion q)
        function quaternion_to_euler(q) bind(c, name='QuaternionToEuler')
            import :: quaternion_type, vector3_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(vector3_type)                       :: quaternion_to_euler
        end function quaternion_to_euler

        ! Matrix QuaternionToMatrix(Quaternion q)
        function quaternion_to_matrix(q) bind(c, name='QuaternionToMatrix')
            import :: matrix_type, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(matrix_type)                        :: quaternion_to_matrix
        end function quaternion_to_matrix

        ! Quaternion QuaternionTransform(Quaternion q, Matrix mat)
        function quaternion_transform(q, mat) bind(c, name='QuaternionTransform')
            import :: matrix_type, quaternion_type
            implicit none
            type(quaternion_type), intent(in), value :: q
            type(matrix_type),     intent(in), value :: mat
            type(quaternion_type)                    :: quaternion_transform
        end function quaternion_transform

        ! float Remap(float value, float inputStart, float inputEnd, float outputStart, float outputEnd)
        function remap(value, input_start, input_end, output_start, output_end) bind(c, name='Remap')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: value
            real(kind=c_float), intent(in), value :: input_start
            real(kind=c_float), intent(in), value :: input_end
            real(kind=c_float), intent(in), value :: output_start
            real(kind=c_float), intent(in), value :: output_end
            real(kind=c_float)                    :: remap
        end function remap

        ! Vector2 Vector2Add(Vector2 v1, Vector2 v2)
        function vector2_add(v1, v2) bind(c, name='Vector2Add')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type)                    :: vector2_add
        end function vector2_add

        ! Vector2 Vector2AddValue(Vector2 v, float add)
        function vector2_add_value(v, add) bind(c, name='Vector2AddValue')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: add
            type(vector2_type)                    :: vector2_add_value
        end function vector2_add_value

        ! float Vector2Angle(Vector2 v1, Vector2 v2)
        function vector2_angle(v1, v2) bind(c, name='Vector2Angle')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector2_angle
        end function vector2_angle

        ! Vector2 Vector2Clamp(Vector2 v, Vector2 min, Vector2 max)
        function vector2_clamp(v, min, max) bind(c, name='Vector2Clamp')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type), intent(in), value :: min
            type(vector2_type), intent(in), value :: max
            type(vector2_type)                    :: vector2_clamp
        end function vector2_clamp

        ! Vector2 Vector2ClampValue(Vector2 v, float min, float max)
        function vector2_clamp_value(v, min, max) bind(c, name='Vector2ClampValue')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: min
            real(kind=c_float), intent(in), value :: max
            type(vector2_type)                    :: vector2_clamp_value
        end function vector2_clamp_value

        ! float Vector2Distance(Vector2 v1, Vector2 v2)
        function vector2_distance(v1, v2) bind(c, name='Vector2Distance')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector2_distance
        end function vector2_distance

        ! float Vector2DistanceSqr(Vector2 v1, Vector2 v2)
        function vector2_distance_sqr(v1, v2) bind(c, name='Vector2DistanceSqr')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector2_distance_sqr
        end function vector2_distance_sqr

        ! Vector2 Vector2Divide(Vector2 v1, Vector2 v2)
        function vector2_divide(v1, v2) bind(c, name='Vector2Divide')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type)                    :: vector2_divide
        end function vector2_divide

        ! float Vector2DotProduct(Vector2 v1, Vector2 v2)
        function vector2_dot_product(v1, v2) bind(c, name='Vector2DotProduct')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector2_dot_product
        end function vector2_dot_product

        ! int Vector2Equals(Vector2 p, Vector2 q)
        function vector2_equals(p, q) bind(c, name='Vector2Equals')
            import :: c_int, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: p
            type(vector2_type), intent(in), value :: q
            integer(kind=c_int)                   :: vector2_equals
        end function vector2_equals

        ! Vector2 Vector2Invert(Vector2 v)
        function vector2_invert(v) bind(c, name='Vector2Invert')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type)                    :: vector2_invert
        end function vector2_invert

        ! float Vector2Length(Vector2 v)
        function vector2_length(v) bind(c, name='Vector2Length')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float)                    :: vector2_length
        end function vector2_length

        ! float Vector2LengthSqr(Vector2 v)
        function vector2_length_sqr(v) bind(c, name='Vector2LengthSqr')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float)                    :: vector2_length_sqr
        end function vector2_length_sqr

        ! Vector2 Vector2Lerp(Vector2 v1, Vector2 v2, float amount)
        function vector2_lerp(v1, v2, amount) bind(c, name='Vector2Lerp')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            real(kind=c_float), intent(in), value :: amount
            type(vector2_type)                    :: vector2_lerp
        end function vector2_lerp

        ! float Vector2LineAngle(Vector2 start, Vector2 end)
        function vector2_line_angle(start, end) bind(c, name='Vector2LineAngle')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: start
            type(vector2_type), intent(in), value :: end
            real(kind=c_float)                    :: vector2_line_angle
        end function vector2_line_angle

        ! Vector2 Vector2MoveTowards(Vector2 v, Vector2 target, float maxDistance)
        function vector2_move_towards(v, target, max_distance) bind(c, name='Vector2MoveTowards')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type), intent(in), value :: target
            real(kind=c_float), intent(in), value :: max_distance
            type(vector2_type)                    :: vector2_move_towards
        end function vector2_move_towards

        ! Vector2 Vector2Multiply(Vector2 v1, Vector2 v2)
        function vector2_multiply(v1, v2) bind(c, name='Vector2Multiply')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type)                    :: vector2_multiply
        end function vector2_multiply

        ! Vector2 Vector2Negate(Vector2 v)
        function vector2_negate(v) bind(c, name='Vector2Negate')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type)                    :: vector2_negate
        end function vector2_negate

        ! Vector2 Vector2Normalize(Vector2 v)
        function vector2_normalize(v) bind(c, name='Vector2Normalize')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type)                    :: vector2_normalize
        end function vector2_normalize

        ! Vector2 Vector2One(void)
        function vector2_one() bind(c, name='Vector2One')
            import :: vector2_type
            implicit none
            type(vector2_type) :: vector2_one
        end function vector2_one

        ! Vector2 Vector2Reflect(Vector2 v, Vector2 normal)
        function vector2_reflect(v, normal) bind(c, name='Vector2Reflect')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(vector2_type), intent(in), value :: normal
            type(vector2_type)                    :: vector2_reflect
        end function vector2_reflect

        ! Vector2 Vector2Rotate(Vector2 v, float angle)
        function vector2_rotate(v, angle) bind(c, name='Vector2Rotate')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: angle
            type(vector2_type)                    :: vector2_rotate
        end function vector2_rotate

        ! Vector2 Vector2Scale(Vector2 v, float scale)
        function vector2_scale(v, scale) bind(c, name='Vector2Scale')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: scale
            type(vector2_type)                    :: vector2_scale
        end function vector2_scale

        ! Vector2 Vector2Subtract(Vector2 v1, Vector2 v2)
        function vector2_subtract(v1, v2) bind(c, name='Vector2Subtract')
            import :: vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v1
            type(vector2_type), intent(in), value :: v2
            type(vector2_type)                    :: vector2_subtract
        end function vector2_subtract

        ! Vector2 Vector2SubtractValue(Vector2 v, float sub)
        function vector2_subtract_value(v, sub) bind(c, name='Vector2SubtractValue')
            import :: c_float, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: sub
            type(vector2_type)                    :: vector2_subtract_value
        end function vector2_subtract_value

        ! Vector2 Vector2Transform(Vector2 v, Matrix mat)
        function vector2_transform(v, mat) bind(c, name='Vector2Transform')
            import :: matrix_type, vector2_type
            implicit none
            type(vector2_type), intent(in), value :: v
            type(matrix_type),  intent(in), value :: mat
            type(vector2_type)                    :: vector2_transform
        end function vector2_transform

        ! Vector2 Vector2Zero(void)
        function vector2_zero() bind(c, name='Vector2Zero')
            import :: vector2_type
            implicit none
            type(vector2_type) :: vector2_zero
        end function vector2_zero

        ! Vector3 Vector3Add(Vector3 v1, Vector3 v2)
        function vector3_add(v1, v2) bind(c, name='Vector3Add')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_add
        end function vector3_add

        ! Vector3 Vector3AddValue(Vector3 v, float add)
        function vector3_add_value(v, add) bind(c, name='Vector3AddValue')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: add
            type(vector3_type)                    :: vector3_add_value
        end function vector3_add_value

        ! float Vector3Angle(Vector3 v1, Vector3 v2)
        function vector3_angle(v1, v2) bind(c, name='Vector3Angle')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector3_angle
        end function vector3_angle

        ! Vector3 Vector3Barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c)
        function vector3_barycenter(p, a, b, c) bind(c, name='Vector3Barycenter')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: p
            type(vector3_type), intent(in), value :: a
            type(vector3_type), intent(in), value :: b
            type(vector3_type), intent(in), value :: c
            type(vector3_type)                    :: vector3_barycenter
        end function vector3_barycenter

        ! Vector3 Vector3Clamp(Vector3 v, Vector3 min, Vector3 max)
        function vector3_clamp(v, min, max) bind(c, name='Vector3Clamp')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type), intent(in), value :: min
            type(vector3_type), intent(in), value :: max
            type(vector3_type)                    :: vector3_clamp
        end function vector3_clamp

        ! Vector3 Vector3ClampValue(Vector3 v, float min, float max)
        function vector3_clamp_value(v, min, max) bind(c, name='Vector3ClampValue')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: min
            real(kind=c_float), intent(in), value :: max
            type(vector3_type)                    :: vector3_clamp_value
        end function vector3_clamp_value

        ! Vector3 Vector3CrossProduct(Vector3 v1, Vector3 v2)
        function vector3_cross_product(v1, v2) bind(c, name='Vector3CrossProduct')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_cross_product
        end function vector3_cross_product

        ! float Vector3Distance(Vector3 v1, Vector3 v2)
        function vector3_distance(v1, v2) bind(c, name='Vector3Distance')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector3_distance
        end function vector3_distance

        ! float Vector3DistanceSqr(Vector3 v1, Vector3 v2)
        function vector3_distance_sqr(v1, v2) bind(c, name='Vector3DistanceSqr')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector3_distance_sqr
        end function vector3_distance_sqr

        ! Vector3 Vector3Divide(Vector3 v1, Vector3 v2)
        function vector3_divide(v1, v2) bind(c, name='Vector3Divide')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_divide
        end function vector3_divide

        ! float Vector3DotProduct(Vector3 v1, Vector3 v2)
        function vector3_dot_product(v1, v2) bind(c, name='Vector3DotProduct')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            real(kind=c_float)                    :: vector3_dot_product
        end function vector3_dot_product

        ! int Vector3Equals(Vector3 p, Vector3 q)
        function vector3_equals(p, q) bind(c, name='Vector3Equals')
            import :: c_int, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: p
            type(vector3_type), intent(in), value :: q
            integer(kind=c_int)                   :: vector3_equals
        end function vector3_equals

        ! Vector3 Vector3Invert(Vector3 v)
        function vector3_invert(v) bind(c, name='Vector3Invert')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type)                    :: vector3_invert
        end function vector3_invert

        ! float Vector3Length(const Vector3 v)
        function vector3_length(v) bind(c, name='Vector3Length')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float)                    :: vector3_length
        end function vector3_length

        ! float Vector3LengthSqr(const Vector3 v)
        function vector3_length_sqr(v) bind(c, name='Vector3LengthSqr')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float)                    :: vector3_length_sqr
        end function vector3_length_sqr

        ! Vector3 Vector3Lerp(Vector3 v1, Vector3 v2, float amount)
        function vector3_lerp(v1, v2, amount) bind(c, name='Vector3Lerp')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            real(kind=c_float), intent(in), value :: amount
            type(vector3_type)                    :: vector3_lerp
        end function vector3_lerp

        ! Vector3 Vector3Max(Vector3 v1, Vector3 v2)
        function vector3_max(v1, v2) bind(c, name='Vector3Max')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_max
        end function vector3_max

        ! Vector3 Vector3Min(Vector3 v1, Vector3 v2)
        function vector3_min(v1, v2) bind(c, name='Vector3Min')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_min
        end function vector3_min

        ! Vector3 Vector3Multiply(Vector3 v1, Vector3 v2)
        function vector3_multiply(v1, v2) bind(c, name='Vector3Multiply')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_multiply
        end function vector3_multiply

        ! Vector3 Vector3Negate(Vector3 v)
        function vector3_negate(v) bind(c, name='Vector3Negate')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type)                    :: vector3_negate
        end function vector3_negate

        ! Vector3 Vector3Normalize(Vector3 v)
        function vector3_normalize(v) bind(c, name='Vector3Normalize')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type)                    :: vector3_normalize
        end function vector3_normalize

        ! Vector3 Vector3One(void)
        function vector3_one() bind(c, name='Vector3One')
            import :: vector3_type
            implicit none
            type(vector3_type) :: vector3_one
        end function vector3_one

        ! void Vector3OrthoNormalize(Vector3 *v1, Vector3 *v2)
        subroutine vector3_ortho_normalize(v1, v2) bind(c, name='Vector3OrthoNormalize')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(inout) :: v1(*)
            type(vector3_type), intent(inout) :: v2(*)
        end subroutine vector3_ortho_normalize

        ! Vector3 Vector3Perpendicular(Vector3 v)
        function vector3_perpendicular(v) bind(c, name='Vector3Perpendicular')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type)                    :: vector3_perpendicular
        end function vector3_perpendicular

        ! Vector3 Vector3Reflect(Vector3 v, Vector3 normal)
        function vector3_reflect(v, normal) bind(c, name='Vector3Reflect')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type), intent(in), value :: normal
            type(vector3_type)                    :: vector3_reflect
        end function vector3_reflect

        ! Vector3 Vector3Refract(Vector3 v, Vector3 n, float r)
        function vector3_refract(v, n, r) bind(c, name='Vector3Refract')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type), intent(in), value :: n
            real(kind=c_float), intent(in), value :: r
            type(vector3_type)                    :: vector3_refract
        end function vector3_refract

        ! Vector3 Vector3RotateByAxisAngle(Vector3 v, Vector3 axis, float angle)
        function vector3_rotate_by_axis_angle(v, axis, angle) bind(c, name='Vector3RotateByAxisAngle')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(vector3_type), intent(in), value :: axis
            real(kind=c_float), intent(in), value :: angle
            type(vector3_type)                    :: vector3_rotate_by_axis_angle
        end function vector3_rotate_by_axis_angle

        ! Vector3 Vector3RotateByQuaternion(Vector3 v, Quaternion q)
        function vector3_rotate_by_quaternion(v, q) bind(c, name='Vector3RotateByQuaternion')
            import :: quaternion_type, vector3_type
            implicit none
            type(vector3_type),    intent(in), value :: v
            type(quaternion_type), intent(in), value :: q
            type(vector3_type)                       :: vector3_rotate_by_quaternion
        end function vector3_rotate_by_quaternion

        ! Vector3 Vector3Scale(Vector3 v, float scalar)
        function vector3_scale(v, scalar) bind(c, name='Vector3Scale')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: scalar
            type(vector3_type)                    :: vector3_scale
        end function vector3_scale

        ! Vector3 Vector3Subtract(Vector3 v1, Vector3 v2)
        function vector3_subtract(v1, v2) bind(c, name='Vector3Subtract')
            import :: vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v1
            type(vector3_type), intent(in), value :: v2
            type(vector3_type)                    :: vector3_subtract
        end function vector3_subtract

        ! Vector3 Vector3SubtractValue(Vector3 v, float sub)
        function vector3_subtract_value(v, sub) bind(c, name='Vector3SubtractValue')
            import :: c_float, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            real(kind=c_float), intent(in), value :: sub
            type(vector3_type)                    :: vector3_subtract_value
        end function vector3_subtract_value

        ! float3 Vector3ToFloatV(Vector3 v)
        function vector3_to_float_v(v) bind(c, name='Vector3ToFloatV')
            import :: float3_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(float3_type)                     :: vector3_to_float_v
        end function vector3_to_float_v

        ! Vector3 Vector3Transform(Vector3 v, Matrix mat)
        function vector3_transform(v, mat) bind(c, name='Vector3Transform')
            import :: matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: v
            type(matrix_type),  intent(in), value :: mat
            type(vector3_type)                    :: vector3_transform
        end function vector3_transform

        ! Vector3 Vector3Unproject(Vector3 source, Matrix projection, Matrix view)
        function vector3_unproject(source, projection, view) bind(c, name='Vector3Unproject')
            import :: matrix_type, vector3_type
            implicit none
            type(vector3_type), intent(in), value :: source
            type(matrix_type),  intent(in), value :: projection
            type(matrix_type),  intent(in), value :: view
            type(vector3_type)                    :: vector3_unproject
        end function vector3_unproject

        ! Vector3 Vector3Zero(void)
        function vector3_zero() bind(c, name='Vector3Zero')
            import :: vector3_type
            implicit none
            type(vector3_type) :: vector3_zero
        end function vector3_zero

        ! float Wrap(float value, float min, float max)
        function wrap(value, min, max) bind(c, name='Wrap')
            import :: c_float
            implicit none
            real(kind=c_float), intent(in), value :: value
            real(kind=c_float), intent(in), value :: min
            real(kind=c_float), intent(in), value :: max
            real(kind=c_float)                    :: wrap
        end function wrap
    end interface
end module raylib_math
