	SECTION .data
var:	db	10      ; any number

	SECTION .text

global _start

_start:

	mov		bl,[var]
	mov		al, BYTE 0  ; al = 0
	sub     al, BYTE 1  ; al = -1
	mul     bl          ; [var] * (-1)
    ; "BYTE" is optional in this case
    
;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
