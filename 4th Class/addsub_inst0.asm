;****************************************************
; Exemplo de expressões com ADD e SUB
; R = 9 - (-9) + 5 + (-10)
;****************************************************

	SECTION .data
var1:		db	9		
var2:		db	0xF7		; (-9)
var3:		db	5
var4:		db	0xF6		; (-10)

	SECTION .text

global _start

_start:

	mov		eax,[var1]
	mov		bx,[var2]
	sub		eax,[var2]
	add		eax,[var3]
	add		eax,[var4]
	; R = 13

;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
