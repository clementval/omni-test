module useful
  integer, parameter :: N=2
  double precision, parameter :: xmin=1, xmax=10, pi=3.1415926535898
  double complex :: green(N,N), solution(N), k=(2.0,0.0)
contains
  subroutine y(n1)
  contains
    function x(n1)
      real :: n1, x
      x=n1*(xmax-xmin)/N
    end function x
  end subroutine y
end module useful
