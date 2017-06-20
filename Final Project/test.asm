    SECTION .data

byte_size:  db    4

    SECTION .text

    global test
test:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; getting L
    mov     eax, [ebp + 8]
    mul     eax                     ; eax = L * L
    dec     eax                     ; eax = (L * L) - 1
    mov     ecx, eax                ; ecx (counter) = (L * L) - 1

    ; getting the second parameter --> 5
    mov     ebx, [ebp + 12]

    ; getting first element of A
    mov	    esi, [ebp + 16]


MUL_BY_SCALAR:
    ; ecx = counter = L
    mov     eax, [esi + ecx * 4]    ; getting right value in matrix
    mul     bx                      ; 5 * ax
    mov     [edi + ecx * 4], eax    ; insert calculated value in the right place
    dec     ecx                     ; counter--
    jns     MUL_BY_SCALAR           ; until counter < 0

    ; mov	    eax, ecx ;TEST
    inc     ecx
    mov     eax, [esi + 4]

    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret
