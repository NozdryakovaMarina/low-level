%include "io64.inc"
%include "io64.inc" 
section .rodata:
       x: dd  -7.3 
    
section .bss
       result: resd 1
    
section .text
    global main

set_rounding_down:
    sub rsp, 8    
    fstcw [rsp]       
    and al, [rsp + 1]
    and al, 0xF3
    or al, 4
    mov [rsp + 1], al   
    fldcw [rsp]   
    add rsp, 8     
    ret
    
main:
    fld dword[x]
    fist dword[result]
    mov eax, [result]
    PRINT_DEC 4, eax
    NEWLINE
    call set_rounding_down
    fist dword[result]
    mov eax, [result]
    PRINT_DEC 4, eax
    xor eax, eax
    ret
