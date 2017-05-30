; SECOND STACK EXAMPLE

    SECTION .data
var1:   DB  89
var2:   DW  70
var3:   DD  103

    SECTION .text

global _start
_start:
    push    WORD [var1]
    mov     ax, [var2]
    push    ax
    mov     eax, [var3]
    push    eax

    mov     ebx, [esp]      ; value of the last push --> 103

    ; mov     ebx, [esp+4]    ; 70

    ; add     esp, 6
    ; pop     bx

    mov     eax, 1
    int     0x80
