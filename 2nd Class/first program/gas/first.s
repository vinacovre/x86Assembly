# Assembler: as -o <program>.o <program>.s
#            or...    gcc -c <program>.s
# Linker: ld ­-o <program> <program>.o
# ./<program>

    .global _start

    .text
_start:

    mov $15,%ebx

    mov $1,%eax       # exit command to kernel
    int $0x80         # interrupt 80 hex, call kernel
