Write a program taskOne that starts printing characters ‘*’ starting from top left corner of the screen moving to top right then to bottom right to the bottom left to top left in an infinite loop. Verify your program.
Perform all the functionality in one function. Do not use function call inside taskOne.

[org 0x0100] 
jmp start
pos: dw 0
prev: dw 20

delay:
    push cx
	push dx
    mov cx,250 ;
    loop1:
        mov dx,250
        nestedloop:
            dec dx
            jnz nestedloop
        dec cx
        jnz loop1
   pop dx
   pop cx
 ret

clrscr: 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 xor di, di ; point di to top left column 
 mov ax,0x7020 ; space char in normal attribute 
 mov cx, 2000 ; number of screen locations 
 cld ; auto increment mode 
 rep stosw ; clear the whole screen 
 pop di
 pop cx 
 pop ax 
 pop es 
 ret 

print: 
 push bp 
 mov bp, sp 
 push es 
 push ax
 push di
 mov ax, 0xb800 
 mov es, ax        ; point es to video base 
 mov ax,0x7020
 mov di,[prev]
 mov [es:di],ax
 mov di,[pos]           ; point di to required location 
 mov ax,0x702A
 mov [es:di], ax            ; show this char on screen 
 pop di 
 pop ax 
 pop es 
 pop bp 
 ret


posright:
 push bp
 mov bp,sp
 push ax
 push bx

 mov ax,[pos]
 mov word[prev],ax
 add ax,2
 mov word[pos],ax

 pop bx
 pop ax
 pop bp
 ret

posleft:
 push bp
 mov bp,sp
 push ax
 push bx

 mov ax,[pos]
 mov word[prev],ax
 sub ax,2
 mov word[pos],ax

 pop bx
 pop ax
 pop bp
 ret

posup:
 push bp
 mov bp,sp
 push ax
 push bx

 mov ax,[pos]
 mov word[prev],ax
 sub ax,160
 mov word[pos],ax

 pop bx
 pop ax
 pop bp
 ret

posdown:
 push bp
 mov bp,sp
 push ax
 push bx

 mov ax,[pos]
 mov word[prev],ax
 add ax,160
 mov word[pos],ax

 pop bx
 pop ax
 pop bp
 ret

start: 
 call clrscr
 mov cx,0xFFFE
 l1:
  move_right:
   call print
   call posright
   call delay
   mov ax,[pos]
   cmp ax,160
   jne move_right
   mov word[pos],158
   mov word[prev],156

  move_down:
   call print
   call posdown
   call delay
   mov ax,[pos]
   cmp ax,3998
   jne move_down

  move_left:
   call print
   call posleft
   call delay
   mov ax,[pos]
   cmp ax,3838
   jne move_left
   mov word[pos],3840
   mov word[prev],3842

  move_up:
   call print
   call posup
   call delay
   mov ax,[pos]
   cmp ax,0
   jne move_up

 loop l1



 mov ax, 0x4c00 ; terminate program 
 int 0x21