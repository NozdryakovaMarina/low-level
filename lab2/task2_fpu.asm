section .rodata
  angle: dd 30.0
  const: dd 180.0
  fact3: dd 6.0
  fact5: dd 120.0
  deg3:  dd 3.0
  deg5: dd  5.0 

section .bss
  sin: resd 1
  rad: resd 1 

section .text 
  global main

main:
   fld dword[angle]
   fldpi
   fmul
   fld dword[const]
   fdiv
   fstp dword[rad]
   
   fld dword[rad]
   fld st0
   fmul st0, st0
   fmul st0, st1 
   fld dword[fact3]
   fdiv 
   fsub st1, st0 
     
   fld dword[rad]
   fld st0
   fmul st0, st0
   fmul st0, st1 
   fmul st0, st1 
   fmul st0, st1 
   fld dword[fact5]
   fdiv
   fxch st1
   fstp st0
   fadd 
   fstp dword[sin]
   
   ret

   