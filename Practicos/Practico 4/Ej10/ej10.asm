; 10. Realice una subrutina en assembler que calcule el mayor de dos números enteros.
; Utilice la misma para calcular el mayor valor de un arreglo de 10 elementos
; declarado en el segmento .data.

%include "asm_io.inc"

segment .data
    msg db "Ingrese un numero entero: ", 0
    arreglo db 0,100,2,3,4,5,6,7,8,9

segment .bss
    nro1 resb 1
    nro2 resb 1
    resMax resb 1
    
segment .text
global asm_main:
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    call EntradasDosNumeros
    
    ;~ push resMax
    ;~ push nro1
    ;~ push nro2
    call Max
    
    mov eax, [resMax]
    call print_int
    call print_nl
    
    ret
    
EntradasDosNumeros:
    ; Subrutina que guarda en dos variables (decladas en .bss los valores pedidos por consola)
    push ebp
    mov ebp, esp
    sub esp, 4	; En caso que vaya a usar variables locales, en este caso no las uso
    
    mov eax, msg
    call print_string
    call read_int
    mov [nro1], eax
    
    mov eax, msg
    call print_string
    call read_int
    mov [nro2], eax
    
    add esp, 4	; En caso que reservé variables locales, devuelvo los espacios de memoria reservados
    pop ebp
    ret
; Fin EntradasDosNumeros

Max:
    ; Subrutina que devuelve el mayor de dos números
    mov al, [nro1]
    mov bl, [nro2]
    cmp al, bl		; comparo el primer parametro con el segundo parametro
    jg PrimeroMayorQueSegundo	; reviso el flag de mayor estricto, si se cumple salto al label indicado
    mov [resMax], bl
    ret
PrimeroMayorQueSegundo:
    mov [resMax], al
    ret
; Fin Max
