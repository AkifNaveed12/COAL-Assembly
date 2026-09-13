
---

# `03_instructions.md`

```md
# 8086 Basic Instructions

## 1. MOV

### Syntax

```asm
MOV destination, source

Meaning

Copies source into destination.

destination = source
Examples
MOV AX, 0005H
MOV BX, AX
MOV AL, NUM1
MOV DL, 'A'
Important

MOV copies; it does not perform arithmetic.

MOV BX, AX

does NOT remove the value from AX.

2. ADD
Syntax
ADD destination, source
Meaning
destination = destination + source

Example:

MOV AX, 0005H
MOV BX, 0003H
ADD AX, BX

Result:

AX = 0008H
BX = 0003H
3. SUB
Syntax
SUB destination, source
Meaning
destination = destination - source

Example:

MOV AL, NUM1
SUB AL, NUM2

If:

NUM1 = 7
NUM2 = 4

then:

AL = 3
4. INC
Syntax
INC register

Adds 1.

INC AX

Means:

AX = AX + 1
5. DEC
Syntax
DEC register

Subtracts 1.

DEC AX

Means:

AX = AX - 1
6. MUL
Syntax
MUL register/memory

For the byte form used in Lab 01:

MOV AL, NUM1
MUL NUM2

Conceptually:

AL × NUM2 → AX

Example:

AL = 4
NUM2 = 3

4 × 3 = 12

AX = 000CH

Important:

MUL has an implicit accumulator operand.

7. INT 21H
Syntax
INT 21H

Calls a DOS service.

The service is selected using AH.

Common Lab 01 Functions
AH = 02H — Display Character
MOV AH, 02H
MOV DL, 'A'
INT 21H
AH = 09H — Display String
MOV AH, 09H
LEA DX, MSG
INT 21H
AH = 4CH — Terminate
MOV AH, 4CH
INT 21H
8. LEA
Syntax
LEA DX, MSG

LEA = Load Effective Address.

Loads the address of MSG into DX.

Used with string output:

MOV AH, 09H
LEA DX, MSG
INT 21H
Instruction Summary
Instruction	Purpose
MOV	Copy data
ADD	Addition
SUB	Subtraction
INC	+1
DEC	-1
MUL	Unsigned multiplication
LEA	Load address
INT 21H	DOS service
Common Patterns
Addition
MOV AL, NUM1
ADD AL, NUM2
Subtraction
MOV AL, NUM1
SUB AL, NUM2
Swap
MOV CX, AX
MOV AX, BX
MOV BX, CX
Character Output
MOV AH, 02H
MOV DL, 'A'
INT 21H
String Output
MOV AH, 09H
LEA DX, MSG
INT 21H
Termination
MOV AH, 4CH
INT 21H