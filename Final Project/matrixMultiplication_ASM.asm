    SECTION .data

; nasm -f elf -o output_ASM2 matrixMultiplication_ASM.asm
; gcc -m32 -o project.out main.c output_ASM2.o
; ./project.out

    SECTION .text

    global matrixMultiplication_ASM
matrixMultiplication_ASM:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; getting L
    mov     eax, [ebp + 8]
    dec     eax                     ; eax = L - 1

    ; getting first element of (scalar*A) matrix
    mov	    esi, [ebp + 12]

    ; getting first element of C matrix
    mov	    esi, [ebp + 16]

    ; getting first element of the output matrix
    mov     edi, [ebp + 20]

    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret
