#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define L 3

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

    // multiplies matrix A by 5 in T
    int i, j, k;
    for(i = 0; i<L; i++)
        for(j = 0; j<L; j++) {
            T[i][j] = A[i][j] * 5;
        }

    // multiplies matrix 5*A by the C matrix in R
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

    int A[L][L];
    int C[L][L];

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

    printf("\nResulting Matrix (5*A)*C:\n");

    clock_t begin = clock();
    // int R[L][L] = A;
    smallest = calculate_C(A,C);
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("\nTime in C: %f\n", time_spent);

    // extern int calculate_ASM(int[][3], int[][3]);
    extern int test(int, int, int[][3]);
    begin = clock();
    // smallest = calculate_ASM(A, C);
    smallest = test(L,5,A);
    end = clock();
    time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("\nTime in NASM: %f\n", time_spent);

    // extern int calculate_GAS(int, int);
    // begin = clock();
    // smallest = calculate_GAS(A, C);
    // end = clock();
    // time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    // printf("\nTime in GAS: %f\n", time_spent);

    printf("\nSmallest value in the main diagonal: %d", smallest);
    return 0;
}
