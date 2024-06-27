Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105). Store AX' in BX. Make a memory variable f, initialize it with 0 and compute
f = (A||B)&&(A XOR 0x1BCD)
|| is bitwise OR operation, && is bitwise AND operation whereas XOR is bitwise XOR operation.


[org 0x0100]
    mov ax, 7520h
    mov bx, ax
    not bx
    
    or ax, bx
    mov cx, 1BCDh
    xor cx, ax
    and ax, cx
    mov ax, 0x4c00
    int 0x21