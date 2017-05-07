    SECTION .data

letter:    DB    'V'

    SECTION .text

global _start

_start:    
    mov ebx, [letter]           ; edx = 'V'
    ; add ebx, 48                 ; to get ASCII value and display it

    mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel