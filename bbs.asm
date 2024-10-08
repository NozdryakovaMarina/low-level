%include "io64.inc"


section .data
   p     dd 259
   q     dd 563
   m     dd 0 
   n     dd 100
   msg   db "Generated numbers: ", 10, 0  

section .text
   extern printf, scanf
   global main

main:
    mov rbp, rsp; for correct debugging 
   GET_UDEC 4, r8d
   PRINT_STRING msg 
    
   mov eax, [p]
   imul eax, [q]
   mov [m], eax 
    
   xor r10d, r10d
.cycle_start: 
   cmp r10d, [n]
   je .cycle_end
     
   mov r9d, r8d
   imul r9d, r9d

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