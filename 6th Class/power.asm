; **************************************
; x = x^y
; **************************************

    SECTION .data

x:   db  0
y:   db  3

    SECTION .text

%macro power 2
    mov     al, 1
    cmp     %2, 0       ; if y = 0 --> result = 1
    je      end

loop:
    mul     %1          ; the result of mul goes to al
    dec     %2
    cmp     %2, 0       ; if y > 0 --> continue
    jg      loop        ; else --> exit (result = %1)
end:
    mov     %1, al
%endmacro

    global _start
_start:

    mov         bl, [x]
    mov         cl, [y]
    power       bl, cl        ; x = x^y

; **************************************

    mov     eax, 1
    int     0x80
