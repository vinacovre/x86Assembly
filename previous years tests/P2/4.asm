    SECTION .data

X:          db    3
impar:      db    'impar', 10
par:        db    'par  ', 10

    SECTION .text

global _start
_start:

    mov     ebx, 2          ; ebx = 2
    mov     eax, [X]        ; eax = X
    
    div     ebx             ; eax --> quotient, edx --> remainder 

    cmp     edx, 0
    je      PAR
    mov     ecx, impar
    jmp     END
PAR:
    mov     ecx, par

; ****************************************************
END:
    mov     eax, 4         ; arg1, write sysout command to int 80 hex
    mov     ebx, 1         ; arg2, where to write, screen
    ; mov     ecx, msg     ; arg3, pointer to message
    mov     edx, 6         ; arg4, number of characters to print
    int     0x80

; ****************************************************
    mov     eax, 1         ; exit command to kernel
    int     0x80           ; interrupt 80 hex, call kernel
