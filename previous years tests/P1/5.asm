    SECTION .data

X:      db      7
Y:      db      2

    SECTION .text

global _start

_start:

    mov     cl, [X]
    mov     dl, [Y]

    cmp     cl, dl
    jb      YisGreater
    add     cl, cl
    mov     bl, cl
    jmp     end

YisGreater:
    add     dl, dl
    mov     bl, dl

end:
    mov     eax, 1
    int     0x80