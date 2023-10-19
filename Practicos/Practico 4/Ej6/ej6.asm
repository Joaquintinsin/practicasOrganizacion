; 6. Defina cómo se puede determinar si un número es par utilizando operadores a nivel
; de bits. Luego, construya un programa assembler que dado un arreglo de 10 enteros
; de 16 bits (words), definido en el segmento .data, sume los números pares y
; muestre el resultado por pantalla.

%include "asm_io.inc"

segment .data
    word_Arr dw 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    
segment .text
global asm_main:
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
mientras:
    cmp ebx, 9		; ZF = (ebx-9 == 0)? 1 : 0
    jg fmientras 	; Jump fmientras <--> ZF = 1
    mov al, [word_Arr + ebx*2]
    jp esPar
    jmp esImpar
esPar:
    add cl, al
    inc ebx
    jmp mientras
esImpar:
    inc ebx
    jmp mientras
fmientras:
    mov al, cl
    call print_int
    call print_nl
    ret
