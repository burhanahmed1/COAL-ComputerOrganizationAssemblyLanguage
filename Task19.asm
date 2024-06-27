Write a program that prints and prints the following messages: one message per keypress.

Hi- I am Burhan Gujjar
I am a patriot
I am from Fast
My Roll # is 22L-7520

Expected output after 4 key presses

[org 0x0100]

jmp start
msg1: db 'Hi- I am Burhan Gujjar',0 
msg2: db 'I am a patriot',0
msg3: db 'I am from Fast',0
msg4: db 'My Roll # is 22L-7520',0

; subroutine to clear the screen
clrscr:
push es
push ax
push cx
push di
mov ax, 0xb800
mov es, ax ; point es to video base
xor di, di ; point di to top left column
mov ax, 0x0720 ; space char in normal attribute
mov cx, 2000 ; number of screen locations
cld ; auto increment mode
rep stosw ; clear the whole screen
pop di
pop cx
pop ax
pop es
ret



printstr:
push bp
mov bp, sp
push es
push ax
push cx
push si
push di
push ds
pop es ; load ds in es
mov di, [bp+4] ; point di to string
mov cx, 0xffff ; load maximum number in cx
xor al, al ; load a zero in al
repne scasb ; find zero in the string
mov ax, 0xffff ; load maximum number in ax
sub ax, cx ; find change in cx
dec ax ; exclude null from length
jz exit ; no printing if string is empty
mov cx, ax ; load string length in cx
mov ax, 0xb800
mov es, ax ; point es to video base
mov al, 80 ; load al with columns per row
mul byte [bp+8] ; multiply with y position
add ax, [bp+10] ; add x position
shl ax, 1 ; turn into byte offset
mov di,ax ; point di to required location
mov si, [bp+4] ; point si to string
mov ah, [bp+6] ; load attribute in ah
cld ; auto increment mode
nextchar: 
lodsb ; load next char in al
stosw ; print char/attribute pair
loop nextchar ; repeat for the whole string
exit: 
pop di
pop si
pop cx
pop ax
pop es
pop bp
ret 8


scrollup: 
push bp
mov bp,sp
push ax
push cx
push si
push di
push es
push ds
mov ax, 80 ; load chars per row in ax
mul byte [bp+4] ; calculate source position
mov si, ax ; load source position in si
push si ; save position for later use
shl si, 1 ; convert to byte offset
mov cx, 2000 ; number of screen locations
sub cx, ax ; count of words to move
mov ax, 0xb800
mov es, ax ; point es to video base
mov ds, ax ; point ds to video base
xor di, di ; point di to top left column
cld ; set auto increment mode
rep movsw ; scroll up
mov ax, 0x0720 ; space in normal attribute
pop cx ; count of positions to clear
rep stosw ; clear the scrolled space
pop ds
pop es
pop di
pop si
pop cx
pop ax
pop bp
ret 2


start: 
 ;mov ah, 0x10 ; service 10 – vga attributes 
 ;mov al, 03 ; subservice 3 – toggle blinking 
 ;mov bl, 01 ; enable blinking bit 
 int 0x10 ; call BIOS video service 

call clrscr ; call the clrscr subroutine

mov ah, 0 ; service 0 – get keystroke 
int 0x16 ; call BIOS keyboard service

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, msg1
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup

mov ah, 0 ; service 0 – get keystroke 
int 0x16 ; call BIOS keyboard service

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, msg2
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup

mov ah, 0 ; service 0 – get keystroke 
int 0x16 ; call BIOS keyboard service

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, msg3
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup

mov ah, 0 ; service 0 – get keystroke 
int 0x16 ; call BIOS keyboard service

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, msg4
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup


mov ax, 0x4c00 ; terminate program
int 0x21