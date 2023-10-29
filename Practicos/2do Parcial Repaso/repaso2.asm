;~ Suponga implementada la subrutina SWAP descripta en el ej 1 y realice un programa que, 
;~ dados 2 arreglos A y B de 10 valores de 32 bits cada uno (debe definirlos), 
;~ intercambie sus valores utilizando SWAP

%include "asm_io.inc"

segment .data
    A dd 0,1,2,3,4,5,6,7,8,9
    B dd 9,8,7,6,5,4,3,2,1,0

segment .text
global asm_main:
extern print_ebx
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    mov ecx, 9
IntercambiarArreglos:
    mov eax, [A + 4*ecx]
    mov ebx, [B + 4*ecx]
    pusha
    call SwapNumeros
    popa
    
    call print_int
    call print_ebx
    call print_nl
    
    loop IntercambiarArreglos
    ret

SwapNumeros:
    push ebp
    mov ebp, esp
    sub esp, 4		; Reservo espacio para 1 variable local
    
    mov ecx, [ebp + 8]	; Guardar en la variable local el valor del primer parámetro (aux=nro1)
    mov [ebp - 4], ecx	; Guardar en la variable local el valor del primer parámetro (aux=nro1)
    mov ecx, [ebp + 12]	; Poner el valor del segundo parámetro adentro del primer parámetro (nro1=nro2)
    mov [ebp + 8], ecx	; Poner el valor del segundo parámetro adentro del primer parámetro (nro1=nro2)
    mov ecx, [ebp - 4]	; Rescatar el valor de la variable local (primer parámetro original) (nro2=aux)
    mov [ebp + 12], ecx	; Poner el valor del primer parámetro original en el segundo parámetro (nro2=aux)
    
    add esp, 4
    pop ebp
    ret
