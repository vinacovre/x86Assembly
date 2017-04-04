;****************************************************
; Exemplo de conversao de complemento de 2
;****************************************************

	SECTION .data
var16b:		dw	0xFF		; 11111111 11111111
varmask:	dw	0x10		; 00000000 00010000

	SECTION .text

global _start

_start:

	;BLOCK 1 --> 2's complement conversion
	mov		ax,[var16b]
	and		ax,[varmask]
	not		ax				; 11111111 11101111
	inc		ax				; 11111111 11110000
	; 240 in 2's complement = -16

	;BLOCK 2
	;mov	ax,0
	;sub 	ax,[varmask]
	; -16 = 240 in 2' complement


;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
