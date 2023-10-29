%include "asm_io.inc"

segment .data
    numPar dw 8
    numImpar dw 9
    msgPar db 'El núm. es par', 0
    msgImpar db 'El núm. es impar', 0

segment .text
global asm_main
extern print_string
asm_main:

    mov ebp, esp; for correct debugging
    
    mov ebx, ebx; Reg. que será usado para ir guardando los resultados.
    mov eax, eax; Reg. que será usado para definir si el num es par o impar. 
    
    mov edx, numPar
    
ceroOne:
    cmp edx, 0
    je par
    cmp edx, 1
    je impar
    jmp parOimpar
    
parOimpar:
    mov bx, [edx]
    sub bx, 2
    mov [edx], bx
    cmp bx, 1   
    jg parOimpar
    jmp end
end:
    
    cmp bx, 0
    je par
    jne impar

par:
    mov eax, 0
    mov eax, msgPar
    call print_string ; PRINT_STRING msgPar
    jmp typeEnd
    
impar:    
    mov eax, 1
    mov eax, msgImpar
    call print_string ; PRINT_STRING msgImpar
    jmp typeEnd
    
typeEnd:
    
    ret
