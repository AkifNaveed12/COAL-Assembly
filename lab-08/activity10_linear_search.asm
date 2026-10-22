
section .data
    msg db "Enter 10 non-negative integers:", 10
    msg_len equ $ - msg
    search_msg db "Enter number to search:", 10
    search_len equ $ - search_msg
    found_msg db "Found", 10
    found_len equ $ - found_msg
    missing_msg db "Not Found", 10
    missing_len equ $ - missing_msg

section .bss
    array resd 10
    input_byte resb 1
    target resd 1

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
    jge ask_target

    call read_int
    mov [array + r12*4], eax
    inc r12d
    jmp input_loop

ask_target:
    mov eax, 1
    mov edi, 1
    mov rsi, search_msg
    mov edx, search_len
    syscall

    call read_int
    mov [target], eax

    xor r12d, r12d

search_loop:
    cmp r12d, 10
    jge not_found

    mov eax, [array + r12*4]
    cmp eax, [target]
    je found

    inc r12d
    jmp search_loop

found:
    mov eax, 1
    mov edi, 1
    mov rsi, found_msg
    mov edx, found_len
    syscall
    jmp exit_program

not_found:
    mov eax, 1
    mov edi, 1
    mov rsi, missing_msg
    mov edx, missing_len
    syscall

exit_program:
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
