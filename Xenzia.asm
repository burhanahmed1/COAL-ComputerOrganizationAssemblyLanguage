[org 0x0100] 
jmp start 

printnum: 
 push bp 
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



delay1:
    push cx
	push dx
    mov cx,500 ;
    loop1:
        ; Inner loop for 10000 cycles
        mov dx,500
        nestedloop:
            dec dx
            jnz nestedloop
        dec cx
        jnz loop1
   pop dx
   pop cx
 ret

; subroutine to clear the screen for game
clrscr2: 
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

printhor:                       ;Subroutine for printing horizontal borders
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax               ;  point es to video base 
 mov al, 80               ; load al with columns per row 
 mul byte [bp+10]    ; multiply with y position 
 add ax, [bp+12]      ; add x position 
 shl ax, 1                  ; turn into byte offset 
 mov di, ax                ; point di to required location 
 mov al, [bp+6]       ; mov space in al 
 mov cx, [bp+4]       ; load length of string in cx 
 mov ah, [bp+8]       ; load attribute in ah 
next:
 mov [es:di], ax         ; show this char on screen 
 add di, 2                  ; move to next screen location      
 loop next           ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10

printver:                   ;subroutine for Printing Vertical Borders
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax               ;  point es to video base 
 mov al, 80               ; load al with columns per row 
 mul byte [bp+10]    ; multiply with y position 
 add ax, [bp+12]      ; add x position 
 shl ax, 1                  ; turn into byte offset 
 mov di, ax                ; point di to required location 
 mov al, [bp+6]        ; mov space in al 
 mov cx, [bp+4]       ; load length of string in cx 
 mov ah, [bp+8]       ; load attribute in ah 
next1:
 mov [es:di], ax         ; show this char on screen 
 add di, 160                 ; move to next screen location      
 loop next1                   ; repeat the operation cx times 
 pop di 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10

print_ast_up:
 push es
 push ax
 push di
 mov ax,0xb800
 mov es,ax
 mov ax,0x7020
 mov di,[ast_pos]
 mov [es:di],ax
 mov ax,0x702A              ;storing attribute and character of head
 sub di,160
 mov [es:di],ax             ;prints head
 mov [ast_pos],di
 pop di
 pop ax
 pop es
 ret

print_ast_down:
 push es
 push ax
 push di
 mov ax,0xb800
 mov es,ax
 mov ax,0x7020
 mov di,[ast_pos]
 mov [es:di],ax
 mov ax,0x702A              ;storing attribute and character of head
 add di,160
 mov [es:di],ax             ;prints head
 mov [ast_pos],di
 pop di
 pop ax
 pop es
 ret

print_ast_left:
 push es
 push ax
 push di
 mov ax,0xb800
 mov es,ax
 mov ax,0x7020
 mov di,[ast_pos]
 mov [es:di],ax
 mov ax,0x702A              ;storing attribute and character of head
 sub di,2
 mov [es:di],ax             ;prints head
 mov [ast_pos],di
 pop di
 pop ax
 pop es
 ret

print_ast_right:
 push es
 push ax
 push di
 mov ax,0xb800
 mov es,ax
 mov ax,0x7020
 mov di,[ast_pos]
 mov [es:di],ax
 mov ax,0x702A              ;storing attribute and character of head
 add di,2
 mov [es:di],ax             ;prints head
 mov [ast_pos],di
 pop di
 pop ax
 pop es
 ret

move_up:                      
 call delay1
 call print_ast_up                
 call collision                   ;checks for collision with borders
 ret


move_down:   
 call delay1
 call print_ast_down
 call collision                 ;checks for collision with borders
 ret
 
move_left:
 call delay1
 call print_ast_left
 call collision                  ;checks for collision with borders
 ret

move_right:
 call delay1
 call print_ast_right
 call collision                   ;checks for collision with borders and body
 ret


collision:
 push ax
 push bx
 push cx
 push si
 mov ax,[ast_pos]              ;storing head position
 mov cx,[borderlength]            ;storing length of border for loop
 mov si,0

 loop_bordercollision:
  mov bx,[border+si]            
  add si,2
  cmp ax,bx                       ;cmp each border posotion with head
  je terminate_program
  loop loop_bordercollision

terminate_program
 pop si
 pop cx
 pop bx
 pop ax
 

terminate:

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




start:

 call clrscr2
 ;printing upper border
 mov ax, 0
 push ax                      ;x position 
 mov ax, 0
 push ax                      ; y position 
 mov ax, 0x20                 ; brown attribute 
 push ax                      
 mov ax, 0x5F                 ;dash
 push ax                 
 mov ax, 80
 push ax                      ;length 
 call printhor    

 ;printing lower border
 mov ax, 0
 push ax                    ;x position 
 mov ax, 24 
 push ax                    ; y position 
 mov ax, 0x20               ; attribute 
 push ax                      
 mov ax, 0x5F               ;dash
 push ax                 
 mov ax, 80
 push ax                    ;  length 
 call printhor 

 ;printing right border
 mov ax, 79
 push ax                    ;x position 
 mov ax, 0
 push ax                    ;y position 
 mov ax, 0x20               ; attribute 
 push ax               
 mov ax, 0x7C
 push ax               
 mov ax, 25
 push ax                    ; push length 
 call printver   
 
 ; printing left border
 mov ax, 0
 push ax                      ;x position 
 mov ax, 0
 push ax                      ;y position 
 mov ax, 0x20                 ; attribute 
 push ax               
 mov ax, 0x7C
 push ax               
 mov ax, 25
 push ax                      ; push length 
 call printver
 
	

 call print_ast_right
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


 ;main loop to move ast
move_main:
    jmp nx

	go_up:
	call move_up
    jmp nx
		
	go_down:
	call move_down
    jmp nx

    go_left:
	call move_left
    jmp nx
		
	go_right:
	call move_right
    jmp nx

    nx:
	mov ah,0
    int 0x16
    cmp ah,0x48
    je go_up
    cmp ah,0x50
    je go_down
    cmp ah,0x4B
    je go_left
    cmp ah,0x4D
    je go_right
	jmp move_main

    
jmp terminate




tickcount: dw 0
old: dd 0

close: db 0
left: db 0
right: db 0
up: db 0
down: db 0
ast_pos : dw 2000
borderlength : dw 206
border : dw 0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,160,320,480,640,800,960,1120,1280,1440,1600,1760,1920,2080,2240,2400,2560,2720,2880,3040,3200,3360,3520,3680,3840,3842,3844,3846,3848,3850,3852,3854,3856,3858,3860,3862,3864,3866,3868,3870,3872,3874,3876,3878,3880,3882,3884,3886,3888,3890,3892,3894,3896,3898,3900,3902,3904,3906,3908,3910,3912,3914,3916,3918,3920,3922,3924,3926,3928,3930,3932,3934,3936,3938,3940,3942,3944,3946,3948,3950,3952,3954,3956,3958,3960,3962,3964,3966,3968,3970,3972,3974,3976,3978,3980,3982,3984,3986,3988,3990,3992,3994,3996,3998,318,478,638,798,958,1118,1278,1438,1598,1758,1918,2078,2238,2398,2558,2718,2878,3038,3198,3358,3518,3678,3838
