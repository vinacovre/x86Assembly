/*
Projeto Final - Linguagem de Montagem - 2017
Ciência da Computação (noturno)
Prof. Dr. Daniel Carlos Guimarães Pedronette

Grupo 4:
- Gabriel Torres
- Jonas Ritter
- Mayara Ramos
- Vinicius Covre

Tarefa:
(5A x C); retornando o menor valor da diagonal principal.
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define L 5

/*
nasm -f elf -o outputNASM2.o scalarTimesA_ASM.asm
as --32 -o outputGAS2.o scalarTimesA_GAS.s
gcc -m32 -o project.out main.c *.o
./project.out
*/

void print_matrix(int M[][L]) {
    int i, j;
    for(i = 0; i<L; i++) {
        printf("|");
        for(j = 0; j<L; j++)
            printf("\t%d", M[i][j]);
        printf("\t|\n");
    }
}

int calculate_C(int A[][L], int C[][L]) {

    int T[L][L]; // temporary matrix
    int R[L][L]; // resulting matrix

    // multiplies matrix A by scalar in T
    int i, j, k;
    for(i = 0; i<L; i++)
        for(j = 0; j<L; j++) {
            T[i][j] = A[i][j] * scalar;
        }

    // multiplies matrix scalar*A by the C matrix in R
    for(i = 0; i<L; i++)
        for(j = 0; j<L; j++) {
            R[i][j] = 0;
            for(k = 0; k<L; ++k)
                R[i][j] += T[i][k] * C[k][j];
        }

    print_matrix(R);

    // gets the smallest value of the main diagonal
    int smallest = R[0][0];
    for(i = 0; i<L; i++)
        if (R[i][i] < smallest)
            smallest = R[i][i];

    return smallest;
}

void scalarTimesA_C(int sizeL, int A[][L], int output[][L]){
  int i, j;
  for(i = 0; i<sizeL; i++)
      for(j = 0; j<sizeL; j++) {
          output[i][j] = A[i][j] * scalar;
      }
}

int main() {

    int A[L][L];            // input A matrix
    int C[L][L];            // input C matrix
    int outputC[L][L];      // resulting matrix of 5*A operation
    int outputNASM[L][L];   // resulting matrix of 5*A operation
    int outputGAS[L][L];    // resulting matrix of 5*A operation

    int i, j, smallest;
    srand(time(NULL));
    for(i = 0; i<L; i++)
        for(j = 0; j<L; j++) {
            A[i][j] = rand() % 10+1;
            C[i][j] = rand() % 10+1;
        }

    // printf("Original matrix A:\n");
    // print_matrix(A);

    // printf("\nOriginal matrix C:\n");
    // print_matrix(C);

    clock_t begin = clock();
    scalarTimesA_C(L, A, outputC);
    clock_t end = clock();
    float time_spent = (float)(end - begin) / CLOCKS_PER_SEC;
    // printf("\nResulting Matrix (5*A) in C:\n");
    // print_matrix(outputC);    
    printf("\nTime in C: %.6f\n", time_spent);

    extern int scalarTimesA_ASM(int, int, int *, int *);
    begin = clock();
    scalarTimesA_ASM(L,5,*A,*outputNASM); // output = 5*A
    end = clock();
    time_spent = (float)(end - begin) / CLOCKS_PER_SEC;
    // printf("\nResulting Matrix (5*A) in NASM:\n");
    // print_matrix(outputNASM);   
    printf("\nTime in NASM: %.6f\n", time_spent);

    extern int scalarTimesA_GAS(int, int, int *, int *);
    begin = clock();
    scalarTimesA_GAS(L,5,*A,*outputGAS); // output = 5*A
    end = clock();
    time_spent = (float)(end - begin) / CLOCKS_PER_SEC;
    // printf("\nResulting Matrix (5*A) in GAS:\n");
    // print_matrix(outputGAS);   
    printf("\nTime in GAS: %.6f\n", time_spent);

    // printf("\nSmallest value in the main diagonal: %d\n", smallest);
    return 0;
}
