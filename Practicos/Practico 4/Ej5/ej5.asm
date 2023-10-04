; 5. Escriba un programa en assembler que utilice tres arreglos definidos en el segmento
; de datos, pero cada uno con un tamaño diferente de elementos (byte, word, dword).
; Realice un programa en assembler que muestre los elementos de los tres arreglos.
; Nota: revise el capítulo 5 del libro de Paul A. Carter para conocer en detalle el
; tratamiento de arreglos en NASM.

; tres ciclos diferentes para mostrar elementos del primer arreglo, otro ciclo para el segundo arreglo y otro para el tercero

%include "asm_io.inc"

segment .data
    byte_Arr db 1,2,3
    word_Arr dw 4,5,6
    dword_Arr dd 7,8,9
    ; se guardan de manera contigua, uno al lado del otro

segment .text
global asm_main:
asm_main:
    xor eax, eax
    
    mov eax, 0
mientras:
    cmp eax, 3
    jg fmientras
    inc eax
    jmp mientras

done:
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret
