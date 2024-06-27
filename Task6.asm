Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105).

[org 0x0100]

roll_number dw 7520    

mov ax, [roll_number]
mov bx, 0x0AAAA
mov cx, 0x05555

and ax, bx
shr ax, 1
and ax, cx
shl ax, 1
or ax, bx


    mov ax, 0x4c00  
    int 0x21             
