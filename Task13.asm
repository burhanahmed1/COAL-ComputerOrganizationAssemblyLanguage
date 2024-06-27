Difference of two sets (S1-S2) is a set having elements of S1 which are NOT Present in S2, see following examples for detail. Your task is to write a subroutine in Assembly Language that finds Difference of two sets (S1-S2). Note that both the sets are sorted and have distinct elements only.


[org 0x0100]

    S1:  db -3, -1, 2, 5, 6, 8, 9
    S2:  db -2, 2, 6, 7, 9
    diff: db 0,0,0,0,0,0,0

Subtract:
    xor di, di         
    xor si, si         
    xor bx, bx       

next:

    cmp di, 7
    je end
    
    cmp bx, 3
    je copy
    
   
    mov al, [S1 + di]
    mov dl, [S2 + bx]
    cmp al, dl
    
    
    je skip
 
    mov [diff + si], al
    mov dx,[diff + si]
    inc si
    
skip:
    inc di
    inc bx
    jmp next

copy:
    rep movsb

 end : 
  mov ax,0x4c00
  int 0x21