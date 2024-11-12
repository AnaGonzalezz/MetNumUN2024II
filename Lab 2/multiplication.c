

#include <stdio.h>

int rand();
int main() {
  int matriza[600][100];
  int matrizb[100][600];
  int matrizf[100][100];

//Fill matrix A
for(int i = 0 ; i < 600 ; i++){
    for(int j = 0 ; j < 100 ; j++){
        matriza[i][j] = rand()%10;
      }
    }
// Fill matrix B
for(int i = 0 ; i < 100 ; i++){
    for(int j = 0 ; j < 600 ; j++){
        matrizb[i][j] = rand()%10;
      }
    }


for (int i = 0; i < 100; i++) {
      for (int j = 0; j < 100; j++) {
        int a = 0;
         for (int k = 0; k < 600; k++) {
            a += matriza[k][j] * matrizb[i][k];
         }
         matrizf[i][j] = a;
      }
   }

/*
for (int i = 0; i < 100; ++i) {
    for (int j = 0; j < 100; ++j) {
        printf("%d  ", matrizf[i][j]);
        if (j == 99){
          printf("\n");
        }
    }
  }
*/
}
