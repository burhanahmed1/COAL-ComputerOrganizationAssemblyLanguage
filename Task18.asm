Use the subroutines developed in Task 16 and Task 17 to create an animation (of Start or End Screen) which shows the following information about you (every message with delay) as shown
Name : Burhan Gujjar
Institute : FAST School of Computing
Batch : 2022
Roll # 7520
Email ID : l227520@lhr.nu.edu.pk
Address : Lahore,Pakistan
Features : Punctual, Brave

[org 0x0100]

jmp start
name: db 'Name : Burhan Gujjar',0 
institute: db 'Institute : FAST School of Computing',0
batch: db 'Batch : 2022',0
roll: db 'Roll # 7520',0
email: db 'Email ID : l227520@lhr.nu.edu.pk',0
address: db 'Address : Lahore,Pakistan',0
feature: db 'Features : Punctual, Brave',0


delay:
    ; Outer loop for 3-5 seconds
    mov cx, 500 ; 3-5 seconds
    loop1:
        ; Inner loop for 10000 cycles
        mov dx, 2000
        nestedloop:
            dec dx
            jnz nestedloop
        dec cx
        jnz loop1
    ret

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
call clrscr ; call the clrscr subroutine

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, name
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, institute
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, batch
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, roll
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, email
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, address
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup
call delay

mov ax, 30
push ax ; push x position
mov ax, 10
push ax ; push y position
mov ax, 0x0F ; white on black attribute
push ax ; push attribute
mov ax, feature
push ax ; push address of message
call printstr
mov ax,1
push ax ; push number of lines to scroll
call scrollup

mov ax, 0x4c00 ; terminate program
int 0x21