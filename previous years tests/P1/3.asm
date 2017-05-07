    SECTION .data

A:   db  3
B:   db  4
C:   db  5
D:   db  2
F:   db  5

; A * B - C * D + F = 7

    SECTION .text

global _start

_start:

    mov     al, [C]
    mov     bl, [D]
    mul     bl
    mov     dx, ax

    mov     al, [A]
    mov     bl, [B]
    mul     bl

    sub     ax, dx
    add     ax, WORD [F]

    mov     ebx, eax
    mov     eax, 1
    int     0x80