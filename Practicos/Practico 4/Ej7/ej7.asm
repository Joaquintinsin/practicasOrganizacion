; 7. Construya un programa assembler que calcule de manera iterativa el factorial de un número dado.

%include "asm_io.inc"
segment .data
    resultado dw 1

segment .bss
    nroDado resb 1

segment .text
global asm_main:
asm_main:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    call read_int
    mov [nroDado], eax
ceroOne:	; eax contiene el valor dado por consola
    cmp eax, 0
    je end
    cmp eax, 1
    je end
    
    mov eax, 2
    while:
	cmp eax, [nroDado]
	jg end
	mov ebx, [resultado]
	imul ebx, eax
	mov [resultado], ebx
	inc eax
	jmp while
end:
    mov eax, [resultado]
    call print_int
    call print_nl
    ret

