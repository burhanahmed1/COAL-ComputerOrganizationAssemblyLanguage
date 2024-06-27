Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105). Store AX' in BX. Make a 32-bit memory variable f, initialize it with 0 and compute
f = (A × B) + {A, B}
× is Multiplication operation, + is Addition operation whereas {A, B} concatenates 16-bit A and B to form 32-bit number.


[org 0x0100]

roll_number dw 1105   
f dd 0                 

mov ax, [roll_number]
not ax
mov bx, ax
    xor dx, dx
    mov ax, [roll_number]

    movzx ecx, cx
    mov edx, 0
    shl edx, 16
    or edx, ecx
    add dword [f], edx

mov ax,0x4c00
int 0x21

multiply:
    xor cx, cx        
    xor di, di       

multiply_loop:
    add di, ax       
    adc dx, 0         
    adc di, 0         
    inc cx             
    cmp cx, bx         
    jl multiply_loop  
    ret

