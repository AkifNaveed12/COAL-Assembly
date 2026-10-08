section .data
    Num db '5', 10

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, Num
    mov edx, 2
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h