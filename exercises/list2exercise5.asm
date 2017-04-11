	SECTION .data
	
P:          db  2, 3, 5
N:          db  5, 5, 7
msg:        db  "Aprovado: X"
mask:       db  1B
            TIMES 7 DB 0

	SECTION .text

global _start

_start:

    mov     eax, [P]
    mov     ebx, [N]
    mul     ebx
    mov     ecx, eax
    
    ;***
    
    mov     edx, P
    add     edx, 1
    mov     eax, [edx]
    
    mov     edx, N
    add     edx, 1
    mov     ebx, [edx]
    mul     ebx
    
    mul     ebx
    add     ecx, eax
    
    ;***
    

    mov     edx, P
    add     edx, 2
    mov     eax, [edx]
    
    mov     edx, N
    add     edx, 2
    mov     ebx, [edx]
    mul     ebx
    
    mul     ebx
    add     ecx, eax
     
    ;***
    
    mov     eax, 51
    sub     eax, ecx
    
    and     al, mask
    
    mov     bl, 2
    mul     bl
    
    add     ah, BYTE 48
    mov     ebx, ah
    
    mov     eax, msg
    add     eax, 10
    mov     [eax], ebx
    
    mov     ecx, msg
    mov     eax, 4
    mov     edx, 11
    mov     ebx, 1
    int     0x80
    
    mov     ebx, 0
    mov     eax, 1
    int     0x80
    
    
;****************************************************
