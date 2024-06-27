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

## Task 15 :

## Task 16 :

## Task 17 :

## Task 18 :

## Task 19 :

## Task 20 :

## Task 21 :

## Task 22 :

## Task 23 :

## Task 24 :

## Task 25 :

## Task 26 :

## Acute Triangle :

## Right Triangle :

## Diamond :

## Vowel Count :

## Xenzia :

## Xenzia1 :

