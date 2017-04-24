	SECTION .data
A:		db	1
B:		db	2
C:		db	3
D:		db	4
G:		db	7
H:		db	8

;   a) X = H ­- (B * (-­D)) + ((-­C) * G) + A = -4

	SECTION .text

global _start

_start:

	mov		al,[B]
	mov		bl, BYTE 0  ; bl = 0
	sub     bl, [D]     ; bl = bl - D --> -D
	mul     bl          ; B * (-D)
	mov     cx, ax      ; cx = B * (-D)
	
	mov		al, BYTE 0  ; al = 0
	sub     al,[C]      ; al = al - C --> -C
	mov     bl,[G]
	mul     bl          ; (-C) * G
	mov     dx, ax      ; dx = (-C) * G
    
    mov     ax, [H]     ; H
    sub     ax, cx      ; accumulator = H - cx
    add     ax, dx      ; accumulator = accumulator + dx
    add     ax, [A]     ; accumulator = accumulator + A
    
;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
