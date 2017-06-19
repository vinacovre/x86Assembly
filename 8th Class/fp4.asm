; EXAMPLE 5 : Floating Point

; Assembly and Link
;     program=$1
;     nasm -f elf -o $program.o $program.asm
;     gcc -m32 -o $program $program.o
;     ./$prgram

    extern  printf          ; the C function

%macro  pabc   0
    SECTION .data
.str    db   'Values: '
    SECTION .text
    push    dword [c+4]     ; double c (bottom)
    push    dword [c]       ; double c
    push    dword [b+4]     ; double b (bottom)
    push    dword [b]       ; double b
    push    dword [a+4]     ; double a (bottom)
    push    dword [a]       ; double a
    push    dword .str      ; users string
    push    dword fmt       ; address of format string
    call    printf         ; call C function
    add     esp, 32         ; pop stack 8*4 bytes
%endmacro

    SECTION .data
a:      dq     52.3456      ; 64-bit variable
b:      dq     3000.32      ; 64-bit variable
c:      dq     7.989776     ; 64-bit variable
fmt:    db     "%s a=%e, b=%e, c=%e", 10, 0  ; format string for printf

    SECTION .text
global main
main:
    pabc

;************************************************************
    mov     eax,1
    int     0x80
