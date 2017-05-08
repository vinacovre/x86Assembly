    SECTION .data

var1:   db  2
var2:   db  3
var3:   db  7,9

    SECTION .text

global _start

_start:

    mov     ecx, var1   ; ecx points to the address of var1 (&var1[0])
    inc     ecx         ; increment ecx... now points to the next position (which ir &var2[0])
    mov     edx, var2   ; edx points to the address of var2 (&var2[0])
    inc     edx         ; increment edx... now points to the next position (which ir var3[0])
    xchg    ecx, edx    ; ecx <--> edx ... ecx points to &var3[0] and edx points to &var2[0]
    mov     ebx, [ecx]  ; ebx gets the content in &var3[0]... ebx = 7
    sub     ebx, [edx]  ; ebx = ebx - (content in &var2[0])... ebx = 7 - 3 = 4

    mov     eax, 1
    int     0x80

    ; seeReturn: 4