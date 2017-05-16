; *************************
; Print ascii values of elements in an array
; *************************

    SECTION .data
ZERO        EQU             0
NUMBER      EQU             12345
SIZE        EQU             5
stack:      TIMES SIZE DB   '0'

    SECTION .text

global _start

_start:

    mov     edi, NUMBER
    mov     ecx, stack
repeat_body:
    mov     eax, edi
    mov     bx, 10
    div     bx
    mov     di, ax
    add     dx, 48
    mov     [ecx], dx
    inc     ecx

repeat_cond:
    xor     edx, edx
    mov     eax, edi
    cmp     eax, edx
    jg      repeat_body

    mov     edi, SIZE
print_loop:
    mov     eax, 4
    mov     ebx, 1
    mov     edx, 1
    dec     ecx
    dec     edi
    int     0x80
    cmp     edi, ZERO
    jg      print_loop

    mov     eax,1
    int     0x80
