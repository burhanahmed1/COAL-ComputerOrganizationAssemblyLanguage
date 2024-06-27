Write a program which fulfills the following requirements:
Ax = 200h
Bx=150h
Memory location 250 =50h
Memory Location 200= 25h
Array = {1,2,7,5,10}
Load Ax with contents of memory location 200 using indirect addressing

[org 0x0100]
	jmp start
n: dw 10,20,30,40,50
sum: dw 0	

start:
	mov bx,0
	mov cx,5
	mov ax,0

		

l1:	
	add ax, [n+bx]
	add bx,2
	sub cx, 1
	jnz l1
	mov[sum],ax
	mov ax, 0x4c00
	int 0x21
	