Differentiate between Near, Far and Short Jumps. Write your own assembly language programs and demonstrate how these jumps have been taken.

[org 0x0100]

jmp short short_jump_target
mov eax, 1

short_jump_target:
    jmp near near_jump_target
    mov eax, 2

near_jump_target:
    jmp  far_jump_target
    mov eax, 3

far_jump_target:
    mov eax, 4

mov ax,0x4c00
int 0x21