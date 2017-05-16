; *************************
; Sum of elements in an array
; *************************

    SECTION .data
array:      DB      5,3,6,7,4,2,8,1,5,9
SIZE        EQU     10

    SECTION .text

global _start

_start:
    xor     bl, bl
    xor     ecx, ecx
    jmp     for_cond
for_body:
    mov     al, [array + ecx]
    ; mov     al, [array + cl]        ; invalid effective address
    add     bl, al
    inc     ecx
for_cond:
    cmp     ecx, SIZE
    jl      for_body

    ; RESULT = 50
    mov     eax,1
    int     0x80
