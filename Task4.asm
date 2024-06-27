Write a program which fulfills the following requirements:
Ax = 200h
Bx=150h
Memory location 250 =50h
Memory Location 200= 25h
Array = {1,2,7,5,10}
Load Cx with contents of memory location 250 using direct addressing.

[org 0x0100]
START:
   
 ; a) Load Ax with contents of memory location 200 using indirect addressing

    mov bx, 200 ; Load BX with the address 200h
    mov ax, [bx] ; Load AX with the value at the address stored in BX

    ; b) Load Cx with contents of memory location 250 using direct addressing

    mov cx, 250 ; Loading CX with the address 250h
    mov cx, [cx] ; Loading CX with the value at the address 250h

   

    
    org 200 ; Start of data section
    dw 25h ; Memory Location 200 = 25h
    dw 150h ; Memory Location 250 = 150h
    org 250 ; End of data section

    mov ax,0x4c00
    int 0x21