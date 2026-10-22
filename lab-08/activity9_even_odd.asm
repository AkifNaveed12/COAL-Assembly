
section .data
    msg db "Enter 10 non-negative integers:", 10
    msg_len equ $ - msg
    even_msg db "Even count = "
    even_len equ $ - even_msg
    odd_msg db 10, "Odd count = "
    odd_len equ $ - odd_msg
    newline db 10

section .bss
    array resd 10
    input_byte resb 1

section .text
    global _start

_start:
    mov eax, 1
    mov edi, 1
    mov rsi, msg
    mov edx, msg_len
    syscall

    xor r12d, r12d

input_loop:
    cmp r12d, 10
    jge count_numbers

    call read_int
    mov [array + r12*4], eax
    inc r12d
    jmp input_loop

count_numbers:
    xor r14d, r14d
    xor r15d, r15d
    xor r12d, r12d

count_loop:
    cmp r12d, 10
    jge show_counts

    mov eax, [array + r12*4]
    test eax, 1
    jnz count_odd

    inc r14d
    jmp next_number

count_odd:
    inc r15d

next_number:
    inc r12d
    jmp count_loop

show_counts:
    mov eax, 1
    mov edi, 1
    mov rsi, even_msg
    mov edx, even_len
    syscall

    mov eax, r14d
    call print_int
    call print_newline

    mov eax, 1
    mov edi, 1
    mov rsi, odd_msg
    mov edx, odd_len
    syscall

    mov eax, r15d
    call print_int
    call print_newline

    mov eax, 60
    xor edi, edi
    syscall

read_int:
    xor r8d, r8d

.skip:
    xor eax, eax
    xor edi, edi
    mov rsi, input_byte
    mov edx, 1
    syscall
    test eax, eax
    jz .done

    movzx eax, byte [input_byte]
    cmp al, ' '
    je .skip
    cmp al, 10
    je .skip
    cmp al, 13
    je .skip
    cmp al, '0'
    jb .done
    cmp al, '9'
    ja .done

.digits:
    sub eax, '0'
    imul r8d, r8d, 10
    add r8d, eax

.next_digit:
    xor eax, eax
    xor edi, edi
    mov rsi, input_byte
    mov edx, 1
    syscall
    test eax, eax
    jz .done

    movzx eax, byte [input_byte]
    cmp al, '0'
    jb .done
    cmp al, '9'
    ja .done
    jmp .digits

.done:
    mov eax, r8d
    ret

print_int:
    push rbx
    push r13
    mov ebx, eax
    xor r13d, r13d
    test ebx, ebx
    jnz .convert

    mov byte [input_byte], '0'
    mov eax, 1
    mov edi, 1
    mov rsi, input_byte
    mov edx, 1
    syscall
    jmp .finished

.convert:
    mov eax, ebx
    xor edx, edx
    mov ecx, 10
    div ecx
    push rdx
    inc r13d
    mov ebx, eax
    test ebx, ebx
    jnz .convert

.print_digits:
    pop rax
    add al, '0'
    mov [input_byte], al
    mov eax, 1
    mov edi, 1
    mov rsi, input_byte
    mov edx, 1
    syscall
    dec r13d
    jnz .print_digits

.finished:
    pop r13
    pop rbx
    ret

print_newline:
    mov eax, 1
    mov edi, 1
    mov rsi, newline
    mov edx, 1
    syscall
    ret
