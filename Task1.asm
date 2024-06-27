Write an assembly language program which fulfills the following:
1. Load 25h to Ax register
2. Swap contents of Ax and Bx
3. Load the contents of memory location [0x270] in Cx.
4. Define an array of num = [ 12,25,10] and load the contents of array in Ax using index addressing. [hint: array is defined as: num: db 1, 2 at the end of code]

[org 0x0100]
mov ax,0x25
mov bx,5
mov dx,ax
mov ax,bx
mov bx,dx
mov cx,[0x270]
num db 12,25,10
mov si,0
mov ax,[num+si]
mov si,1
mov ax,[num+si]
mov si,2
mov ax,[num+si]
mov ax,0x4c00
int 0x21