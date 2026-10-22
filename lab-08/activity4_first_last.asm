
section .data
    LEN equ 10

    msg_input db "Enter 10 integers, one per line:", 10
    len_input equ $ - msg_input

    msg_first db 10, "First element: "
    len_first equ $ - msg_first

    msg_last db 10, "Last element: "
    len_last equ $ - msg_last

    newline db 10

section .bss
    array resd LEN
    input_char resb 1

section .text
    global _start

_start:
    ; Display input message
    mov eax, 1
    mov edi, 1
    mov rsi, msg_input
    mov edx, len_input
    syscall

    ; Read 10 integers
    xor r12d, r12d

input_loop:
    cmp r12d, LEN
    jge display_results

    call read_int
    mov [array + r12*4], eax

    inc r12d
    jmp input_loop

display_results:
    ; Print first element label
    mov eax, 1
    mov edi, 1
    mov rsi, msg_first
    mov edx, len_first
    syscall

    ; Print first element: index 0
    mov eax, [array]
    call print_int
    call print_newline

    ; Print last element label
    mov eax, 1
    mov edi, 1
    mov rsi, msg_last
    mov edx, len_last
    syscall

    ; Print last element: index 9
    mov eax, [array + 9*4]
    call print_int
    call print_newline

    ; Exit
    mov eax, 60
    xor edi, edi
    syscall

; Read a signed integer from STDIN
read_int:
    xor r8d, r8d
    mov r9d, 1

read_next:
    xor eax, eax
    xor edi, edi
    mov rsi, input_char
    mov edx, 1
    syscall

    test eax, eax
    jz read_done

    movzx eax, byte [input_char]

    cmp al, 32
    je read_next
    cmp al, 10
    je read_next
    cmp al, 13
    je read_next

    cmp al, '-'
    jne read_digits

    mov r9d, -1

    ; Read first digit after minus sign
    xor eax, eax
    xor edi, edi
    mov rsi, input_char
    mov edx, 1
    syscall

    test eax, eax
    jz read_done

    movzx eax, byte [input_char]

read_digits:
    cmp al, '0'
    jb read_done
    cmp al, '9'
    ja read_done

    sub al, '0'
    movzx eax, al
    imul r8d, r8d, 10
    add r8d, eax

read_digit_loop:
    xor eax, eax
    xor edi, edi
    mov rsi, input_char
    mov edx, 1
    syscall

    test eax, eax
    jz read_done

    movzx eax, byte [input_char]

    cmp al, '0'
    jb read_done
    cmp al, '9'
    ja read_done

    sub al, '0'
    movzx eax, al
    imul r8d, r8d, 10
    add r8d, eax
    jmp read_digit_loop

read_done:
    mov eax, r8d
    imul eax, r9d
    ret

; Print signed integer in EAX
print_int:
    push rbx
    push r12

    mov ebx, eax

    test ebx, ebx
    jns positive_number

    mov byte [input_char], '-'
    push rbx

    mov eax, 1
    mov edi, 1
    mov rsi, input_char
    mov edx, 1
    syscall

    pop rbx
    neg ebx

positive_number:
    mov eax, ebx
    xor r12d, r12d

    test eax, eax
    jnz convert_digits

    mov byte [input_char], '0'
    mov eax, 1
    mov edi, 1
    mov rsi, input_char
    mov edx, 1
    syscall
    jmp print_done

convert_digits:
    xor edx, edx
    mov ecx, 10
    div ecx

    push rdx
    inc r12d

    test eax, eax
    jnz convert_digits

print_digits:
    pop rax
    add al, '0'
    mov [input_char], al

    push r12

    mov eax, 1
    mov edi, 1
    mov rsi, input_char
    mov edx, 1
    syscall

    pop r12
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
