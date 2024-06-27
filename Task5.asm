Write a program which adds the contents of the following array using register + offset addressing. Array dw 111. 999, 888, 888, 11, 99, 88, 88, 1, 9, 8, 8


[org 0x0100]
	jmp start
Array:	dw 111, 999, 888, 888, 11, 99, 88, 88, 1, 9, 8, 8
total:	dw 0	

start:	mov bx,0
	mov cx,12
	mov ax,0

l1:	add ax, [Array+bx]
	add bx, 2
	sub cx, 1
	jnz l1
	
	mov[total],ax
	mov ax, 0x4c00
	int 0x21
	