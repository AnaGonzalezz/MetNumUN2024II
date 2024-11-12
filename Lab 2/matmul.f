
      program matmul_fortran
        implicit none

        real :: A(2,2), B(2,2), C(2,2)

        A = reshape([567.0, 890.0, 436.0, 567.0], [2, 2])
        B = reshape([748.0, 572.0, 902.0, 628.0], [2, 2])

        call matmul_2x2(A, B, C)

        print *, 'Resultado de A * B:'
        print *, C
      end program matmul_fortran

      subroutine matmul_2x2(A, B, C)
        implicit none
        real,intent(in) :: A(2,2), B(2,2)
        real,intent(out) :: C(2,2)
        integer :: i, j, k
        
        C=0.0

        do i = 1, 2
          do j = 1, 2
              do k = 1, 2
                  C(i, j) = C(i, j) + A(i, k) * B(k, j)
              end do
          end do
        end do
      end subroutine matmul_2x2      
