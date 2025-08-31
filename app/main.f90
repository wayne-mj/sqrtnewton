program main
  use iso_fortran_env, only : real32, real64, real128, int32, int64
  use sqrtnewton
  implicit none
  
  type(sqrtype)   :: t
  real(real128)   :: n128
  real(real64)    :: n64
  real(real32)    :: n32
  
  
  n128 = ((255**2) * 2) - 1
  n64 = ((255**2) * 2) - 1
  n32 = ((255**2) * 2) - 1

  t = sqr_root(n128)

  !print *, t%sqr128,t%iterations, t%msg
  write (*, '(F64.56,I5,A,A)') t%sqr128, T%iterations, " ", t%msg

  t = sqr_root(n64)

  ! print *, t%sqr64,t%iterations, t%msg
  write (*, '(F64.56,I5,A,A)') t%sqr64, T%iterations, " ", t%msg

  t = sqr_root(n32)

  ! print *, t%sqr32,t%iterations, t%msg
  write (*, '(F64.56,I5,A,A)') t%sqr32, T%iterations, " ", t%msg
end program main
