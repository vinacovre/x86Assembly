	SECTION .data
	SECTION .text
	
	; X = 5! -­ (5+4+3+2+1) 

global _start

_start:

    ; factorial
	mov     al, 5   ; declare 5
	mov     bl, 4   ; declare 4
	mul     bl      ; 5 * 4
	mov     bl, 3   ; declare 3
	mul     bl      ; 5 * 4 * 3
	mov     bl, 2   ; declare 2
	mul     bl      ; 5 * 4 * 3 * 2
	
	mov     cx, 5   ; 5
	add     cx, 4   ; 5 + 4
	add     cx, 3   ; 5 + 4 + 3
	add     cx, 2   ; 5 + 4 + 3 + 2
	add     cx, 1   ; 5 + 4 + 3 + 2 + 1
	
	sub     ax, cx  ; 5! -­ (5+4+3+2+1) 
    
;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
