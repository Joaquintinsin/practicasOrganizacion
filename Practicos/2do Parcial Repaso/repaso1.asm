;~ Construya una subrutina SWAP en lenguaje assembly NASM que determine dados dos valores
;~ de 32 bits pasados como parámetro, intercambie sus valores. Para ello la subrutina
;~ debe utilizar un espacio temporal (variable local a la subrutina).

%include "asm_io.inc"

segment .data
    msg db "Ingrese un nro: ", 0
    msg1 db "Valor numero 1: ", 0
    msg2 db "Valor numero 2: ", 0
segment .bss
    nro1 resd 1
    nro2 resd 1
segment .text
global asm_main:
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    call CargarNumeros
    mov [nro1], ebx
    mov [nro2], eax
    
    mov eax, msg1
    call print_string
    mov eax, [nro1]
    call print_int
    call print_nl
    
    mov eax, msg2
    call print_string
    mov eax, [nro2]
    call print_int
    call print_nl
    
    mov ebx, [nro1]
    mov eax, [nro2]
    
    push ebx
    push eax
    call SwapNumeros
    pop ebx
    pop eax
    
    mov [nro1], ebx
    mov [nro2], eax
    
    mov eax, msg1
    call print_string
    mov eax, [nro1]
    call print_int
    call print_nl
    
    mov eax, msg2
    call print_string
    mov eax, [nro2]
    call print_int
    call print_nl
    
    ret

CargarNumeros:
    push ebp
    mov ebp, esp
    
    mov eax, msg
    call print_string
    call read_int
    mov ebx, eax	; Carga el primer numero en ebx
    mov eax, msg
    call print_string
    call read_int	; Carga el segundo numero en eax
    
    pop ebp
    ret

SwapNumeros:
    push ebp
    mov ebp, esp
    sub esp, 4		; Reservo espacio para 1 variable local
    
    mov ecx, [nro1]	; Guardar en la variable local el valor del primer parámetro (aux=nro1)
    mov [ebp - 4], ecx	; Guardar en la variable local el valor del primer parámetro (aux=nro1)
    mov ecx, [nro2]	; Poner el valor del segundo parámetro adentro del primer parámetro (nro1=nro2)
    mov [nro1], ecx	; Poner el valor del segundo parámetro adentro del primer parámetro (nro1=nro2)
    mov ecx, [ebp - 4]	; Rescatar el valor de la variable local (primer parámetro original) (nro2=aux)
    mov [nro2], ecx	; Poner el valor del primer parámetro original en el segundo parámetro (nro2=aux)
    
    add esp, 4
    pop ebp
    ret
    
    
    
    
