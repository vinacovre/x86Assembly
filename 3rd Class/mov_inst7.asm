;******************************************************************
; Exemple of Ambiguous MOVes (use  nasm.sh and then seeReturn.sh)
;******************************************************************
	SECTION .data

value: 	db 	15

	SECTION .text

global _start

_start:
	
	;mov [value],20				; error:operation size not specified
	mov [value],BYTE 20			; ok	
	;mov BYTE [value], 20		; ok

	mov ebx,[value]	

	mov eax,1 					; exit command to kernel
	int 0x80 					; interrupt 80 hex, call kernel
