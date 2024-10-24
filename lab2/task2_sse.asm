section .rodata
  angle: dd 30.0
  const: dd 180.0
  pi:    dd 3.141592653589793
  fact3: dd 6.0
  fact5: dd 120.0 

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
    
    movss xmm1, xmm0
    mulss xmm1, xmm1
    mulss xmm1, xmm0 ;xmm1=x^3
    
    movss xmm2, xmm1 
    movss xmm3, dword[fact3]
    divss xmm2, xmm3
    movss xmm3, xmm0
    subss xmm3, xmm2 ;xmm3=x-(x^3)/6
    
    movss xmm4, xmm1
    mulss xmm4, xmm0  
    mulss xmm4, xmm0
    movss xmm5, dword[fact5]
    divss xmm4, xmm5
    addss xmm3, xmm4 ;xmm3 - конечный результат = sin(x)
    
    movss dword[sin], xmm3
    
    xor rax, rax
    ret