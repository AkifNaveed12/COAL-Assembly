Sections
Section	Purpose
.MODEL SMALL	Uses the small memory model
.STACK 100H	Reserves stack memory
.DATA	Variables/data
.CODE	Executable instructions
MAIN PROC	Start of main procedure
MAIN ENDP	End of main procedure
END MAIN	Program entry/end
Important Rules
1. Instructions generally follow:
INSTRUCTION destination, source

Example:

MOV AX, BX

Means:

AX = BX
2. Source is not changed by MOV
MOV BX, AX

copies AX into BX.

AX keeps its original value.

3. Hexadecimal values

Hex numbers normally end with H:

MOV AX, 0005H
MOV BX, 000AH
Data Declaration
DB — Define Byte
NUM1 DB 3
NUM2 DB 4

Stores one-byte values.

Example:

MOV AL, NUM1

Loads NUM1 into AL.

Data Segment Initialization

When accessing .DATA variables:

MOV AX, @DATA
MOV DS, AX

Purpose:

.DATA
   ↓
DS points to Data Segment
   ↓
Program can access variables

This pair appears near the beginning of programs that use .DATA.

Basic Execution Flow
Program starts
     ↓
Initialize DS if data is used
     ↓
Execute instructions
     ↓
Perform calculations / I/O
     ↓
Terminate
Program Termination
MOV AH, 4CH
INT 21H

AH = 4CH selects the DOS terminate-program function.

emu8086 Workflow
Write .ASM code.
Save with .asm extension.
Click Emulate.
Fix assembler errors if any.
Use Single Step to execute one instruction at a time.
Observe registers and FLAGS.
Use Run to execute the whole program.
Lab 01 Core Topics
Assembly language
8086 registers
.MODEL
.STACK
.DATA
.CODE
DB
MOV
ADD
SUB
MUL
INT 21H
ASCII
FLAGS
Used to point to data in memory.

Pointer Registers
SP — Stack Pointer
BP — Base Pointer

Used for stack management.

Segment Registers
CS — Code Segment
DS — Data Segment
SS — Stack Segment
ES — Extra Segment

Hold starting addresses of memory segments.

FLAGS

Status register containing flags such as:

ZF — Zero Flag
CF — Carry Flag
SF — Sign Flag
OF — Overflow Flag
16-bit and 8-bit Registers

AX, BX, CX and DX are 16-bit registers.

Each can be accessed as two 8-bit registers.

AX = AH + AL

BX = BH + BL

CX = CH + CL

DX = DH + DL

Example:

MOV AX, 1234H

Results conceptually in:

AH = 12H
AL = 34H
AX = 1234H
Register Diagram
AX
┌────────┬────────┐
│   AH   │   AL   │
│ 8-bit  │ 8-bit  │
└────────┴────────┘

BX
┌────────┬────────┐
│   BH   │   BL   │
└────────┴────────┘

CX
┌────────┬────────┐
│   CH   │   CL   │
└────────┴────────┘

DX
┌────────┬────────┐
│   DH   │   DL   │
└────────┴────────┘
Important Register Rules
MOV Between Registers
MOV BX, AX

Means:

BX = AX

AX remains unchanged.

8-bit vs 16-bit

Valid:

MOV AX, BX
MOV AL, BL
MOV AH, 05H

Do not mix different sizes:

MOV AX, BL    ; invalid
MOV AL, BX    ; invalid
Important Registers for INT 21H

Character output:

MOV AH, 02H
MOV DL, 'A'
INT 21H
AH = function number
DL = character to display

String output:

MOV AH, 09H
LEA DX, MSG
INT 21H
AH = function number
DX = address of string

Program termination:

MOV AH, 4CH
INT 21H
Register Thinking

For every instruction ask:

Which register is being read?
Which register is being changed?
Is it 8-bit or 16-bit?
What is the value before?
What is the value after?

Example:

MOV AX, 0005H
MOV BX, 0003H
ADD AX, BX

Result:

AX = 0008H
BX = 0003H