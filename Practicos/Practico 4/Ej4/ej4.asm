; 4. Revise la sección 2.2 del Libro “Lenguaje Ensamblador para PC” de Paul A. Carter.
; Determine cómo simularía los esquemas de las estructuras de control en assembler.
; Escriba de ejemplos en NASM

%include "asm_io.inc"

segment .data
    L1 db 5
    L2 db 5
    L3 db 4

segment .text
global asm_main
asm_main:
    xor eax, eax
    xor ebx, ebx
    
    mov eax, [L1]
    mov ebx, [L2]
    mov ecx, [L3]
    
    cmp eax, ebx	; eax == ebx? true
    ; Zero flag is set (ZF == 1) Carry flag is unset (CF == 0)
    jz thenBlockOne	; JZ branches only if ZF is set
    mov eax, ebx	; else
    jmp endifOne
    
thenBlockOne:
    mov eax, 1
endifOne:
    cmp ebx, ecx	; ebx == ecx? false
    ; Zero flag is unset (ZF == 0) Carry flag is set (CF == 1)
    jc thenBlockTwo	; JC branches only if CF is set
    mov ebx, 0		; else
    jmp endifTwo

thenBlockTwo:
    mov ebx, ecx
endifTwo:
    inc eax
    inc ebx
    
    ret
