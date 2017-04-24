	SECTION .data

N:          db  8, 6, 7         ; Grades
P:          db  2, 3, 5         ; Weights
msg:        db  "Aprovado: X"
mask:       db  1B
            TIMES 7 DB 0        ; mask: 10000000 ... 00000000 (32 bits)

	SECTION .text

global _start

_start:

; *** FIRST GRADE

    ; Multiplying first grade by the first weight
    mov     eax, [P]
    mov     ebx, [N]
    mul     ebx

    ; Placing weighted grade in the accumulator
    mov     ecx, eax            ; ecx = grade[0] * weight[0]

; *** SECOND GRADE

    ; Getting second position of the weight array
    mov     edx, P
    add     edx, 1
    mov     eax, [edx]          ; eax = weight[1]

    ; Getting second position of the grade array
    mov     edx, N
    add     edx, 1
    mov     ebx, [edx]          ; ebx = grade[1]

    mul     ebx                 ; eax = grade[1] * weight[1]

    ; Adding both weighted grades in the accumulator
    add     ecx, eax            ; ecx = grade[0,1] * weight[0,1]

; *** THIRD GRADE

    ; Getting third position of the weight array
    mov     edx, P
    add     edx, 2
    mov     eax, [edx]          ; eax = weight[2]

    ; Getting third position of the grade array
    mov     edx, N
    add     edx, 2
    mov     ebx, [edx]          ; ebx = grade[2]

    mul     ebx                 ; eax = grade[2] * weight[2]

    ; Inserting weighted grade in the accumulator
    add     ecx, eax            ; ecx = grade[0,1,2] * weight[0,1,2] = FINAL GRADE

; *** APPROVAL VERIFICATION

    ; Average limiar: 50 (5*2 + 5*3 + 5*5)
    mov     eax, 51             ; we consider 51 because... (?)
    sub     eax, ecx            ; eax = MEAN - FINAL GRADE

    ; if (eax < 0) then disapproved() else approved()
    ; A number is <0 in 2's complement when first bit is 1

    ; The maximum grade is 100 (10*2 + 10*3 + 10*5)
    ; 8 bits for 2's complement range: -128 to +127
    ; That is why we get "al" instead of "eax"

    and     eax, mask            ; eax gets the first bit of the FINAL GRADE

    ; if (al = 00000000 = 0)    --> approved
    ; if (al = 10000000 = -128) --> disapproved

    mov     bl, 2
    mul     bl                  ; al * 2

    ; al * 2 overflows when al = 10000000 (disapproved)

    ; Go to the 10th position of the message (where is 1 or 0)
    mov     eax, msg
    add     eax, 10
    ; mov     [eax], OF           ; "Aprovado: [OF]"

; ****************************************************

    mov     ebx, 1              ; arg1, where to write, screen
    mov     ecx, msg            ; arg2, pointer to string
    mov     edx, 11             ; arg3, number of characters to print
    mov     eax, 4              ; write sysout command to int 80 hex
    int     0x80

; ****************************************************

    mov     ebx, 0              ; exit command, 0 = normal
    mov     eax, 1              ; exit command to kernel
    int     0x80                ; interrupt 80 hex, call kernel
