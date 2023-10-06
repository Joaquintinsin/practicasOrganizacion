; 5. Escriba un programa en assembler que utilice tres arreglos definidos en el segmento
; de datos, pero cada uno con un tamaño diferente de elementos (byte, word, dword).
; Realice un programa en assembler que muestre los elementos de los tres arreglos.
; Nota: revise el capítulo 5 del libro de Paul A. Carter para conocer en detalle el
; tratamiento de arreglos en NASM.

; tres ciclos diferentes para mostrar elementos del primer arreglo, otro ciclo para el segundo arreglo y otro para el tercero

%include "asm_io.inc"

segment .data
    byte_Arr db 11,22,33
    word_Arr dw 4,5,6
    dword_Arr dd 77,88,99
    ; se guardan de manera contigua, uno al lado del otro

segment .text
global asm_main:
asm_main:
    xor eax, eax

; Inicio arreglo de byte
    mov eax, 0
mientras1:
    cmp eax, 2		; zf = 1 sii eax-3=0 . en este caso zf = 0
    jg fmientras1	; salta a fmientras si zf = 1
    ; call print_int
    ; call print_nl
    
    mov ebx, eax
    mov al, [byte_Arr + ebx]
    
    call print_int
    call print_nl
    mov eax, ebx
    
    inc eax		; eax++
    jmp mientras1	; salta a mientras

fmientras1:
    xor eax, eax
; Fin arreglo de byte

    call print_nl

; Inicio arreglo de word
    mov eax, 0
mientras2:
    cmp eax, 2		; zf = 1 sii eax-3=0 . en este caso zf = 0
    jg fmientras2	; salta a fmientras si zf = 1
    ; call print_int
    ; call print_nl
    
    mov ebx, eax
    mov al, [word_Arr + ebx*2]
    
    call print_int
    call print_nl
    mov eax, ebx
    
    inc eax		; eax++
    jmp mientras2	; salta a mientras

fmientras2:
    xor eax, eax
; Fin arreglo de word

    call print_nl

; Inicio arreglo de dword
    mov eax, 0
mientras3:
    cmp eax, 2		; zf = 1 sii eax-3=0 . en este caso zf = 0
    jg fmientras3	; salta a fmientras si zf = 1
    ; call print_int
    ; call print_nl
    
    mov ebx, eax
    mov al, [dword_Arr + ebx*4]
    
    call print_int
    call print_nl
    mov eax, ebx
    
    inc eax		; eax++
    jmp mientras3	; salta a mientras

fmientras3:
    xor eax, eax
; Fin arreglo de word

    ret
