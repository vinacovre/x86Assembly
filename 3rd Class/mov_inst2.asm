	SECTION .data

char: db 'Assembly'		;the string to print

	SECTION .text

global _start

_start:

	mov eax,4 		; write sysout command to int 80 hex
	mov edx,1 		; arg3, number of characters to print
	mov ebx,1 		; arg1, where to write, screen

	mov ecx,char 	; arg2, pointer to string

	int 0x80 		; interrupt 80 hex, call kernel

	;********************************************************

	mov edx,1 		; arg3, number of characters to print
	mov ebx,1 		; arg1, where to write, screen
	mov ecx,char 	; arg2, pointer to string

	add ecx,1
	mov eax,4 		; write sysout command to int 80 hex

	int 0x80 		; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,0 		; exit command, 0=normal
	mov eax,1 		; exit command to kernel
	int 0x80 		; interrupt 80 hex, call kernel
