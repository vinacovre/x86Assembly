;****************************************************
; Primeiro exemplo de add
;****************************************************

	SECTION .data

	SECTION .text

global _start

_start:

	;BLOCK 1
	;mov	eax,10
	;add	eax,10
	;mov 	ebx,eax
	; 10 + 10 = 20

	;BLOCK 2
	mov		eax,10h
	add		eax,10h
	mov		ebx,eax
	; 0x10 = 16... 16+16 = 32

	;BLOCK 3
	;mov 	eax, 0x10
	;add 	eax,10
	;mov	ebx,eax
	; 0x10 = 16... 16 + 10 = 26

;****************************************************

	mov		eax,1
	int		0x80
