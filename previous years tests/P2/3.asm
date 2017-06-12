    SECTION .data

array:    db    2,6,18,1,9,20,10,4,7,11
size:     db    10

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
    inc     al                  ; INDEX++

LOOP_COND:
    cmp     al, [size]
    jge     END_LOOP

    cmp     [array + eax], cl
    jge     CMP_BIG             ; if(array[INDEX] < SMALLEST)
    mov     cl, [array + eax]   ;   SMALLEST = array[INDEX];
    jmp     LOOP

CMP_BIG:
    cmp     [array + eax], dl
    jle     LOOP                ; if(array[INDEX] > GREATEST)
    mov     dl, [array + eax]   ;   GREATEST = array[INDEX];
    jmp     LOOP
   
END_LOOP:

    mov     bl, dl              ; RESULT = GREATEST
    sub     bl, cl              ; RESULT = GREATEST - SMALLEST

END:
; *****************************
    mov     eax, 1
    int     0x80