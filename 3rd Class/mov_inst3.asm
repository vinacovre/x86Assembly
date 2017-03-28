	SECTION .data

depto: 		db 	'DEMAC', 0AH	;the string to print
unidade:	DB	'I'
			DB	'G'
			DB	'C'
			DB	'E'
			db	0xA

	SECTION .text

global _start

_start:

	mov ebx,1 					; arg1, where to write, screen
	mov eax,4 					; write sysout command to int 80 hex
	mov edx,5 					; arg3, number of characters to print

	mov ecx,unidade 			; arg2, pointer to string
	int 0x80 					; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,1 					; arg1, where to write, screen
	mov eax,4 					; write sysout command to int 80 hex
	mov edx,6 					; arg3, number of characters to print

	mov ecx,depto 				; arg2, pointer to string
	int 0x80 					; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,0 					; exit command, 0=normal
	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel
