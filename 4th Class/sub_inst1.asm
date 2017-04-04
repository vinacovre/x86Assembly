;****************************************************
; Segundo exemplo de sub
;****************************************************

	SECTION .data
var1:	db	0x7F		; 01111111B
var2:	db	80h			; 10000000B

	SECTION .text

global _start

_start:

	;BLOCK 1
	;mov	eax,[var2]
	;sub	eax,[var1]
	; 1 = 00000001

	;BLOCK 2
	mov		eax,[var1]
	sub 	eax,[var2]
	; 255 = 11111111

	; 2's complement:
	; 0-0000001 > (inversion) 0-1111110 > (+1) > 11111111

;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
