section .rodata
    pos_inf dq 0x7FF0000000000000
    neg_inf dq 0xFFF0000000000000
section .text
extern access5
    global main
main:
    sub rsp, 32+8
    
    mov edx, 6312
    mov qword [r8], 0
    mov rax, [pos_inf]
    mov qword [r8 + 8], rax 
  
    pxor xmm0, xmm0 
    
    call access5
    add rsp, 32+8
    ret