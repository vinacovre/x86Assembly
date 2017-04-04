;****************************************************
; Exemplo de Multiplicação
;****************************************************

	SECTION .data
var1:		dw	0x10
var2:		dw	10

	SECTION .text

global _start

_start:

	mov		ax,[var1]
	mov		bx,[var2]
	mul		bx
	mov		ebx,eax
	; 160

;****************************************************

	mov		eax,1
	int		0x80
