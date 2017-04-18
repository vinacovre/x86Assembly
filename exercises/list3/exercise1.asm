SECTION .data

a:  db  10
b:  db  20
c:  db  30

; if (a <= b) { //inside_if
;     if (a <= c)
;         menor = a;
;     else
;         menor = c;
; }
; else { //inside_else
;     if (b < c)
;         menor = b;
;     else
;         menor = c
; }

SECTION .text

global _start

_start:

                mov     al,[a]
                mov     bl,[b]
                mov     cl,[c]

                cmp     al,bl        ; if (a > b)...
                jg      inside_else  ; { goto else }
inside_if:
                cmp     al,cl
                jg      smallest_C   ; if (a <= c) ...
                mov     dl, al       ; { the smallest is A }
                jmp     END
smallest_C:
                mov     dl, cl       ; the smallest is C
                jmp     END
inside_else:
                cmp     bl, cl
                jg      smallest_C   ; if (b <= c)...
                mov     dl, bl       ; { the smalles is B }
END:
                mov bl, dl           ; use bl because ebx is the return to OS

; ****************************************************

    mov     eax, 1                   ; exit command to kernel
    int     0x80                     ; interrupt 80 hex, call kernel
