; 9. Retome el ejercicio Nro 6. Utilizando la solución propuesta, construya una biblioteca
; (subrutina global) en assembler para calcular a nivel de bits si un número es par.
; Luego utilice esta biblioteca desde un programa C para determinar si un número es
; par. Nota: Revise el capítulo 4 del libro de Paul A. Carter.

%include "asm_io.inc"

segment .data
    msg1 db "Ingrese un numero: ", 0
    msg2 db "El numero es: ",0

segment .bss
    result resb 1 ; Guarda si es par o impar

segment .text
global asm_main:
extern scanf
asm_main:
    xor ebx, ebx
    xor ecx, ecx
    
    mov eax, msg1
    call print_string
    call print_nl
    xor eax, eax
    call read_int
    
    push eax		; eax pasado como parametro
    call parOImpar
    pop eax
    
    mov eax, msg2
    call print_string
    mov eax, [result]
    call print_int
    call print_nl
    
    ret
    
parOImpar:
    ; Prologo
    push ebp		; guardo el ebp antes de la subrutina
    mov ebp, esp	; esp apunta al ebp viejo, entonces guardo en ebp el ebp viejo, asi poder acceder a variables locales y parametros
    sub esp, 4		; reservamos memoria para una sola variable local
    ; FPrologo
    
    mov bl, [ebp + 8]	; ponemos en la parte baja de ebx el valor pasado como parámetro
    mov [ebp - 4], bl	; ponemos en una variable local el valor pasado como parámetro
    
    ceroUno:	; Instrucciones para ver si la variable local es cero o es uno. Osea par o impar.
	cmp dword [ebp - 4], 0
	je end
	cmp dword [ebp - 4], 1
	je end
	jmp mayorQueUno
    mayorQueUno:	; Instrucciones para ver si la variable local es mayor que uno. Se va restando de a dos hasta caer en 0 o en 1
	mov bl, [ebp - 4]	; Pone en bl el valor de la variable local
	sub bl, 2		; Resta 2
	mov [ebp - 4], bl	; Lo vuelve a la variable local
	cmp bl, 1		; Compara con 1
	jg mayorQueUno		; Si bl > 1 vuelve a ciclar
	jmp end			; Sino, termina

end:
    mov [result], bl
    ; Epilogo
    add esp, 4
    pop ebp
    ret
    ; FEpilogo
    
