    SECTION .data

b:   DB  2
e:   DB  6

; b^e

    SECTION .text

global _start
_start:

    mov     al, [b]
    mov     cl, [e]

    ; if (e == 0) return 1; else LOOP
    cmp     cl, 0
    je      ZERO

    ; if (e == 1) return b; else LOOP        
    cmp     cl, 1
    je      END

LOOP:
    mul     BYTE [b]    ; al = al * b
    dec     cl          ; e = e - 1;

    ; if (e <= 1) return al;
    cmp     cl, 1
    jbe     END
    jmp     LOOP

ZERO:
    mov     al, 1

END:
; *****************************
    mov     bl, al
    mov     eax, 1
    int     0x80