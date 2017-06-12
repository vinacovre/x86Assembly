    SECTION .data
param:    DB    5
 
    SECTION .text
global _start
 
;Program entry point
_start:
    mov    cl,0
    mov    bl,0
    mov    al,1
cont:    
    inc    cl          ; cl = 1 + 1 + 1 + 1 + 1
    add    bl,cl       ; bl = bl + cl --> bl = 1 + 2 + 3 + 4 + 5
    mul    cl          ; al = al * cl --> al = 1 * 1 * 2 * 3 * 4 * 5
    cmp    cl,[param]
    jne    cont        ; if (cl != 5) cont...
    xchg   al,bl       ; al =  15, bl = 120
    sub    bl,al       ; bl = bl - al | bl = 120 - 15
    mov    al,1
    int    0x80

    ; RETURN: 105   