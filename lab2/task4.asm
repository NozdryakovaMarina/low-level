; y ≥ lg^2 (sin⁡(x)+a)
; x sin * a + log 2 ^
%include "io64.inc"

section .rodata
   a: dd 7.0
   x: dd 0.5
   y: dd 0.5
   
section .data
   result: dd 0.0

section .text
   global main
   
main:
   fld dword [x] 
   fsin 
   fld dword [a]
   fadd  
   fld1
   fxch st0, st1
   fyl2x
   fldl2t
   fdiv 
   fmul st0, st0
   fstp dword[result]
   
   fld dword [y]
   fld dword[result]
   fcomip 
   jnb false
   PRINT_DEC 4, 1
   jmp end
false:
    PRINT_DEC 4, 0

end: 
   ret	
