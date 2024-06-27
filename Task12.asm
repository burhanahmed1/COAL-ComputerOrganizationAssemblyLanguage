Given any array of unsigned numbers nums, generate factorial of each number in nums and store in fac_num array.

initial values of array:
nums: dw 3,5,4,8,7
fac_num: dw 0,0,0,0,0

after running code
fac_num: dw 6,120,24,40320,5040

[org 0x0100]

nums dw 3, 5, 4, 8, 7
fac_num dw 0, 0, 0, 0, 0
    
mov si, 0  
mov di, 0 

next_number:
        mov ax, [nums + si]
        call factorial
        mov [fac_num + di], ax
        add si, 2  
        add di, 2  
        cmp si, 10 
        jl next_number

mov ax,0x4c00
int 0x21   

factorial:
    mov dx,11
    mov bx, dx

fac_loop:
        add cx, bx
        cmp cx, ax
        jge fac_end
        jmp fac_loop

fac_end:
        mov ax, cx

    ret
