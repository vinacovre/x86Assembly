    SECTION .data

string:     db     'string', 10

    SECTION .text

; PRINT
; parameter 1: address of the string to be printed
; parameter 2: size of the string
%macro print 2
    mov     eax, 4         ; arg1, write sysout command to int 80 hex
    mov     ebx, 1         ; arg2, where to write, screen
    mov     ecx, %1        ; arg3, pointer to message
    mov     edx, %2        ; arg4, number of characters to print
    int     0x80
%endmacro

global _start
_start:

    print   string, 7

; ****************************************************
    mov     eax, 1         ; exit command to kernel
    int     0x80           ; interrupt 80 hex, call kernel