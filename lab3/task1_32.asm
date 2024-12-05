section .rodata
    msg:   db "Generated numbers: ", 10, 0
    fmt:   db "%d", 0
    fmt_out: db "%d", 10, 0

section .text
    extern scanf
    extern printf
    extern puts
    global main

main:
    push esi
    push edi
    push ebp
    mov ebp, esp
    sub esp, 16
    
    lea eax, [fmt]
    mov [esp], eax
    lea eax, [ebp-4]
    mov [esp+4], eax
    call scanf
    
    lea ecx, [msg]
    mov [esp], ecx
    call puts
    
    mov esi, [ebp-4]
    
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
    
    mov dword [ebp-4], eax
    
    push eax
    push fmt_out
    call printf 
    
    inc edi
    jmp .cycle_start
    
    .cycle_end:
    xor eax, eax 
    leave
    pop edi
    pop esi 
    ret
