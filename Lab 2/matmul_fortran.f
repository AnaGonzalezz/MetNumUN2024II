      program matmul_fortran
        implicit none
        real, dimension(600,100) :: A
        real, dimension(100,600) :: B
        real, dimension(600,600) :: C
        integer :: m, n, i
        real(8) :: start_time, end_time, time_sum

        
        interface
            subroutine matmul_for(A, B, out)
                real, intent(in) :: A(:,:)
                real, intent(in) :: B(:,:)
                real, intent(out) :: out(size(A,1), size(B,2))
            end subroutine matmul_for
        end interface

     
        m = 600
        n = 100

        time_sum = 0.0

        do i=1,10
          call generar_matriz_aleatoria(m, n, A)
          call generar_matriz_aleatoria(n, m, B)
          call cpu_time(start_time)
          call matmul_for(A, B, C)
          call cpu_time(end_time)
          time_sum = time_sum + (end_time - start_time)
        
        end do
        print *, time_sum / 10.0

      end program matmul_fortran

      subroutine generar_matriz_aleatoria(m, n, out)
        implicit none
        integer, intent(in) :: m, n
        real(4), dimension(m, n), intent(out) :: out
        integer :: row, col

        
        call random_seed()
        call random_number(out)

        
        do row = 1, m
            do col = 1, n
                out(row, col) = out(row, col) * 10.0
            end do
        end do
      end subroutine generar_matriz_aleatoria

      subroutine matmul_for(A, B, out)
        implicit none
        real, intent(in) :: A(:,:)
        real, intent(in) :: B(:,:)
        real, intent(out) :: out(size(A,1), size(B,2))
        integer :: i, j, k
        integer :: rows_out, cols, rows, cols_out

        rows_out = size(A, 1)
        cols = size(A, 2)
        rows = size(B, 1)
        cols_out = size(B, 2)

        
        if (cols /= rows) then
          print *, 'Error:Las matrices no se pueden multiplicar'
          stop
        end if

        
        out = 0.0

        
        do i = 1, rows_out
          do j = 1, cols_out
            do k = 1, cols
              out(i, j) = out(i, j) + A(i, k) * B(k, j)
            end do
          end do
        end do
      end subroutine matmul_for
