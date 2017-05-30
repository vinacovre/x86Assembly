#include <stdio.h>

// https://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
// Compile: gcc -m32 proc4.c
// Install: sudo apt-get install gcc-multilib

int sum_asm (int n1, int n2);

int main () {
    int v1=10;
    int v2=30;
    int r = sum_asm(v1,v2);
    printf("Sum value: %d\n", r);
}

int sum (int n1, int n2) {
    return n1+n2;
}

int sum_asm (int n1, int n2) {
    asm ("mov 12(%ebp), %ebx");
    asm ("mov 8(%ebp), %eax");
    asm ("add %ebx, %eax");
    // asm ("mov 12(%ebp), %eax");
}
