#include <stdio.h>

// nasm -f elf -o sum_asm.o sum_asm.s
// gcc -m32 -o proc7.out proc7.c sum_asm.o

int main () {
  int v1=10;
  int v2=30;
  int r=0;
  extern int sum_asm (int, int);
  r = sum_asm(v1,v2);
  printf("Valor da soma: %d \n", r);
}
