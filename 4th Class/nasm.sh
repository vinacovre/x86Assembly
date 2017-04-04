program=$1
nasm -f elf -o $program.o $program.asm
ld -m elf_i386 -s -o $program $program.o
# ./$program
echo "Success in executing shell!"
