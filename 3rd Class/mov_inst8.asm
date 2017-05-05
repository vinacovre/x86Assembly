;******************************************************************
; Comparing MOV and LEA
;******************************************************************
	SECTION .data

char: 	db 	'A'

	SECTION .text

global _start

_start:
	
	mov ebx,[char]				; Content (value of 'A' in ASCII table)
	; mov ebx,char					; Address
	; lea ebx,[char]				; Address
	; lea ebx, char					; ERROR: invalid compbination

	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel
