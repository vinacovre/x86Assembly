;****************************************************
; Primeiro exemplo de sub
;****************************************************

	SECTION .data
var1:	db	0x7F		; 01111111B = 63
var2:	db	40h			; 01000000B	= 64

	SECTION .text

global _start

_start:

	;BLOCK 1
	;xor	eax,eax		; starts eax as zero
	;mov	eax,[var1]
	;sub	eax,[var2]
	; 127 - 64 = 63

	;BLOCK 2
	xor		eax,eax
	mov		eax,[var1]
	and		eax,[var2]
	dec		eax
	; 64 - 1 = 63
	
	mov		ebx,eax

;****************************************************

	mov		eax,1
	int		0x80
