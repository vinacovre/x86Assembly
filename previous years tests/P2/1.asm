    SECTION .data

b:   DB  5
e:   DB  3

; b^e

    SECTION .text

global _start
_start:

    mov     al, [b]
    mov     cl, [e]

    ; if (e == 0) return 1; else LOOP
    cmp     cl, 0
    jne     LOOP
    mov     al, 1
    jmp     END

LOOP:
    mul     BYTE [b]    ; al = al * b
    dec     cl          ; e = e - 1;

    ; if (e <= 1) return al;
    cmp     cl, 1
    jbe     END
    jmp     LOOP

END:
; *****************************
    mov     bl, al
    mov     eax, 1
    int     0x80