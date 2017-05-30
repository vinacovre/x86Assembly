#include <stdio.h>

// as --32 -o sum.o sum.s
// gcc -m32 -o proc6.out proc6.c sum.o

int main () {
  int v1=10;
  int v2=30;
  int r=0;
  extern int sum_asm (int, int);
  r = sum_asm(v1,v2);
  printf("Valor da soma: %d \n", r);
}
