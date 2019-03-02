subroutine calc_basel(threshold)
use param
!    implicit none
    real(kind=8) :: sum,error,n
    real(kind=8), intent(in) :: threshold
    integer :: iterate
    open(20, file='results.txt', status='new')
    sum = 0
    n = 1
    iterate = 1
    error = 1

!    print *, "threshold = ",(threshold)

    DO WHILE (error > threshold)
        sum = sum + ((1)/(n*n))
        error = ((pi*pi)/6) - sum
        n = n+1
        iterate = iterate+1
            IF (mod(iterate,1000) == 0) THEN
                write(20,*) "n = ",(iterate),"error = ", ((pi*pi)/6) - sum
            END IF
    END DO
print *, "total number of cycles: ",(iterate)
print *, "numerical solution: ",(sum)
print *, "error: ",(error)
close(20)
end subroutine calc_basel
