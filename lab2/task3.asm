; log_2 (tg(x+a))=b
; x = arctg(2^b)-a
; 2 b ^ arctg a - 
section .rodata
    a:  dd 5.0
    b:  dd 3.0 

section .bss
    x: resd 1

section .text 
global main

main:
    fld dword [b] 
    fld1
    fscale  
    fld1
    fpatan
    fld dword [a]
    fsub
    fstp dword [x]     
    
    xor rax, rax 
    ret