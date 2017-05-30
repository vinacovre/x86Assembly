; FIRST PROCEDURE EXAMPLE

    SECTION .data
var1:   DB  12
var2:   DB  5

    SECTION .text

global _start
_start:
    mov     al, [var1]
    mov     bl, [var2]
    call    triple_of_highest
    mov     bx, ax
    mov     eax, 1
    int     0x80

; **** PROCEDURE: TRIPLE OF HIGHEST
; Parameters --> al, bl
; Return --> ax
triple_of_highest:
    cmp     al, bl
    jl      b_greatest
    jmp     triple
b_greatest:
    mov     al, bl
triple:
    mov     bl, 3
    mul     bl
    ret
