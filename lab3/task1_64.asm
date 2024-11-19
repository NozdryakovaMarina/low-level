section .rodata 
    msg:     db "Generated numbers: ", 10, 0  
    fmt:     db "%d", 0
    fmt_out: db "%d", 10, 0

section .bss
    m:  resd 1
   
section .text 
    extern scanf
    extern printf
    extern puts 
    global main

main:   
    push rbp
    mov rbp, rsp
    sub rsp, 32
    
    lea rcx, [fmt]
    lea rdx, [rbp + 28]
    call scanf
    
    lea rcx, [msg]
    call puts
    
    mov esi, [rbp + 28]
    
    mov eax, 259
    mov edx, 563
    mul edx
    mov [m], eax
    
    xor edi, edi
.cycle_start:
    cmp edi, 100
    jge .cycle_end
    
    mov eax, esi
    mul eax 
    
    xor edx, edx
    mov ebx, [m]
    div ebx
    mov eax, edx 
    
    mov esi, eax
    
    and eax, 0xFF
    
    mov dword [rbp + 24], eax 
    lea rcx, [fmt_out]
    mov rdx, [rbp + 24]
    call printf
    
    inc edi
    jmp .cycle_start
    
.cycle_end:
    add rsp, 32
    pop rbp
    ret
