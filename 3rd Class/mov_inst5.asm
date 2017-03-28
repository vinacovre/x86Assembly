	SECTION .data

LINE_BREAK	EQU	10
chx: 		TIMES 2	db 	'X',LINE_BREAK
chz:				DB	'Z', LINE_BREAK

	SECTION .text

global _start

_start:

	mov ebx,1 					; arg1, where to write, screen
	mov eax,4 					; write sysout command to int 80 hex
	mov edx,2 					; arg3, number of characters to print

	MOV ecx,chx		 			; arg2, pointer to string
	;mov ecx, CHX				; ERROR! (case sensitive for labels)
	int 0x80 					; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,1 					; arg1, where to write, screen
	mov eax,4 					; write sysout command to int 80 hex
	mov edx,2 					; arg3, number of characters to print
	
	add ecx,2
	int 0x80 					; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,1 					; arg1, where to write, screen
	mov eax,4 					; write sysout command to int 80 hex
	mov edx,2 					; arg3, number of characters to print

	add ecx,2
	int 0x80 					; interrupt 80 hex, call kernel

	;************************END*****************************

	mov ebx,0 					; exit command, 0=normal
	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel

