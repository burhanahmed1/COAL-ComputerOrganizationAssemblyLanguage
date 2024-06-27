1. Write a program which adds five numbers using memory variables n1, n2, n3, n4, n5. Initialize the memory variables to 10, 20, 30, 40, 50. Make a new variable, sum, which stores the sum of all.
2. Modify the program in part a using a single memory label, n, for inputs and result.

[org 0x0100]
        jmp start

n1: dw 10
n2: dw 20
n3: dw 30
n4: dw 40
n5: dw 50
sum: dw 0

start:
       mov bx,0
       mov cx,5
       mov ax,0

l0:
       add ax, [n1+bx]
       add bx,2
       sub cx,1
       jnz l0
       mov[sum],ax
       mov ax,0x4c00
       int 0x21