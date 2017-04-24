	SECTION .data
	
struct:	db  1, 1, 1, 1

	SECTION .text

global _start

_start:

    xor		eax, eax
    mov     eax, struct
    add     [eax], BYTE 48         ; ascii value
    
    add     eax, 1
    add     [eax], BYTE 1          ; mov [eax], 2
    add     [eax], BYTE 48         ; ascii value
    
    add     eax, 1
    mov     [EAX], BYTE 4          ; add [eax], 3
    add     [eax], BYTE 48         ; ascii value
    
    add     eax, 1
    mov     [eax], BYTE 8          ; add [eax], 7
    add     [eax], BYTE 48         ; ascii value
    
    ;****************************************************
    
    mov edx,4 		        ; arg3, number of characters to print
	mov ebx,1 		        ; arg1, where to write, screen
	mov ecx, struct 	    ; arg2, pointer to string
	
	mov eax,4 		        ; write sysout command to int 80 hex
	int 0x80 		        ; interrupt 80 hex, call kernel
    
    ;****************************************************

	mov		ebx,eax
	mov		eax,1
	int		0x80
