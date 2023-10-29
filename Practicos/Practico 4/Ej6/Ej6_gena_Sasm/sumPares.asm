%include "asm_io.inc"

segment .data
    arregW dw 10,11,12,13,14,15,16,17,18,19 ; cada uno de 1 palabras (2 bytes- 16bits)
    auxiliarResta dw 0 ; 
    result dw 0

segment .text
global asm_main
asm_main:
    mov ebp, esp; for correct debugging
    mov ebp, esp; for correct debugging
    
    xor edx, edx ; Acumalador inicializado en 0
    xor ecx, ecx ; Auxiliar para restas de parOimpar inicializado en 0
    mov ebx, 0 ; Inicializo el registro con el índice 0 

while:
    mov eax, arregW ; EAX apunta al inicio del arreglo
    cmp ebx, 10
    jge endWhile	; si ebx >= 10 salta a endWhile
    
    mov cx, [eax + 2 * ebx] ; cx (32 bits) guarda el valor del arreglo en el indice establecido por ebx 
                            ; pasa ser utilizado en las restas que permitiran definir si el núm. es par o impar.
    jmp parOimpar
    
    parOimpar:
        xor eax, eax ; Dejo en 0 a EAX para usarlo como auxiliar en la resta.
        ceroOne:
            mov ax, cx
            cmp ax, 0
            je contWhile
            cmp ax, 1
            je contWhile
            jmp greaterThan1
	    
        greaterThan1:
            mov ax, cx
            sub ax, 2
            mov cx, ax
            cmp ax, 1
            jg greaterThan1	; si ax es mas grande que 1 salto a greater than 1
            jmp contWhile 	; me quede con 1 o 0: ya sabes si es par o impar. sigo
	    
contWhile:
    cmp ax, 0
    je sumar
    jmp desplazamientos
    
    sumar:
	mov eax, arregW 	; Necesito tener a eax apuntando de nuevo al inicio del arreglo
        add dx, [eax + 2 * ebx]
        jmp desplazamientos
    
desplazamientos:
    inc ebx
    jmp while
    
endWhile:
    mov [result], dx
    xor eax, eax
    mov al, [result]
    call print_int
    call print_nl
    
    ret
