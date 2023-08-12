! raylib_util.f90
!
! Utility procedures for C inter-operability with raylib.
!
! Author:  Philipp Engel
! Licence: ISC
module raylib_util
    use, intrinsic :: iso_c_binding
    implicit none (type, external)
    private

    private :: copy

    public :: c_f_str_ptr

    interface
        function c_strlen(str) bind(c, name='strlen')
            import :: c_ptr, c_size_t
            type(c_ptr), intent(in), value :: str
            integer(c_size_t)              :: c_strlen
        end function c_strlen
    end interface
contains
    pure function copy(a)
        character, intent(in)  :: a(:)
        character(len=size(a)) :: copy
        integer(kind=8)        :: i

        do i = 1, size(a)
            copy(i:i) = a(i)
        end do
    end function copy

    subroutine c_f_str_ptr(c_str, f_str)
        !! Copies a C string, passed as a C pointer, to a Fortran string.
        type(c_ptr),                   intent(in)  :: c_str
        character(len=:), allocatable, intent(out) :: f_str

        character(kind=c_char), pointer :: ptrs(:)
        integer(kind=c_size_t)          :: sz

        copy_block: block
            if (.not. c_associated(c_str)) exit copy_block
            sz = c_strlen(c_str)
            if (sz < 0) exit copy_block
            call c_f_pointer(c_str, ptrs, [ sz ])
            allocate (character(len=sz) :: f_str)
            f_str = copy(ptrs)
            return
        end block copy_block

        if (.not. allocated(f_str)) f_str = ''
    end subroutine c_f_str_ptr
end module raylib_util
