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

#define L           3
#define scalar      5

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

int main() {

    int A[L][L];    // input A matrix
    int C[L][L];    // input C matrix
    int R1[L][L];   // resulting matrix of scalar*A operation
    int R2[L][L];   // resulting matrix of (scalar*A)xC operation

    int i, j, smallest;
    srand(time(NULL));
    for(i = 0; i<L; i++)
        for(j = 0; j<L; j++) {
            A[i][j] = rand() % 10+1;
            C[i][j] = rand() % 10+1;
        }

    printf("Original matrix A:\n");
    print_matrix(A);

    printf("\nOriginal matrix C:\n");
    print_matrix(C);

    printf("\nResulting Matrix (%d*A)*C:\n", scalar);

    clock_t begin = clock();
    smallest = calculate_C(A,C);
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("\nTime in C: %.10f\n", time_spent);

    extern int scalarTimesA_ASM(int, int, int *, int *);
    begin = clock();
    scalarTimesA_ASM(L,scalar,*A,*R1); // R1 = scalar*A
    matrixMultiplication_ASM(L,*R1,*C,*R2); // R2 = C x R1
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("\nTime in NASM: %.10f\n", time_spent);

    printf("\n%d * A in ASM:\n", scalar);
    print_matrix(R1);

    // extern int scalarTimesA_GAS(int, int, int *, int *);
    // begin = clock();
    // scalarTimesA_GAS(L,scalar,*A,*R1); // R1 = scalar*A
    // matrixMultiplication_GAS(L,*R1,*C,*R2); // R2 = C x R1
    // end = clock();
    // time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    // printf("\nTime in GAS: %.10f\n", time_spent);

    // printf("\n%d * A in GAS:\n", scalar);
    // print_matrix(R1);

    printf("\nSmallest value in the main diagonal: %d", smallest);
    return 0;
}
