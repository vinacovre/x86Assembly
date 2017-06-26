    SECTION .data

; nasm -f elf -o output.o scalarTimesA_ASM.asm
; gcc -m32 -o project.out main.c output.o
; ./project.out

    SECTION .text

    global scalarTimesA_ASM
scalarTimesA_ASM:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; getting L
    mov     eax, [ebp + 8]
    mul     eax                     ; eax = L * L
    dec     eax                     ; eax = (L * L) - 1
    mov     ecx, eax                ; ecx (counter) = (L * L) - 1

    ; getting the second parameter --> scalar
    mov     ebx, [ebp + 12]

    ; getting first element of A
    mov	    esi, [ebp + 16]

    ; getting first element of the output matrix
    mov     edi, [ebp + 20]


MUL_BY_SCALAR:
    ; ecx = counter = L
    mov     eax, [esi + ecx * 4]    ; getting right value in matrix
    mul     bx                      ; scalar * ax
    mov     [edi + ecx * 4], eax    ; insert calculated value in the right place
    dec     ecx                     ; counter--
    jns     MUL_BY_SCALAR           ; until counter < 0


    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret
