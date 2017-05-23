; **************************************
; Terceiro Exemplo de Macro
; **************************************

%include    "macros/io.txt"
; works for any (text) file extension

    SECTION .data

var1:   db  4
var2:   db  10h

    SECTION .text

    global _start
_start:

    mov         edx, [var1]
    dobro       edx
    quadrado    edx
    ; RESULT ==> 64

; **************************************
    mov     ebx, edx
    mov     eax, 1
    int     0x80
