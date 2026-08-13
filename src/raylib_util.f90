! Author:  Philipp Engel
! Licence: ISC
module raylib_util
    !! Utility procedures for C inter-operability with raylib.
    use, intrinsic :: iso_c_binding
    implicit none (type, external)
    private

    public :: c_strlen

    interface
        function c_strlen(str) bind(c, name='strlen')
            import :: c_ptr, c_size_t
            implicit none
            type(c_ptr), intent(in), value :: str
            integer(c_size_t)              :: c_strlen
        end function c_strlen
    end interface

    public :: c_f_str_ptr
    public :: f_c_str
contains
    subroutine c_f_str_ptr(c, f)
        !! Copies a C string, passed as a C pointer, to a Fortran string.
        type(c_ptr),               intent(in)  :: c !! C string pointer.
        character(:), allocatable, intent(out) :: f !! Fortran string.

        copy_block: block
            integer(c_size_t) :: n

            if (.not. c_associated(c)) exit copy_block
            n = c_strlen(c)
            if (n <= 0) exit copy_block

            block
                character(n), pointer :: ptr
                call c_f_pointer(c, ptr)
                f = ptr
            end block

            return
        end block copy_block

        if (.not. allocated(f)) f = ''
    end subroutine c_f_str_ptr

    pure function f_c_str(f) result(c)
        !! Returns trimmed `string` with appended null-termination.
        character(*), intent(in)   :: f !! Fortran string.
        character(len_trim(f) + 1) :: c !! Null-terminated string.

        c = trim(f) // c_null_char
    end function f_c_str
end module raylib_util
