; Assembler: nasm ­-f elf ­-o <program>.o <program>.asm
; Linker: ld ­-m elf_i386 ­-s -­o <program> <program>.o
; ./<program>
;******************************************************************************

      SECTION .data               ; data section
msg:  db "Hello World",10         ; the string to print, 10=cr (carriage return)

      SECTION .text               ; code section

  global _start

  _start:
; Program Entry Point
    mov   eax,4                   ; write sysout command to int 80 hex
    mov   ebx,1                   ; arg1, where to write, screen
    mov   ecx,msg                 ; arg2, pointer to string
    mov   edx,12                  ; arg3
    int   0x80                    ; interrupt 80 hex, call kernel

    mov   ebx,0                   ; exit command, 0=normal
    mov   eax,1                   ; exit command to kernel
    int   0x80                    ; interrupt 80 hex, call kernel
