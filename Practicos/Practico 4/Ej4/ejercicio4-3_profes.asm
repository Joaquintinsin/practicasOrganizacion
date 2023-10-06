%include "asm_io.inc"

section .text
global asm_main
asm_main:
    mov ebp, esp
    
    ;EAX = 0
    ;while ( EAX <= 5 )
        ;EAX++   
    ;done
    
    mov eax, 0
while:
    cmp eax, 5 
    jg done ; mayor salta
    add eax, 1  
    jmp while
    
done:
    PRINT_DEC 4, eax
    
    xor eax, eax
    ret
