    SECTION .data

array:   db   10, 20, 30

    SECTION .text

global _start

_start:

    mov     eax, array
    mov     ebx, [eax]        ; bl = 10

    inc     eax
    add     ebx, [eax]        ; bl = 10 + 20

    inc     eax
    add     ebx, [eax]        ; bl = 10 + 20 + 30

    mov     eax, 1
    int     0x80