SECTION .data

L1:         db  101
L2:         db  102
L3:         db  100
msgERR:     db  "Not a triangle!"
msgISO:     db  "Isósceles      "
msgEQUI:    db  "Equilátero     "
msgESC:     db  "Escaleno       "

SECTION .text

global _start

_start:

    ; cl is the greatest
    ; dl is the sum of the other 2

    mov     al, [L1]
    mov     bl, [L2]

    cmp     al, [L3]    ; if (L1 > L3) --> L1CMPL2
    ja      L1CMPL2

    cmp     bl, [L3]
    ja      L2_GREATEST ; if (L2 > L3) --> (L2 > L1) --> L2_GREATEST
    mov     cl, [L3]    ; L3 is the greatest
    mov     dl, [L1]
    add     dl, [L2]

    jmp     VERIF_SUM

L1CMPL2:
    cmp     al, bl      ; if (L1 < L2) -->
    jb      L2_GREATEST

L1_GREATEST:
    mov     cl, [L1]    ; L1 is the greatest
    mov     dl, [L2]
    add     dl, [L3]
    jmp     VERIF_SUM

L2_GREATEST:
    mov     cl, [L2]    ; L2 is the greatest
    mov     dl, [L2]
    add     dl, [L3]

VERIF_SUM:
    cmp     cl, dl
    jae     ERROR

VERIF_TYPE:
    mov     al, [L1]
    mov     bl, [L2]
    mov     cl, [L3]
    xor     dl, dl

    cmp     al, bl
    jne     L2CMPL3
    cmp     al, cl
    jne     ISOSCELES
    jmp     EQUILATERO

L2CMPL3:
    cmp     bl, cl
    je      ISOSCELES
    jmp     ESCALENO

ISOSCELES:
    mov     ecx, msgISO
    jmp     END

EQUILATERO:
    mov     ecx, msgEQUI
    jmp     END

ESCALENO:
    mov     ecx, msgESC
    jmp     END

ERROR:
    mov     ecx, msgERR

END:
    mov     ebx, 1              ; arg1, where to write, screen
    mov     edx, 15             ; arg3, number of characters to print
    mov     eax, 4              ; write sysout command to int 80 hex
    int     0x80

; ****************************************************

    mov     eax, 1              ; exit command to kernel
    int     0x80                ; interrupt 80 hex, call kernel
