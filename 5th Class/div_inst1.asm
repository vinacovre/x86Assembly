; *************************
; Print ascii values of elements in an array
; *************************

    SECTION .data
NUMBER      EQU     435
char:       DB      '0'

    SECTION .text

global _start

_start:
    mov     edi, NUMBER
repeat_body:
    mov     eax, edi
    mov     bx, 10
    div     bx
    mov     di, ax
    add     dx, 48
    mov     [char], dx

    mov     eax, 4
    mov     ebx, 1
    mov     ecx, char
    mov     edx, 1
    int     0x80
repeat_cond:
    xor     edx, edx
    mov     eax, edi
    cmp     eax, edx
    jg      repeat_body

    mov     eax,1
    int     0x80
