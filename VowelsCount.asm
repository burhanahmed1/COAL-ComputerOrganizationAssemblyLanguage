[org 0x0100]

jmp start

; subroutine to clear the screen 
clrscr: 
 push es 
 push ax 
 push cx 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 xor di, di ; point di to top left column 
 mov ax, 0x7020 ; space char in normal attribute 
 mov cx, 2000 ; number of screen locations 
 cld ; auto increment mode 
 rep stosw ; clear the whole screen 
 pop di 
 pop cx 
 pop ax 
 pop es 
 ret 

 printnum: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push bx 
 push cx 
 push dx 
 push si
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 xor si,si
nextloc:
 mov ax, [vowelcount+si] ; load number in ax 
 mov di,[loc+si]
 mov bx, 10 ; use base 10 for division 
 mov cx, 0 ; initialize count of digits 
nextdigit: 
 mov dx, 0 ; zero upper half of dividend 
 div bx ; divide by 10 
 add dl, 0x30 ; convert digit into ascii value 
 push dx ; save ascii value on stack 
 inc cx ; increment count of values 
 cmp ax, 0 ; is the quotient zero 
 jnz nextdigit ; if no divide it again 
 nextpos: 
 pop dx ; remove a digit from the stack 
 mov dh, 0x70 ; use normal attribute 
 mov [es:di], dx ; print char on screen 
 add di, 2 ; move to next screen location 
 loop nextpos ; repeat for all digits on stack
 add si,2
 cmp si,10
 jne nextloc

 pop di 
 pop si
 pop dx 
 pop cx 
 pop bx 
 pop ax 
 pop es 
 pop bp 
 ret 

check_vowels:
 push ax 
 push cx
 push si
 push di
 mov di, [msg] ; point di to string 
 mov cx, 0xffff ; load maximum number in cx 
 xor al, al ; load a zero in al 
 repne scasb ; find zero in the string 
 mov ax, 0xffff ; load maximum number in ax 
 sub ax, cx ; find change in cx 
 dec ax ; exclude null from length
 mov cx, ax ; load string length in cx 
 mov si,0
 l1:
  

  cmp byte[msg+si],'a'
  jne skipA
  add word[vowelcount+0],1
  jmp next

  skipA:
  cmp byte[msg+si],'A'
  jne skipe
  add word[vowelcount+0],1
  jmp next
  
  skipe:
  cmp byte[msg+si],'e'
  jne skipE
  add word[vowelcount+2],1
  jmp next

  skipE:
  cmp byte[msg+si],'E'
  jne skipi
  add word[vowelcount+2],1
  jmp next

  skipi:
  cmp byte[msg+si],'i'
  jne skipI
  add word[vowelcount+4],1
  jmp next

  skipI:
  cmp byte[msg+si],'I'
  jne skipo
  add word[vowelcount+4],1
  jmp next

  skipo:
  cmp byte[msg+si],'o'
  jne skipO
  add word[vowelcount+6],1
  jmp next

  skipO:
  cmp byte[msg+si],'O'
  jne skipu
  add word[vowelcount+6],1
  jmp next

  skipu:
  cmp byte[msg+si],'O'
  jne skipU
  add word[vowelcount+8],1
  jmp next

  skipU:
  cmp byte[msg+si],'O'
  jne next
  add word[vowelcount+8],1

  next:
  inc si
  dec cx
  jnz l1

pop di
pop si
pop cx
pop ax
ret

printstr: 
 push bp 
 mov bp, sp 
 push es 
 push ax 
 push cx 
 push si 
 push di 
 mov ax, 0xb800 
 mov es, ax ; point es to video base 
 mov al, 80 ; load al with columns per row 
 mul byte [bp+10] ; multiply with y position 
 add ax, [bp+12] ; add x position 
 shl ax, 1 ; turn into byte offset 
 mov di,ax ; point di to required location 
 mov si, [bp+6] ; point si to string 
 mov cx, [bp+4] ; load length of string in cx 
 mov ah, [bp+8] ; load attribute in ah 
nextchar: 
 mov al, [si] ; load next char of string 
 mov [es:di], ax ; show this char on screen 
 add di, 2
 add si, 1 ; move to next char in string 
 loop nextchar ; repeat the operation cx times 
 pop di 
 pop si 
 pop cx 
 pop ax 
 pop es 
 pop bp 
 ret 10 

start:
 call clrscr
 call check_vowels
 
 mov ax, 0 
 push ax ; push x position 
 mov ax, 0 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, vowel 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 0 
 push ax ; push x position 
 mov ax, 1 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, a
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 0 
 push ax ; push x position 
 mov ax, 2 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, e 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 0 
 push ax ; push x position 
 mov ax, 3 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, i 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 0 
 push ax ; push x position 
 mov ax, 4 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, o 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 0 
 push ax ; push x position 
 mov ax, 5 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, u 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 mov ax, 10 
 push ax ; push x position 
 mov ax, 0 
 push ax ; push y position 
 mov ax, 0x70 ; blue on black attribute 
 push ax ; push attribute 
 mov ax, count 
 push ax ; push address of message 
 push word [len] ; push message length 
 call printstr ; call the printstr subroutine

 call printnum

mov ax,0x4c00
int 0x21

vowelcount: dw 0,0,0,0,0
loc: dw 180,340,500,660,820
msg: db 'My name is Burhan Ahmed Gujjar',0
count: db 'Count  '
vowel: db 'Vowel  '
a: db     'a or A '
e: db     'e or E '
i: db     'i or I ' 
o: db     'o or O '
u: db     'u or U '
len: dw 7