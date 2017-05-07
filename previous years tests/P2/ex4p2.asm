  SECTION .data
x:	db	10
par:	db	'par'
impar:	db	'impar'

  SECTION .text
global _start
_start:

mov eax,[x]
mov bx,2
div bx

xor cx,cx
cmp dx,cx
jne else_part

then_part:
mov eax,4
mov ebx,1
mov ecx,par
mov edx,3
int 80h
jmp end

else_part:
mov eax,4
mov ebx,1
mov ecx,impar
mov edx,5
int 80h

end:
mov eax,1
int 80h
