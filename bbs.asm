%include "io64.inc"

section .rodata
   p:     dd 259
   q:     dd 563
   n:     dd 100
   msg:   db "Generated numbers: ", 10, 0  

section .bss
   m:  resd 4
   
section .text 
   global main

main:
   GET_UDEC 4, r8d
   PRINT_STRING msg 
    
   mov eax, [p]
   mul dword [q]
   mov [m], eax 
    
   xor r10d, r10d
.cycle_start: 
   cmp r10d, [n]
   jnl .cycle_end
     
   mov eax, r8d
   mov edx, r8d
   mul eax
   
   mov r9d, eax

   mov eax, r9d
   xor edx, edx
   mov ebx, [m]
   div ebx
   mov r8d, edx
        
   mov eax, r8d
   and eax, 0xFF  
    
   PRINT_UDEC 4, eax
   NEWLINE
   
   inc r10d
   jmp .cycle_start

.cycle_end:   
   ret