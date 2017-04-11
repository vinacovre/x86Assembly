	SECTION .data
A:		db	1
B:		db	2
C:		db	3
D:		db	4
F:		db	6
G:		db	7
H:		db	8

;   a) X = A + (B * C) – (D * F) + G – H

	SECTION .text

global _start

_start:

	mov		al,[B]
	mov		bl,[C]
	mul     bl          ; B * C
	mov     cx, ax      ; cx = B * C
	
	mov     al,[D]
	mov     bl,[F]
	mul     bl          ; D * F
	mov     dx, ax      ; dx = D * F
	
    mov     ax, [A]     ; A
    add     ax, cx      ; accumulator = A + cx
    sub     ax, dx      ; accumulator = accumulator - dx
    add     ax, [G]     ; accumulator = accumulator + G
    sub     ax, [H]     ; accumulator = accumulator - H
        
;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
