; *************************
; DIV instruction
; *************************

    SECTION .data
dividendo:      DW      29
divisor:        DB      4

    SECTION .text

global _start

_start:
    mov     ax,[dividendo]
    mov     bl,[divisor]
    div     bl

    mov     bl,al          ; quociente
    ; mov     bl,ah          ; resto

    mov     eax, 1
    int     0x80
