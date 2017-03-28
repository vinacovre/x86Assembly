	SECTION .data

char: 	db 	'A'

	SECTION .text

global _start

_start:
	mov eax,4 					; write sysout command to int 80 hex
	
	;add eax,0x30
	add eax,48					; to get ASCII value

	mov [char],eax

	;********************************************************

	mov ebx,1 					; arg1, where to write, screen
	mov edx,1 					; arg3, number of characters to print

	mov eax,4 					; write sysout command to int 80 hex
	mov ecx,char	 			; arg2, pointer to string
	int 0x80 					; interrupt 80 hex, call kernel

	;*****************************END*****************************

	mov ebx,0 					; exit command, 0=normal
	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel
