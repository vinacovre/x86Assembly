;****************************************************
; Exemplo de resolução de expressões
;****************************************************

;	R = (A - B) * (D + E) - F
;	A = 10; B=8; D=1; E=3; F=2; R=6

	SECTION .data
A:		db	10		
B:		db	8
D:		db	1
E:		db	3
F:		db	2

	SECTION .text

global _start

_start:

	xor		eax,eax
	xor		ebx,ebx

	mov		al,[A]
	sub		bl,[B]	; (A - B)

	mov		bl,[D]
	add		bl,[E]	; (D + E)

	mul		bl		; (A - B) * (D + E)

	mov		bx,[F]
	sub		ax,bx	; (A - B) * (D + E) - F

;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
