  SECTION .data
array:	db	2,6,18,1,9,20,10,4,7,11
size:	db	10

  SECTION .text
global _start
_start:

mov al,[array]
mov bl,[array]
xor cl,cl
mov dl,[size]
jmp for_cond

loop_body:
inc cl
cmp [array+cl],al
jg maior
cmp [array+cl],bl
jl menor
jmp for_cond

maior:
mov al,[array+cl]
jmp for_cond

menor:
mov bl,[array+cl]

for_cond:
cmp cl,dl
jl loop_body

end:
sub al,bl
mov bl,al

mov al,1
int 80h
