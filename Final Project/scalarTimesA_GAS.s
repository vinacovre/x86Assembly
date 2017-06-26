    .text

    .global scalarTimesA_GAS
scalarTimesA_GAS: 

    # Prologue
    pushl   %ebp
    movl    %esp,%ebp

    # getting L
    movl    8(%ebp),%eax
    mull    %eax                    # eax = L * L
    decl    %eax                    # eax = (L * L) - 1
    movl    %eax,%ecx               # ecx (counter) = (L * L) - 1

    # getting the second parameter --> scalar
    movl    12(%ebp),%ebx

    # getting first element of A
    movl    16(%ebp),%esi

    # getting first element of the output matrix
    movl    20(%ebp),%edi


MUL_BY_SCALAR: 
    # ecx = counter = L
    movl    (%esi,%ecx,4),%eax      # getting right value in matrix
    mulw    %bx                     # scalar * ax
    movl    %eax,(%edi,%ecx,4)      # insert calculated value in the right place
    decl    %ecx                    # counter--
    jns     MUL_BY_SCALAR           # until counter < 0


    # Epilogue
    movl    %ebp,%esp
    popl    %ebp
    ret
