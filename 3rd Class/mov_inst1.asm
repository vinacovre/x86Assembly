	SECTION .data

charA: 	db 'A',10			;the string to print
;charA: db 0x41,0Ah			;the string to print
;charA: db 41h,0aH			;the string to print
;charA: db 65,10			;the string to print
charB:	DB 10, 'B',10,10

	SECTION .text

global _start

_start:

	mov ebx,1 		; arg1, where to write, screen
	mov eax,4 		; write sysout command to int 80 hex
	mov edx,2 		; arg3, number of characters to print

	mov ecx,charA 	; arg2, pointer to string
	int 0x80 		; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,1 		; arg1, where to write, screen
	mov eax,4 		; write sysout command to int 80 hex
	mov edx,4 		; arg3, number of characters to print

	mov ecx,charB 	; arg2, pointer to string
	int 0x80 		; interrupt 80 hex, call kernel

	;********************************************************

	mov ebx,0 		; exit command, 0=normal
	mov eax,1 		; exit command to kernel
	int 0x80 		; interrupt 80 hex, call kernel
