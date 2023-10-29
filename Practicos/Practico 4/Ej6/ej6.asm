; 6. Defina cómo se puede determinar si un número es par utilizando operadores a nivel
; de bits. Luego, construya un programa assembler que dado un arreglo de 10 enteros
; de 16 bits (words), definido en el segmento .data, sume los números pares y
; muestre el resultado por pantalla.

%include "asm_io.inc"

segment .data
    word_Arr dw 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    word_Byte db 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
    res_Suma db 0
segment .text
global asm_main
asm_main:
    xor eax, eax
    xor ebx, ebx
    mov ecx, 10		; Son 10 elementos del arreglo, y utilizo el ecx para que el loop cicle 10 veces
mientras:
    mov al, [word_Arr + 2*ecx]
    cmp al, 2
    jnz esImpar
    add byte [res_Suma], al
esImpar:
    loop mientras

    mov al, [res_Suma]
    call print_int
    call print_nl
    ret
