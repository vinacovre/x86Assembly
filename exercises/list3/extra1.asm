SECTION .data

age1:   db  16
msg1:   db  "O cidadão não pode votar!    ",10

age2:   db  18
msg2:   db  "O voto é facultativo.        ",10

age3:   db  70
msg3:   db  "O cidadão é obrigado a votar.",10

ageIn:  db  12


SECTION .text

global _start

_start:

            mov     al, [ageIn]

            cmp     al, [age1]
            jb      BLW16           ; if ageIn < 16 --> BLW16

            cmp     al, [age2]
            jb      BLW18           ; if ageIn < 18 --> BLW18

            cmp     al, [age3]
            jb      BLW70           ; if ageIn < 70 --> BLW70

            mov     ecx, msg2
            jmp     END

BLW16:
            mov     ecx, msg1
            jmp     END

BLW18:
            mov     ecx, msg2
            jmp     END

BLW70:
            mov     ecx, msg3
            jmp     END

END:

            mov     ebx, 1              ; arg1, where to write, screen
            mov     edx, 30             ; arg3, number of characters to print
            mov     eax, 4              ; write sysout command to int 80 hex
            int     0x80

; ****************************************************

    mov     eax, 1                   ; exit command to kernel
    int     0x80                     ; interrupt 80 hex, call kernel
