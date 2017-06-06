    SECTION .data

    SECTION .text
L:          db    3 ; matrix size LxL
byte_size:  db    4

    global calculate_ASM
calculate_ASM:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; edx = A
    mov     edx,[ebp+8]

    ; getting the second parameter
    mov     eax, [L]
    mul     BYTE [L]
    mul     BYTE [byte_size]
    add     eax, 8

    mov     ecx,[ebp+eax]

    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret