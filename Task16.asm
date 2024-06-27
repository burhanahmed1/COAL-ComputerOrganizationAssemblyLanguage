Write a subroutine which uses nested loops for creating a delay of around 3-5 secs.
Note: Do not use any special commands or interrupts for creating any delay.


[org 0x0100]

; Define the delay subroutine
delay:
    ; Outer loop for 3-5 seconds
    mov cx, 400 ; 3-5 seconds
    loop1:
        ; Inner loop for 10000 cycles
        mov dx, 10000
        nestedloop:
            dec dx
            jnz nestedloop
        dec cx
        jnz loop1
    ret
; Start the program
start:

    ; Call the delay subroutine
    call delay

    ; Exit the program
    mov ax, 0x4c00
    int 0x21