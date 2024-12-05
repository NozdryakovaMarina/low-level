%include "io64.inc"
section .text

extern access3

global main

main: 
    
    sub rsp, 32+8
    
    mov dword [rsp + 8], 127
    lea rcx, [rsp + 8]
    mov dword[rdx], 10
    mov dword[rdx + 8], 10 
    
    call access3
    
    add rsp, 32+8
    
    ret