[org 0x0100]
jmp start

; subroutine to clear the screen 
clrscr: push es 
 push ax 
 push di
 mov ax, 0xb800 
 mov es, ax     ; point es to video base 
 mov di, 0      ; point di to top left column 
nextloc:
 mov word [es:di], 0x0720    ; clear next char on screen 
 add di, 2                   ; move to next screen location 
 cmp di, 4000                ; has the whole screen cleared 
 jne nextloc                 ; if no clear next position 
 pop di 
 pop ax 
 pop es 
 ret 

printstr_ver: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location
 mov al,[bp+6]
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar1: 
 mov [es:di], ax ; show this char on screen 
 add di, 160
 loop nextchar1 ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10 

printstr_dia1: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location
 mov al,[bp+6]
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar2: 
 mov [es:di], ax ; show this char on screen 
 add di, 162
 loop nextchar2 ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10 

printstr_dia2: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location
 mov al,[bp+6]
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar4: 
 mov [es:di], ax ; show this char on screen 
 add di, 158
 loop nextchar4 ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10 

printstr_hor: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location
 mov al,[bp+6]
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar3: 
 mov [es:di], ax ; show this char on screen 
 add di, 2
 loop nextchar3 ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10



start:
 call clrscr


 ;/////////////Diamond 
 mov ax, 60
 push ax ; push x position 
 mov ax, 5 
 push ax ; push y position 
 mov ax, 0x09 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, 0x2A
 push ax ; push address of message 
 mov ax,6
 push ax  ; push message length 
 call printstr_dia2

 mov ax,61
 push ax ; push x position 
 mov ax, 6 
 push ax ; push y position 
 mov ax, 0x09 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, 0x2A
 push ax ; push address of message 
 mov ax,5
 push ax  ; push message length 
 call printstr_dia1

 mov ax,56
 push ax ; push x position 
 mov ax, 11 
 push ax ; push y position 
 mov ax, 0x09 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, 0x2A
 push ax ; push address of message 
 mov ax,5
 push ax  ; push message length 
 call printstr_dia1

 mov ax,64
 push ax ; push x position 
 mov ax, 11
 push ax ; push y position 
 mov ax, 0x09 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, 0x2A
 push ax ; push address of message 
 mov ax,4
 push ax  ; push message length 
 call printstr_dia2



mov ax,0x4c00
int 0x21