    SECTION .data

byte_size:  db    4

    SECTION .text

    global calculate_ASM
calculate_ASM:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; ecx = L
    mov     ecx,[ebp+8]

    ; getting the second parameter --> 5
    mov     ebx, [ebp + 12]

    ; esi = A
    mov	  esi, [ebp + 16]

    mov	eax, esi
    mul	ebx

    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret