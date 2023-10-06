; 6. Defina cómo se puede determinar si un número es par utilizando operadores a nivel
; de bits. Luego, construya un programa assembler que dado un arreglo de 10 enteros
; de 16 bits (words), definido en el segmento .data, sume los números pares y
; muestre el resultado por pantalla.

%include "asm_io.inc"

segment .data
    word_Arr dw 0,1,2,3,4,5,6,7,8,9
    
segment .text
global asm_main:
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    mov eax, 0
mientras:
    cmp eax, 9	; ZF = (eax-9 == 0)? 1 : 0
    jg fmientras

fmientras:
    
    
    ret
