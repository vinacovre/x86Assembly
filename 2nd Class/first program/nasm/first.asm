; Assembler: nasm ­-f elf ­-o <program>.o <program>.asm
; Linker: ld ­-m elf_i386 ­-s -­o <program> <program>.o
; ./<program>
;******************************************************************************
;
; In terminal...
; echo $?
;
;******************************************************************************
; ebx --> stores the return value of the program.
; echo command must show the value of ebx (in this case: 15)

  SECTION .text

global _start

  ; Program entry point
  _start:

    mov ebx,15

    mov eax,1       ; exit command to kernel
    int 0x80        ; interrupt 80 hex, call kernel
