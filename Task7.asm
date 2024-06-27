Modify the program in task 6 to swap two bits

[org 0x0100]

roll_number dw 7520  

mov ax, [roll_number]
mov cx, 8 

swap_loop:
    mov dx, ax
    and dx, 3   
    rol dx, 1  
    mov bx,0FFFC
    and ax, bx
    or ax, dx   
    dec cx     
    jnz swap_loop  

mov ax,0x4c00
int 0x21
