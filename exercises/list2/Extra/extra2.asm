SECTION .data

start1:     db  50
end1:       db  100
start2:     db  150
end2:       db  200
msg1:       db  "Valid  "
msg2:       db  "Invalid"
x:          db  7       ; INPUT

SECTION .text

global _start

_start:
    mov     al, [x]

    cmp     al, 0
    jz      SUCCESS         ; if x == 0

    cmp     al, [start1]
    jb      ERROR           ; if x < start1 --> ERROR

    cmp     al, [end1]
    jbe     SUCCESS         ; if x < end1 --> x in the first range --> SUCCESS

    cmp     al, [start2]
    jb      ERROR           ; if x < start2 --> ERROR

    cmp     al, [end2]
    jbe     SUCCESS         ; if x < end1 --> x in the second range --> SUCCESS

    jmp     ERROR

SUCCESS:
    mov     ecx, msg1
    jmp     END

ERROR:
    mov     ecx, msg2

END:
    mov     ebx, 1              ; arg1, where to write, screen
    mov     edx, 7              ; arg3, number of characters to print
    mov     eax, 4              ; write sysout command to int 80 hex
    int     0x80

; ****************************************************

    mov     eax, 1              ; exit command to kernel
    int     0x80                ; interrupt 80 hex, call kernel
