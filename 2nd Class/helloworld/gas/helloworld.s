# Assembler: as -o <program>.o <program>.s
#            or...    gcc -c <program>.s
# Linker: ld ­-o <program> <program>.o
# ./<program>

    .data
msg:
    .ascii  "Hello, World\n"

    .global _start

    .text
_start:
    mov   $4,%eax                   # system call 4 is write
    mov   $1,%ebx                   # file handle 1 is stdout
    mov   $msg,%ecx                 # address of string to output
    mov   $13,%edx                  #
    int   $0x80                     # invoke operating system code

    # exit(0);
    mov   $1,%eax                   # system call 1 is exit
    xor   %ebx, %ebx                # we want to return code 0 (ebx = 0)
    int   $0x80                     # invoke operating system code
