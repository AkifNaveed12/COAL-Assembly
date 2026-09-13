# 8086 Assembly — Basics

## What is Assembly Language?

Assembly is a low-level programming language where instructions closely correspond to CPU machine instructions.

It gives direct control over:
- CPU registers
- Memory
- Processor instructions
- Data movement and arithmetic

Used for:
- Operating systems
- Device drivers
- Embedded systems
- Hardware-level programming
- Reverse engineering

---

## 8086 Program Structure

Basic MASM structure:

```asm
.MODEL SMALL
.STACK 100H

.DATA
    ; variables

.CODE
MAIN PROC

    ; instructions

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

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