#include <iostream>
#include <cstdlib>
using namespace std;

int main()
{
  int mat1[100][600];
  int mat2[600][100];

  int resp[100][100];

  for(int i = 0 ; i < 100 ; i++){
    for(int j = 0 ; j < 600 ; j++){
      mat1[i][j] = 1+(rand() % 9);
    }
  }

  for(int i = 0 ; i < 600 ; i++){
    for(int j = 0 ; j < 100 ; j++){
      mat2[i][j] = 1+(rand() % 9);
    }
  }

  for(int i = 0 ; i < 100 ; i++){
    for(int j = 0 ; j < 100 ; j++){
      int aux = 0;
      for(int k = 0 ; k < 600 ; k++){
        aux += mat1[i][k] * mat2[k][j];
      }
      resp[i][j] = aux;
    }
  }

  /*for(int i = 0 ; i < 100 ; i++){
    for(int j = 0 ; j < 100 ; j++){
      cout << resp[i][j] << " ";
    }
    cout << endl;
  }*/

}
