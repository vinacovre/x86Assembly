;****************************************************
; Exemplo de Multiplicação
;****************************************************

	SECTION .data
var1:		dw	0x10		; 16
var2:		dw	0xFF		; (-1)

	SECTION .text

global _start

_start:

	mov		ax,[var1]
	mov		bx,[var2]
	imul		bx

	; 16 * (-1) = -16
	; 00010000 > (inversion) 11101111 > (+1) 11110000	
	; 240 = -16 in 2's complement

;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
