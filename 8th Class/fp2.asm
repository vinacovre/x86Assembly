; EXAMPLE 3 : Floating Point
    SECTION .data
ivar1:      dw      0       ; 16-bit variable
fpvar1:     dq      5.3     ; 64-bit variable
fpvar2:     dq      9.7     ; 64-bit variable
fpvar3:     dq      3.2     ; 64-bit variable
fpvar4:     dq      1.8     ; 64-bit variable

    SECTION .text

global _start
_start:
    fld     QWORD [fpvar1]  ; loads [fpvar1] to ST0
    fld     QWORD [fpvar2]  ; loads [fpvar2] to ST0 and [fpvar1] is in ST1

    faddp    ST1, ST0       ; ST1 = ST1 + ST0 (pop) ... ST0 is now the result

    fadd    QWORD [fpvar3]  ; ST0 = ST0 + [fpvar3]
    fadd    QWORD [fpvar4]  ; ST0 = ST0 + [fpvar4]

    fist    DWORD [ivar1]   ; convert ST0 to int and store in [ivar1]

    mov     ebx,[ivar1]
;************************************************************
    mov     eax,1
    int     0x80
