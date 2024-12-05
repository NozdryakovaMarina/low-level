section .rodata 
    msg:     db "Generated numbers: ", 10, 0  
    fmt:     db "%d", 0
    fmt_out: db "%d", 10, 0 
    
section .text 
    extern scanf
    extern printf
    extern puts 
    global main

main: 
    push rbp
    mov rbp, rsp
    sub rsp, 24+8
    
    lea rcx, [fmt]
    lea rdx, [rbp+20]
    call scanf
    
    lea rcx, [msg]
    call puts
    
    mov esi, [rbp+20]
    
    mov eax, 259
    mov edx, 563
    mul edx
    mov ebx, eax
    
    xor edi, edi
.cycle_start:
    cmp edi, 100
    jge .cycle_end
    
    mov eax, esi
    mul eax 
    
    xor edx, edx
    div ebx
    mov eax, edx 
    
    mov esi, eax
    
    and eax, 0xFF 
    
    mov dword [rbp+20], eax 
    lea rcx, [fmt_out]
    mov rdx, [rbp+20]
    call printf
    
    inc edi
    jmp .cycle_start
    
.cycle_end:
    leave 
    ret
