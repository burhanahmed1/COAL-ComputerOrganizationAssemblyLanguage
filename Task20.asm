You need to draw 4 lines creating a diamond shape and satisfying the coordinates and increment or decrement as per requirement of the line.

[org 0x0100]
jmp code
w equ 70 ; width offset
x equ 50 ; starting x coordinate of line
y equ 100 ; starting y coordinate of line
c equ 60 ; color


code: 
mov ah, 0
mov al, 0x13
int 10h
; draw diagonal 11:
mov cx, x
mov dx, y
mov al, c
u1: 
inc dx
mov ah, 0x0c ; put pixel
int 0x10
inc cx
cmp cx, x+w
jbe u1
;wait for keypress
mov ah,00
int 0x16

mov ax, 0x4c00
int 0x21