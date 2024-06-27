Modify your program in Task 6 and 7 to swap two nibbles

[org 0x0100]

roll_number dw 1105
mov ax, [roll_number]
mov cx, 4  
swap_loop:
    mov dx, ax
    and dx, 15       
    rol dx, 4  
    mov bx,0FFF0h
    and ax, bx 
    or ax, dx     
    dec cx    
    jnz swap_loop 

    
    
mov ax,0x4c00
int 0x21