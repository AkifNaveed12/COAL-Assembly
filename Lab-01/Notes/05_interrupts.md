
---

# `05_interrupts.md`

```md
# DOS Interrupts — INT 21H

## What is an Interrupt?

An interrupt allows the program to request a service from DOS.

For Lab 01 we mainly use:

```asm
INT 21H
The value in AH selects the DOS function.

Function 02H — Display Character
Syntax
MOV AH, 02H
MOV DL, 'A'
INT 21H
Purpose

Displays one character.

Registers
AH = 02H
DL = character

Example:

MOV AH, 02H
MOV DL, 'K'
INT 21H

Output:

K
Function 09H — Display String
Syntax
MOV AH, 09H
LEA DX, MSG
INT 21H
Purpose

Displays a string.

The string must end with $.

Example:

.DATA
    MSG DB 'Hello, Assembly!$'

Then:

MOV AX, @DATA
MOV DS, AX

MOV AH, 09H
LEA DX, MSG
INT 21H

Output:

Hello, Assembly!
Function 4CH — Terminate Program
Syntax
MOV AH, 4CH
INT 21H
Purpose

Terminates the program and returns to DOS.

INT 21H Quick Reference
AH	Function	Required register
02H	Display character	DL
09H	Display string	DX = address
4CH	Terminate program	None for basic use
Character Output Flow
AH = 02H
   +
DL = character
   ↓
INT 21H
   ↓
Character displayed

Example:

MOV AH, 02H
MOV DL, 'A'
INT 21H
String Output Flow
.DATA
MSG DB 'Hello$'
     ↓
DS initialized
     ↓
DX = address of MSG
     ↓
AH = 09H
     ↓
INT 21H
     ↓
String displayed
Number vs Character

CPU numeric value:

5 = 05H

ASCII character:

'5' = 35H

For a single-digit numeric result:

ADD AL, '0'

converts:

05H → 35H

Then it can be printed using:

MOV DL, AL
MOV AH, 02H
INT 21H

Important:

ADD AL,'0' only works for single-digit numeric results.

It does NOT directly convert 25 into the characters 2 and 5.


---
