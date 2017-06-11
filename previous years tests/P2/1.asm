    SECTION .data

b:   DB  3
e:   DB  4

; b^e

    SECTION .text

global _start
_start:

    mov     eax, [b]
    mov     ebx, [b]
    mov     ecx, [e]

    ; if (e == 0) return 1; else LOOP
    cmp     ecx, 0
    jne     LOOP
    mov     eax, 1
    jmp     END

LOOP:
    ; testar mul [b] ou mul BYTE [b]
    mul     ebx         ; eax = eax * ebx | eax = b * b
    dec     ecx         ; e = e - 1;

    ; if (e <= 1) return eax;
    cmp     ecx, 1
    jbe     END
    jmp     LOOP

END:
; *****************************
    mov     ebx, eax
    mov     eax, 1
    int     0x80