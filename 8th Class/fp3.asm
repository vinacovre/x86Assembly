; EXAMPLE 4 : Floating Point
    SECTION .data
ivar1:      dw      10      ; 16-bit variable
ivar2:      dw      0       ; 16-bit variable
fpvar1:     dq      2.8     ; 64-bit variable
fpvar2:     dq      3.77    ; 64-bit variable

    SECTION .text

global _start
_start:
    fild     WORD [ivar1]   ; loads [ivar1] to ST0
    ;fmul    QWORD [fpvar1] ; ST0 = ST0 * [fpvar1]
    fmul    QWORD [fpvar2]  ; ST0 = ST0 * [fpvar2]
    fist    WORD [ivar2]    ; convert ST0 to int and store in [ivar2]

    mov     ebx, [ivar2]
;************************************************************
    mov     eax,1
    int     0x80
