[org 0x0100]



jmp start

old dd 0

tickcount: dw 0 
; subroutine to print a number at top left of screen 
; takes the number to be printed as its parameter 
printnum: push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov ax, [bp+4] ; load number in ax 
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit: mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit ; if no divide it again 
 mov di, 140 ; point di to 70th column 
nextpos: pop dx ; remove a digit from the stack 
 mov dh, 0x07 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos ; repeat for all digits on stack 
 pop di 
 pop dx 
 pop cx 
 pop bx 
 pop ax
pop es 
 pop bp 
 ret 2

; timer interrupt service routine 
timer: push ax 
 inc word [cs:tickcount]; increment tick count 
 push word [cs:tickcount] 
 call printnum ; print tick count 
 mov al, 0x20 
 out 0x20, al ; end of interrupt 
 pop ax 
 iret ; return from interrupt


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

move:

push bp
mov bp,sp
pusha
mov si,[bp+4]
mov bx,0xb800
	mov es,bx



mv:
call clrscr
	mov word[es:si],0x072A
cmp si,160
jle tr
cmp si,3840
jge tr

mov cx,si
 mr:
 sub cx,158   ; starting index of every ending box
 cmp cx,158   ; starting index of first row last box
 jl nx
 cmp cx,158
 je tr
 cmp cx,158
 jg mr

nx:
mov cx,si
 ml:
 sub cx,160   ; starting index of every ending box
 cmp cx,0  ; starting index of first row last box
 je tr
 cmp cx,0
 jg ml
 cmp cx,0
 jl nx1

tr:
popa
pop bp
ret 2

nx1:

mov ah,0
int 0x16
cmp ah,0x48
je up
cmp ah,0x50
je down
cmp ah,0x4B
je left
cmp ah,0x4D
je right
jmp mv


up:
sub si,160
jmp mv

down:
add si,160
jmp mv

left:
sub si,2
jmp mv


right:
add si,2
jmp mv

printnum1:
 push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di

mov ax , 80
mov bx , [bp+8]
mul bx
 mov bx, [bp+6]
 add ax ,bx
 shl ax , 1
 
 mov di ,ax
 
mov ax, 0xb800
mov es, ax ; point es to video base
mov ax, [bp+4] ; load number in ax
mov bx, 10 ; use base 10 for division
mov cx, 0 ; initialize count of digits
nextdigit1: mov dx, 0 ; zero upper half of dividend
div bx ; divide by 10
add dl, 0x30 ; convert digit into ascii value
push dx ; save ascii value on stack
inc cx ; increment count of values
cmp ax, 0 ; is the quotient zero
jnz nextdigit1 ; if no divide it again


;;mov di, 140 ; point di to 70th column
nextpos1: pop dx ; remove a digit from the stack
mov dh, 0x07 ; use normal attribute
mov [es:di], dx ; print char on screen
add di, 2 ; move to next screen location
loop nextpos1 ; repeat for all digits on stack
pop di
pop dx
pop cx
pop bx
pop ax 
pop es
pop bp
ret 6



start:
	call clrscr
	mov ax,0xb800
	mov es,ax
	mov word[es:2000],0x072A
mov ah,0
int 0x16


xor ax, ax 
 mov es, ax ; point es to IVT base 


mov ax, [es:8*4] 
 mov [old], ax ; save offset of old routine 
 mov ax, [es:8*4+2] 
 mov [old+2], ax

  cli ; disable interrupts 
 mov word [es:8*4], timer; store offset at n*4 
 mov [es:8*4+2], cs ; store segment at n*4+2 
 sti ; enable interrupts 
 

push 2000
call move

xor ax, ax 
 mov es, ax ; point es to IVT base 
cli ; disable interrupts 
 mov ax, [old] ; read old timer ISR offset 
 mov [es:8*4], ax ; restore old timer ISR offset 
 mov ax, [old+2] ; read old timer ISR segment 
 mov [es:8*4+2], ax ; restore old timer ISR segment 
 sti ; enable interrupts

push 6
push 12
push word[tickcount]
call printnum1

mov ax,0x4c00
int 0x21