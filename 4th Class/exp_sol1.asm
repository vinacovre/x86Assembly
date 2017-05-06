;****************************************************
; Exemplo de resolução de expressões
;****************************************************

;	R = F + A * E - D * B
;	where A = 10; B=8; D=1; E=3; F=2;
;	R = 24

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

	mov		al,[D]
	mov		bl,[B]
	mul		bl		; cx = D * B
	mov		cx,ax

	mov		al,[E]
	mov		bl,[A]
	mul		bl		; dx = A * E
	mov		dx,ax

	sub		dx,cx	; dx = dx - cx

	mov		ax,[F]	; ax <= F
	add		ax,dx	; ax = ax + dx

; SOLUTION: 
	
	;mov		al,[D]
	;mov		bl,[B]
	;mul		bl		; dx = D * B
	;mov		dx,ax

	;mov		al,[A]
	;mov		bl,[E]
	;mul		bl

	;add		ax,[F]

	;sub		ax,dx

;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
