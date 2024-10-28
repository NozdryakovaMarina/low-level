%include "io64.inc" 
section .rodata
  angle: dd 60.0
  const: dd 180.0
  pi:    dd 3.141592653589793 

section .bss
  sin: resd 1 

section .text 
  global main
main:
    movss xmm0, dword[angle]
    movss xmm1, dword[pi]
    mulss xmm0, xmm1
    movss xmm1, dword[const]
    divss xmm0, xmm1 ;xmm0 = угол в радианах = x
    
    movss xmm7, xmm0  
    
    mov eax, 1
    cvtsi2ss xmm1, eax
    
    mov eax, 2
    cvtsi2ss xmm2, eax
    
    mov eax, -1
    cvtsi2ss xmm3, eax
    
    movss xmm9, xmm0 ; prev
    
    mulss xmm0, xmm0 
    
    mov ecx, 2
    
.start:
    mulss xmm3, xmm0; xmm3 = (-1)x^2
    mulss xmm3, xmm9; xmm3 = (-1)*(x^2)*A_n-1
    
    cvtsi2ss xmm4, ecx
    mulss xmm2, xmm4; xmm2 = 2n
    subss xmm2, xmm1; xmm2 = 2n-1
    divss xmm3, xmm2; xmm3 = (-1)*(x^2)*A_n-1/(2n-1)
    
    subss xmm2, xmm1; xmm2 = 2n-2
    divss xmm3, xmm2; xmm3 = (-1)*(x^2)*A_n-1/((2n-1)*(2n-2)) 
    
    addss xmm7, xmm3
    
    cmp ecx, 4
    je .end
    
    inc ecx
    
    jmp .start
    
.end:   
   ret