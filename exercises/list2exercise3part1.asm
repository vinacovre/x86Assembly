	SECTION .data
var:	db	10      ; any number

	SECTION .text

global _start

_start:

	mov		bl,[var]
	mov		al, BYTE 0  ; al = 0
	sub     al, bl      ; 0 - [var]
    
;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
