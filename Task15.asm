A number pyramid (we call it Al-Khwarizmi Pyramid). This pyramid is expanding based on the value of s, its size.
Write a program which uses s = n + 5 (n from Activity 2) as size of Al-Khwarizmi Pyramid and returns the cumulative sum. For example, if n = 6 then s = 11, and program should return 506.

[org 0x0100]
number: dw 6

mov ax, [number]
mov bx, 5
add ax,bx
mov bx,ax

inc ax
mul bx

shr ax, 1
rcr dx, 1

mov cx, ax
add cx, dx

add ax, cx
adc dx, 0

sub ax, bx

ret

mov ax,0x4c00
int 0x21