    SECTION .data

; declaring variables
L:          DB      0       ; size of matrix
Lminus1:    DB      0       ; L-1
counterR1:  DB      0       ;
counterC:   DB      0       ;
R1:         DB      0       ; first element of A * scalar
C:          DB      0       ; first element of C
R2:         DB      0       ; firs element of resulting matrix R2
acc:        DB      0       ; accumulator variable

%macro multiply_elements 2
	push	eax
	push	edx

	mov	eax, %1
	mov	edx, %2
	mul	dl

	mov	ebx, eax

	pop	eax
	pop	edx
%endmacro

    SECTION .text

    global matrixMultiplication_ASM
matrixMultiplication_ASM:

    ; Prologue
    push    ebp
    mov     ebp,esp

    ; getting L
    mov     eax, [ebp + 8]          ; eax = L
    mov     [counterC], eax         ; declaring counterC
    mov     [L], eax                ; declaring L
    dec     eax                     ; eax = L-1
    mov     [Lminus1], eax          ; declaring L-1
    inc     eax                     ; eax = L
    mul     eax                     ; eax = L * L
    dec     eax                     ; eax = (L * L) - 1
    mov     ecx, eax                ; ecx (counter) = (L * L) - 1
    ; getting first element of (scalar*A) matrix
    mov	    edx, [ebp + 12]
    mov     [R1], edx               ; declaring R1
    ; getting first element of C matrix
    mov	    edx, [ebp + 16]
    mov     [C], edx                ; declaring C
    ; getting first element of the output matrix
    mov     edx, [ebp + 20]
    mov     [R2], edx               ; declaring R2

    mov     esi, [R1]               ; ESI --> R1 base
    mov     edi, [C]                ; EDI --> C base
    mov     eip, [counterR1]        ; EIP --> counterR1
    ; ECX --> last_position
    ; EDX, EBX --> multiplication
    sub     ecx, [Lminus1]          ; ecx = last_position - (L-1)
    xor     eax, eax

    FOR:

        mov     ebx, [esi + eip*4]

        mov     edx, [edi + ecx*4]  ; eax = right element

        multiply_elements ebx, edx

        add     eax, ebx            ; accumulate value
        
        sub     ecx, [L]
        cmp     ecx, 0
        jae     FOR
        


    ; Epilogue
    mov     esp,ebp
    pop     ebp
    ret
