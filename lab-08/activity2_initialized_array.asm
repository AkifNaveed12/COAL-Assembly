
section .data
    array dd 5, 10, 15, 20, 25
    msg db "Array elements are:", 10
    msg_len equ $ - msg
    newline db 10

    LEN equ 5

section .bss
    input_char resb 1

section .text
    global _start

_start:
    ; Print message
    mov eax, 1
    mov edi, 1
    mov rsi, msg
    mov edx, msg_len
    syscall

    ; Initialize index
    xor r12d, r12d

print_loop:
    cmp r12d, LEN
    jge exit_program

    ; Load current array element
    mov eax, [array + r12*4]

    ; Print integer
    call print_int

    ; Print newline
    mov eax, 1
    mov edi, 1
    mov rsi, newline
    mov edx, 1
    syscall

    ; Move to next element
    inc r12d
    jmp print_loop

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

    ; Handle zero
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
