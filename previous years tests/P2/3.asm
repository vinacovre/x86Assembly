    SECTION .data

array:    db    2,6,18,1,9
size:     db    5

    SECTION .text

global _start
_start:

    ; initializing values
    mov     eax, 0              ; eax = INDEX
    mov     bl, 0               ; bl = RESULT
    mov     cl, [array]         ; cl = SMALLEST
    mov     dl, [array]         ; dl = GREATEST

    ; if (size <= 1) return 0
    cmp     BYTE [size], 1
    jg      LOOP
    mov     ebx, 0
    jmp     END

LOOP:
    inc     eax                 ; INDEX++

    cmp     [array + eax], cl
    jge     CMP_BIG             ; if(array[INDEX] < SMALLEST)
    mov     cl, [array + eax]   ;   SMALLEST = array[INDEX];
    jmp     LOOP_COND

CMP_BIG:
    cmp     [array + eax], dl
    jle     LOOP_COND           ; if(array[INDEX] > GREATEST)
    mov     dl, [array + eax]   ;   GREATEST = array[INDEX];

LOOP_COND:
    cmp     eax, [size]
    jl      LOOP

    mov     bl, dl              ; RESULT = GREATEST
    sub     bl, cl              ; RESULT = GREATEST - SMALLEST

END:
; *****************************
    mov     eax, 1
    int     0x80