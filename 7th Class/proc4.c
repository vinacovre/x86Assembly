#include <stdio.h>

int main () {
	int v1=10; int v2=30;
	int r = sum_asm(v1,v2);
	printf("Valor da Soma: %d \n", r);
}

int sum (int n1, int n2){
	return n1+n2;
}

int sum_asm (int n1, int n2) {
	asm("mov 12(%ebp), %ebx");
	asm("mov 8(%ebp), %eax");
	asm("add %ebx, %eax");
	//asm("mov 12(%ebp), %eax")
}
