; THIRD PROCEDURE EXAMPLE

    SECTION .data
var1:   DW  15
var2:   DB  7

    SECTION .text

global _start
_start:
    push    WORD [var1]
    push    WORD [var2]
    call    triple_of_highest
    mov     ebx, eax
    mov     eax, 1
    int     0x80

; **** PROCEDURE: TRIPLE OF HIGHEST
; Return --> ax
triple_of_highest:
    push    ebp
    mov     ebp, esp
    mov     ax, [ebp+10]
    mov     bx, [ebp+8]
    cmp     ax, bx
    jl      b_greatest
    jmp     triple
b_greatest:
    mov     ax, bx
triple:
    mov     bx, 3
    mul     bx
    mov     esp, ebp
    pop     ebp
    ret     4  ; pops the two variables pushed in line 11
