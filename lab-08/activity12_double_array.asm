
section .data
    msg db "Enter 10 non-negative integers:", 10
    msg_len equ $ - msg
    result_msg db "Array after doubling:", 10
    result_len equ $ - result_msg
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
    jge double_array

    call read_int
    mov [array + r12*4], eax
    inc r12d
    jmp input_loop

double_array:
    xor r12d, r12d

double_loop:
    cmp r12d, 10
    jge show_array

    mov eax, [array + r12*4]
    shl eax, 1
    mov [array + r12*4], eax

    inc r12d
    jmp double_loop

show_array:
    mov eax, 1
    mov edi, 1
    mov rsi, result_msg
    mov edx, result_len
    syscall

    xor r12d, r12d

print_loop:
    cmp r12d, 10
    jge exit_program

    mov eax, [array + r12*4]
    call print_int
    call print_newline

    inc r12d
    jmp print_loop

exit_program:
    mov eax, 60
    xor edi, edi
    syscall

; Read one non-negative integer
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

; Print non-negative integer in EAX
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
