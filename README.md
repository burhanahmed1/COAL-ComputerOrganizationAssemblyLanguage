# **Computer Organization and Assembly Language**

# Files Description
The practice files are from Task1 to Task26, and Acute Triangle, Right Triangle, Diamond, VowelCount, Xenzia and Xenzia1.

## Task 1 :
Write an assembly language program which fulfills the following:
1. Load 25h to Ax register
2. Swap contents of Ax and Bx
3. Load the contents of memory location [0x270] in Cx.
4. Define an array of num = [ 12,25,10] and load the contents of array in Ax using index addressing. [hint: array is defined as: num: db 1, 2 at the end of code]

## Task 2 :
1. Write a program which adds five numbers using memory variables n1, n2, n3, n4, n5. Initialize the memory variables to 10, 20, 30, 40, 50. Make a new variable, sum, which stores the sum of all.
2. Modify the program in part a using a single memory label, n, for inputs and result.

## Task 3 :
Write a program which fulfills the following requirements:
```
Ax = 200h
Bx=150h
Memory location 250 =50h
Memory Location 200= 25h
Array = {1,2,7,5,10}
```
Load Ax with contents of memory location 200 using indirect addressing

## Task 4 :
Write a program which fulfills the following requirements:
```
Ax = 200h
Bx=150h
Memory location 250 =50h
Memory Location 200= 25h
Array = {1,2,7,5,10}
```
Load Cx with contents of memory location 250 using direct addressing.

## Task 5 :
Write a program which adds the contents of the following array using register + offset addressing. Array dw 111. 999, 888, 888, 11, 99, 88, 88, 1, 9, 8, 8

## Task 6 :
Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105).

## Task 7 :
Modify the program in task 6 to swap two bits

## Task 8 :
Modify your program in Task 6 and 7 to swap two nibbles

## Task 9 :
Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105). Store AX' in BX. Make a memory variable f, initialize it with 0 and compute
```
f = (A||B)&&(A XOR 0x1BCD)
```
|| is bitwise OR operation, && is bitwise AND operation whereas XOR is bitwise XOR operation.

## Task 10 :
Initialize AX with last 4 digits of your roll number (for example, if your roll number is 16L-1105 then AX should be initialized with 1105). Store AX' in BX. Make a 32-bit memory variable f, initialize it with 0 and compute
```
f = (A × B) + {A, B}
```
× is Multiplication operation, + is Addition operation whereas {A, B} concatenates 16-bit A and B to form 32-bit number.

## Task 11 :
Differentiate between Near, Far and Short Jumps. Write your own assembly language programs and demonstrate how these jumps have been taken.

## Task 12 :
Given any array of unsigned numbers nums, generate factorial of each number in nums and store in fac_num array.

initial values of array:
```
nums: dw 3,5,4,8,7
fac_num: dw 0,0,0,0,0
```
after running code
```
fac_num: dw 6,120,24,40320,5040
```

## Task 13 :
Difference of two sets (S1-S2) is a set having elements of S1 which are NOT Present in S2, see following examples for detail. Your task is to write a subroutine in Assembly Language that finds Difference of two sets (S1-S2). Note that both the sets are sorted and have distinct elements only.

## Task 14 :
Initialize AX with last 4 digits of your roll number as Hexadecimal number (for example, if your roll number is 16L-4195 then AX should be initialized with 0x4195). Write a subroutine which receives AX as input and returns number of 1s in AX.
n = binary_ones(Roll #)

For example, # of 1s in 0x 4195 is

n = ones(0x4195) = ones(0100_0001_1001_0101) = 6

## Task 15 :
A number pyramid (we call it Al-Khwarizmi Pyramid). This pyramid is expanding based on the value of s, its size. Write a program which uses s = n + 5 (n from Activity 2) as size of Al-Khwarizmi Pyramid and returns the cumulative sum. For example, if n = 6 then s = 11, and program should return 506.

## Task 16 :
Write a subroutine which uses nested loops for creating a delay of around 3-5 secs.
Note: Do not use any special commands or interrupts for creating any delay.

## Task 17 :
STOS Example – Clearing the Screen
• LODS Example – String Printing
• SCAS Example – String Length
• MOVS Example – Screen Scrolling

## Task 18 :
Use the subroutines developed in Task 16 and Task 17 to create an animation (of Start or End Screen) which shows the following information about you (every message with delay) as shown
``` txt
Name : Burhan Gujjar
Institute : FAST School of Computing
Batch : 2022
Roll # 7520
Email ID : l227520@lhr.nu.edu.pk
Address : Lahore,Pakistan
Features : Punctual, Brave
```


## Task 19 :
Write a program that prints and prints the following messages: one message per keypress.
``` txt
Hi- I am Burhan Gujjar
I am a patriot
I am from Fast
My Roll # is 22L-7520
```
Expected output after 4 key presses


## Task 20 :
You need to draw 4 lines creating a diamond shape and satisfying the coordinates and increment or decrement as per requirement of the line.

## Task 21 :
Your task is to get two keystrokes using keyboard interrupt number 0x16 one after the other. On the first keystroke, regardless of which key is pressed, you should clear the screen. The following should be done on second keystroke:
1. If you press ‘a’, your program should display “Hi, you pressed a”.
2. If you press ‘b’, your program should display “Hi, you pressed b”.
3.For any other case your program should display “Hi, you entered wrong credentials”.
4. After two keystrokes, your program should terminate.

## Task 22 :
Write a TSR takes name of the student and then shows it onto the screen according to given rules:

• While left shift is pressed, the name should be displayed on screen.
• If left shift is released, your screen should be cleared
• For any other buttons, your code should not do anything

Scan Code (Left Shift Press): 0x2a
Scan Code (Right Shift Press): 0x36.

## Task 23 :
Write a program to make an asterisk travel the border of the screen, from upper left to upper right to lower right to lower left and back to upper left indefinitely.

## Task 24 :
Write a program taskOne that starts printing characters ‘*’ starting from top left corner of the screen moving to top right then to bottom right to the bottom left to top left in an infinite loop. Verify your program. Perform all the functionality in one function. Do not use function call inside taskOne.

## Task 25 :
Write a subroutine reverses the contents of a given string. 

For example, if it is provided the string

String1 DB “I am Mr X”, ‘0’

It should return

String2 DB “X rM ma I”, ‘0’

## Task 26 :
Write a subroutine which copies contents of string1 into another string but without spaces and punctuation marks. For example, if it is provided the following string

String1 DB “Mr. Ali, Usman, & Anwar! Doing what???? want to travel????”, ‘0’

It should return

String2 DB “MrAliUsmanAnwarDoingwhatwanttotravel”, ‘0’

## Acute Triangle :
Assembly Language code for creating an Acute Angled Triangle.

## Right Triangle :
Assembly Language code for creating a Right Angled Triangle.

## Diamond :
Assembly Language code for creating a Diamond.

## Vowel Count :
Assembly Language code for counting the number of Vowels in a given string.

## Xenzia :
Code for Xenzia.

## Xenzia1 :
A different approach for Xenzia.
