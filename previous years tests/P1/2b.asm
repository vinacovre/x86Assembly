    SECTION .data

var1:   db  2
var2:   db  3
var3:   db  7,9

    SECTION .text

global _start

_start:

    mov     ecx, var1
    inc     ecx
    mov     edx, var2
    inc     edx
    xchg    ecx, edx
    mov     ebx, [ecx]
    sub     ebx, [edx]

    mov     eax, 1
    int     0x80

    ; seeReturn: 4