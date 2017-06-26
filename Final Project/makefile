# nasm -f elf -o outputNasm1.o matrixMultiplication_ASM.asm
# nasm -f elf -o outputNasm2.o scalarTimesA_ASM.asm
# as --32 -o outputGas1.o matrixMultiplication_GAS.s
# as --32 -o outputGas2.o scalarTimesA_GAS.s
# gcc -m32 -o project.out main.c *.o
# ./project.out

CC = gcc
NASM = nasm
GAS = as
CCFLAGS = -m32 -o
NASMFLAGS = -f elf -o
GASFLAGS = --32 -o
CFILE = main.c

# relocatables = outputNASM1.o outputNASM2.o outputGAS1.o outputGAS2.o

project = final_project

executable = $(project)

default: $(project)

$(executable): $(relocatables)
	NASM NASMFLAGS outputNASM1.o matrixMultiplication_ASM.asm
	NASM NASMFLAGS outputNASM2.o scalarTimesA_ASM.asm
	GAS GASFLAGS outputGAS1.o matrixMultiplication_GAS.s
	GAS GASFLAGS outputGAS2.o scalarTimesA_GAS.s
	CC CCFLAGS $(project).out CFILE *.o

clean:
	$(RM)  $(relocatables)
mostlyclean: clean
	$(RM) $(executable) *~