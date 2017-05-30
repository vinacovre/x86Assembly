; FIRST STACK EXAMPLE

    SECTION .data
varb:   DB  31
varw:   DW  29
vard:   DD  64

    SECTION .text

global _start
_start:
    mov     eax, [vard]
    push    eax
    pop     ebx
    ; RETURN --> 64

    ; push    WORD [varw]
    ; pop     ebx
    ; ; RETURN --> 29

    ; push    BYTE [varb] ; error: push/pop operations do not support 8bit values
    ; pop     ebx

    mov     eax, 1
    int     0x80
