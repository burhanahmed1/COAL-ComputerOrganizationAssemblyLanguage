Initialize AX with last 4 digits of your roll number as Hexadecimal number (for example, if your roll number is 16L-4195 then AX should be initialized with 0x4195). Write a subroutine which receives AX as input and returns number of 1s in AX.
n = binary_ones(Roll #)

For example, # of 1s in 0x 4195 is

n = ones(0x4195) = ones(0100_0001_1001_0101) = 6

[org 0x0100]

jmp start

inbinary:
push bp
mov bp,sp
push cx
push dx
mov dx,0
mov dx, [bp+4]
mov cx,16
mov word[bp+4],0

conversion:
shr dx,1
jnc loop1
inc word[bp+4]

loop1:
dec cx
jnz conversion

mov ax,[bp+4]
pop bp
ret 2


start:
mov ax,0
push 0x7520
call inbinary

mov ax,0x4c00
int 0x21