  SECTION .data
b:	db	2
e:	db	3

  SECTION .text
global _start
_start:

mov dl,[b]
mov bl,[e]
xor cl,cl
cmp bl,cl 
je result_um
inc cl
cmp bl,cl
je result_base
mov al,1
jmp for_cond

loop_body:
mul dl
inc cl

for_cond:
cmp cl,bl
jle loop_body
mov bl,al
jmp end

result_um:
mov bl,1
jmp end

result_base:
mov bl,al

end:

mov eax,1
int 80h
