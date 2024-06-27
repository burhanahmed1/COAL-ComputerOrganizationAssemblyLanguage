Your task is to get two keystrokes using keyboard interrupt number 0x16 one after the other. On the first keystroke, regardless of which key is pressed, you should clear the screen. The following should be done on second keystroke:
1. If you press ‘a’, your program should display “Hi, you pressed a”.
2. If you press ‘b’, your program should display “Hi, you pressed b”.
3.For any other case your program should display “Hi, you entered wrong credentials”.
4. After two keystrokes, your program should terminate.

[org 0x0100]

msg1: db 'Hi, you pressed a', 0
msg2: db 'Hi, you pressed b', 0
msg3: db 'Hi, you entered wrong credentials', 0

jmp start


; subroutine to clear the screen 
clrscr: push es 
 push ax 
 push di
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov di, 0 ; point di to top left column 
nextloc: mov word [es:di], 0x0720 ; clear next char on screen 
 add di, 2 ; move to next screen location 
 cmp di, 4000 ; has the whole screen cleared 
 jne nextloc ; if no clear next position 
 pop di 
 pop ax 
 pop es 
 ret 

strlen: push bp 
 mov bp,sp 
 push es 
 push cx 
 push di 
 les di, [bp+4] ; point es:di to string 
 mov cx, 0xffff ; load maximum number in cx 
 xor al, al ; load a zero in al 
 repne scasb ; find zero in the string 
 mov ax, 0xffff ; load maximum number in ax 
 sub ax, cx ; find change in cx 
 dec ax ; exclude null from length 
 pop di 
 pop cx 
 pop es 
 pop bp 
 ret 4 
; subroutine to print a string 
; takes the x position, y position, attribute, and address of a null 
; terminated string as parameters 
printstr: push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 push ds ; push segment of string 
 mov ax, [bp+4] 
 push ax ; push offset of string 
 call strlen 
cmp ax, 0 ; is the string empty 
 jz exit ; no printing if string is empty
 mov cx, ax ; save length in cx 
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
nextchar: lodsb ; load next char in al 
 stosw ; print char/attribute pair 
 loop nextchar ; repeat for the whole string 
exit: pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 8 


print_a:
 mov ax, 0 
 push ax ; push x position 
 mov ax, 0 
  push ax ; push y position 
 mov ax, 0x71 ; blue on white attribute 
 push ax ; push attribute 
 mov ax, [msg1] 
 push ax ; push address of message 
 call printstr 

print_b:
 mov ax, 0 
 push ax ; push x position 
 mov ax, 0 
  push ax ; push y position 
 mov ax, 0x71 ; blue on white attribute 
 push ax ; push attribute 
 mov ax, [msg2] 
 push ax ; push address of message 
 call printstr 

print_wrong:
mov ax, 0 
 push ax ; push x position 
 mov ax, 0 
  push ax ; push y position 
 mov ax, 0x71 ; blue on white attribute 
 push ax ; push attribute 
 mov ax, [msg3] 
 push ax ; push address of message 
 call printstr

start:
    mov ah, 0
    int 0x16
    call clrscr

    mov ah, 0
    int 0x16

    cmp al,97
    je print_a

    cmp al, 98
    je print_b

    jmp print_wrong

    mov ax, 0x4c00
    int 0x21