
section .data
    LEN equ 5

    ; Initialize five elements with 7
    array dd LEN dup(7)

    msg1 db "Array initialized with 7:", 10
    len1 equ $ - msg1

    msg2 db 10, "Array after changing values to 0:", 10
    len2 equ $ - msg2

    newline db 10

section .bss
    input_char resb 1

section .text
    global _start

_start:
    ; Print first message
    mov eax, 1
    mov edi, 1
    mov rsi, msg1
    mov edx, len1
    syscall

    ; Print the initialized array
    mov r12d, 0

print_first:
    cmp r12d, LEN
    jge change_values

    mov eax, [array + r12*4]
    call print_int
    call print_newline

    inc r12d
    jmp print_first

change_values:
    ; Change all elements to zero
    mov r12d, 0

set_zero:
    cmp r12d, LEN
    jge print_second

    mov dword [array + r12*4], 0

    inc r12d
    jmp set_zero

print_second:
    ; Print second message
    mov eax, 1
    mov edi, 1
    mov rsi, msg2
    mov edx, len2
    syscall

    ; Print updated array
    mov r12d, 0

print_updated:
    cmp r12d, LEN
    jge exit_program

    mov eax, [array + r12*4]
    call print_int
    call print_newline

    inc r12d
    jmp print_updated

exit_program:
    mov eax, 60
    xor edi, edi
    syscall

; Print a non-negative integer in EAX
print_int:
    push rbx
    push r12

    mov ebx, eax
    xor r12d, r12d

    test ebx, ebx
    jnz convert_digits

    mov byte [input_char], '0'
    mov eax, 1
    mov edi, 1
    mov rsi, input_char
    mov edx, 1
    syscall
    jmp print_done

convert_digits:
    mov eax, ebx
    xor edx, edx
    mov ecx, 10
    div ecx

    push rdx
    inc r12d
    mov ebx, eax

    test ebx, ebx
    jnz convert_digits

print_digits:
    pop rax
    add al, '0'
    mov [input_char], al

    mov eax, 1
    mov edi, 1
    mov rsi, input_char
    mov edx, 1
    syscall

    dec r12d
    jnz print_digits

print_done:
    pop r12
    pop rbx
    ret

print_newline:
    mov eax, 1
    mov edi, 1
    mov rsi, newline
    mov edx, 1
    syscall
    ret
