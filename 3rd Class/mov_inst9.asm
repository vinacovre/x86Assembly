;******************************************************************
; Example of XCHG
;******************************************************************
	SECTION .data

univ: 	db 	'UNESP', 0x0A

	SECTION .text

global _start

_start:

	mov eax,4 					; write sysout command to int 80 hex	
	mov ebx,1 					; arg1, where to write, screen

	mov edx,univ 				; arg3, number of characters to print
	mov ecx,6	 				; arg2, pointer to string
	xchg ecx,edx

	int 0x80 					; interrupt 80 hex, call kernel
	
	mov ebx,0					; exit code, 0=normal
	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel
