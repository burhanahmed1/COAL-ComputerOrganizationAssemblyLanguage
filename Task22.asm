Write a TSR takes name of the student and then shows it onto the screen according to given rules:
• While left shift is pressed, the name should be displayed on screen.
• If left shift is released, your screen should be cleared
• For any other buttons, your code should not do anything
Scan Code (Left Shift Press): 0x2a
Scan Code (Right Shift Press): 0x36.

[org 0x0100]

jmp start

clrscr:
		push bp
		mov bp, sp
		push es
		push ax
		push di
		push cx
		
		mov ax, 0xb800
		mov es, ax
		xor di, di
		mov ax, 0x0720
		mov cx, 2000
		cld
		rep stosw
		
		pop cx
		pop di
		pop ax
		pop es
		pop bp
		ret
kbisr:
	pusha
	in al,0x60
	cmp al,0x2a
	jne nextcmp
	mov ah, 02h
	mov bh, 0
	mov dh, 2		;displays message in line 2
	mov dl, 0		;starts display with a gap of 0 spaces
	INT 10h
	
	mov dx,string
	mov ah,09h
	int 21h
	jmp exit
	
	nextcmp:
		cmp al,0xaa
		jne exit
		call clrscr
		jmp exit
	
	exit:
		mov al, 0x20
		out 0x20, al
		popa 
		iret
	
start:
	call clrscr
	mov ah, 02h
	mov bh, 0
	mov dh, 2		;displays message in line 2
	mov dl, 0		;starts display with a gap of 0 spaces
	int 10h
	
	mov dx, user
	mov ah, 09h
	int 21h
	
	mov si, string	;TAKING INPUT OF string 
	
	input:
		mov ah, 1
		int 21h
		
		cmp al, 13
		je display
		mov [si], al
		inc si
		inc al
		jmp input
	
	display:
		mov byte [si], '$'
		xor ax, ax
		mov es, ax
		mov ax, [es:9*4]
		mov [oldisr], ax
		mov ax, [es:9*4+2]
		mov [oldisr+2], ax
		cli
		mov word [es:9*4], kbisr
		mov [es:9*4+2], cs
		sti
		call clrscr
	
	l1:
		jmp l1
		mov dx, start
		add dx, 15
		mov cl, 4
		shr dx, cl
	    mov ax, 0x3100
		int 0x21

string: db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
user: db '','$'
oldisr: dd 0