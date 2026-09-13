
---

# `06_flags.md`

```md
# 8086 FLAGS

## What are FLAGS?

FLAGS are status bits in the CPU that record information about the result of operations.

Important flags introduced in Lab 01:

```text
ZF — Zero Flag
CF — Carry Flag
SF — Sign Flag
OF — Overflow Flag

The emulator's Registers panel shows the FLAGS.

Why FLAGS Matter

Arithmetic instructions can change FLAGS.

Example:

MOV AL, 05H
SUB AL, 05H

Result:

AL = 00H

The processor records information about this result in FLAGS.

Zero Flag — ZF

Indicates whether the result is zero.

Concept:

Result = 0
   ↓
ZF becomes set

Example:

MOV AL, 05H
SUB AL, 05H

Result:

AL = 00H
ZF = 1
Carry Flag — CF

Used to indicate a carry/borrow condition in unsigned arithmetic.

Example concept:

Unsigned subtraction produces a borrow
        ↓
CF changes
Sign Flag — SF

Indicates the sign-related state of the result.

It reflects the most significant bit of the result.

Concept:

MSB = 0 → positive/non-negative representation
MSB = 1 → negative representation
Overflow Flag — OF

Indicates signed arithmetic overflow.

Important distinction:

CF → unsigned arithmetic
OF → signed arithmetic
FLAGS and Arithmetic

Instructions such as:

ADD
SUB

can modify FLAGS.

MOV is primarily used for data movement and does not perform arithmetic.

How to Study FLAGS in emu8086

Use:

Emulate
   ↓
Single Step
   ↓
Execute arithmetic instruction
   ↓
Observe FLAGS

Example:

MOV AL, 05H
SUB AL, 05H

After subtraction observe:

AL = 00H
ZF
CF
SF
OF
Important Rule

Do not only look at the final register value.

For every arithmetic instruction, think:

Operand values
      ↓
Operation
      ↓
Result
      ↓
FLAGS updated

Example:

MOV AX, 0005H
MOV BX, 0003H
ADD AX, BX

Result:

AX = 0008H

Then inspect the FLAGS panel in emu8086.

Lab 01 FLAGS Checklist

When using Single Step:

Watch AX/BX/CX/DX
Watch AH/AL when relevant
Watch FLAGS after ADD/SUB
Notice which instruction caused the change
Don't assume every instruction changes FLAGS
Key Flags to Remember
Flag	Meaning
ZF	Zero result
CF	Carry / unsigned borrow
SF	Sign of result
OF	Signed overflow

These notes cover the manual's Lab 01 objectives, register table, program structure, frequently used instructions, DOS services, memory/data examples, and the FLAGS concepts introduced in the document. :contentReference[oaicite:1]{index=1} :contentReference[oaicite:2]{index=2}
