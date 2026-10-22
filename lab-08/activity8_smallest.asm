
section .data
    LEN equ 10
    msg db "Enter 10 non-negative integers:", 10
    msg_len equ $ - msg
    result_msg db "Smallest number = "
    result_len equ $ - result_msg
    newline db 10

section .bss
    array resd LEN
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
    cmp r12d, LEN
    jge find_smallest
    call read_int
    mov [array + r12*4], eax
    inc r12d
    jmp input_loop

find_smallest:
    ; Assume first element is smallest
    mov r14d, [array]
    mov r12d, 1

compare_loop:
    cmp r12d, LEN
    jge show_result

    mov eax, [array + r12*4]
    cmp eax, r14d
    jae next_element
    mov r14d, eax

next_element:
    inc r12d
    jmp compare_loop

show_result:
    mov eax, 1
    mov edi, 1
    mov rsi, result_msg
    mov edx, result_len
    syscall

    mov eax, r14d
    call print_int
    call print_newline

    mov eax, 60
    xor edi, edi
    syscall

read_int:
    xor r8d, r8d

.read_char:
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

    sub eax, '0'
    imul r8d, r8d, 10
    add r8d, eax
    jmp .read_char

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
