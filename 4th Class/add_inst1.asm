;****************************************************
; Segundo exemplo de add
;****************************************************

	SECTION .data
var1:	db	10
var2:	db	10h
var3:	db	28
var4:	db	0
var5:	db	30,60
var6:	db	20

	SECTION .text

global _start

_start:

	;BLOCK 1
	;mov	eax,[var1]
	;add	eax,[var2]
	;mov 	ebx,eax
	; 10 + 16 (10h) = 26

	;BLOCK 2
	;mov		eax,var3
	;add		eax,var4
	;mov		ebx,eax
	; getting memory addresses!

	;BLOCK 3
	mov 	eax, var5
	add 	eax,1			; shifts to next position from var5
	mov	ebx,[eax]
	add ebx,[var6]
	; 60 + 20 = 80

;****************************************************

	mov		eax,1
	int		0x80
