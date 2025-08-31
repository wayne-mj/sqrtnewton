!> This is a rewrite of a REXX script that I saw that I thought I would try and see
!> if I could try in Fortran for fun.
!> I have been doing some courses on z/OS that included REXX programming and it included such.

module sqrtnewton
  use iso_fortran_env, only: real32, real64, real128
  implicit none
  
  private
  
  !> Define the max iterations incase there is a run away scenario
  integer, parameter        :: MAX_ITER   =   100

  !> Tolerances for supported REAL kinds
  real(real128), parameter  :: tol_128    =   1.0e-32_real128
  real(real64), parameter   :: tol_64     =   1.0e-32_real64
  real(real32), parameter   :: tol_32     =   1.0e-32_real32

  !> Return data type
  type sqrtype
    real(real128)   ::  sqr128
    real(real64)    ::  sqr64
    real(real32)    ::  sqr32
    integer         ::  iterations
    character(32)    ::  msg
  end type

  public :: sqr_root, sqrtype

  interface sqr_root
    module procedure sqr_root_32, sqr_root_64, sqr_root_128
  end interface
contains
  
  !> Square root for 32bit numbers
  function sqr_root_32(num) result(res)
    real(real32), intent(in)    :: num 
    type(sqrtype)               :: res 
    real(real32)                :: r1,r2, tol, num2
    integer                     :: iter

    !> Set tolerance to 32bit tolerance
    tol = tol_32
    iter = 0
    r1 = 1.
    r2 = 0

    !> If the number is negative, correct and continue
    if (num .lt. 0. ) then
      num2 = num * (-1.)
      res%msg = "Negative number corrected"
    else 
      num2 = num
      res%msg = "OK"
    end if

    do
     r2 = (num2 / r1 + r1 ) /2
     if ((abs(r2 - r1) .lt. tol) .or.(iter .ge. MAX_ITER)) exit
     r1 = r2
     iter = iter + 1  
    end do

    res%sqr32 = r1
    res%iterations = iter
  end function
  
  !> Square root for 64bit numbers
  function sqr_root_64(num) result(res)
    real(real64), intent(in)    :: num 
    type(sqrtype)               :: res
    real(real64)                :: r1,r2, tol, num2
    integer                     :: iter 

    !> Set tolerance to 64bit tolerance
    tol = tol_64
    iter = 0
    r1 = 1.
    r2 = 0

    !> If the number is negative, correct and continue
    if (num .lt. 0. ) then
      num2 = num * (-1.)
      res%msg = "Negative number corrected"
    else 
      num2 = num
      res%msg = "OK"
    end if

    do
     r2 = (num2 / r1 + r1 ) /2
     if ((abs(r2 - r1) .lt. tol) .or.(iter .ge. MAX_ITER)) exit
     r1 = r2
     iter = iter + 1
    end do

    res%sqr64 = r1
    res%iterations = iter
  end function

  !> Square root for 128bit numbers
  function sqr_root_128(num) result(res)
    real(real128), intent(in)   :: num  
    type(sqrtype)               :: res
    real(real128)               :: r1,r2, tol, num2
    integer                     :: iter 

    !> Set tolerance to 128bit tolerance
    tol = tol_128
    iter = 0
    r1 = 1.
    r2 = 0

    !> If the number is negative, correct and continue
    if (num .lt. 0. ) then
      num2 = num * (-1.)
      res%msg = "Negative number corrected"
    else 
      num2 = num
      res%msg = "OK"
    end if

    do
     r2 = (num2 / r1 + r1 ) /2
     if ((abs(r2 - r1) .lt. tol) .or.(iter .ge. MAX_ITER)) exit
     r1 = r2
     iter = iter + 1  
    end do

    res%sqr128 = r1
    res%iterations = iter
  end function
end module sqrtnewton
