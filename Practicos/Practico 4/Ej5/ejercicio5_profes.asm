%include "asm_io.inc"

segment .data
    byte_array db 1, 2, 6, 4, 5, 6, 7, 8, 9, 10 ; cada uno de 1 bytes (8bits)
    word_array dw 11, 12, 16, 14, 15, 16, 17, 18, 19, 110 ; cada uno de 1 palabras (2 bytes- 16bits)
    dword_array dd 111, 112, 116, 114, 115, 116, 117, 118, 119, 1110 ; cada uno de 1 palabras dobles (4 bytes- 32 bits)		
    
segment .bss
    result resb 1
    result_w resw 1
    
segment .text
global CMAIN
CMAIN:
    mov ebp, esp	; for correct debugging
    
    ;Pseudocódigo
    ;EDX = direccion de la base del arreglo
    ;EAX =0 -contador
    ;while ( EAX < 10 )
	;mostrar [dl]
	;EDX = EDX + sizeofElementos
	;EAX++   
    ;end
    
    mov eax, 0      
    
    mov edx, byte_array

while_loop:
    cmp  eax, 10	; eax es el indice del ciclo
    jge  end_while	; salto por eax >=10 
    
    mov bl, [edx]
    mov [result], bl
    
    PRINT_DEC 1, [result]
    
    NEWLINE
    
    inc edx
    inc eax
    
    jmp while_loop
    
end_while:
    ;EDX = direccion de la base del arreglo
    ;EAX =0
    ;while ( EAX < 10 )
	;mostrar [dx]
	;EDX = EDX + sizeofElementos
	;EAX++
    ;end
    
    mov edx, word_array
    mov eax, 0
    
while_loop_2:
    cmp eax, 10
    jge end_while_2	; salto por eax >=10 
    
    mov bx, [edx]
    mov [result_w], bx
    
    PRINT_DEC 2, [result_w]
    
    NEWLINE
    
    add edx, 2
    inc eax
    
    jmp while_loop_2
    
end_while_2:
    ;EDX = direccion de la base del arreglo
    ;EAX =0
    ;while ( EAX < 10 )
	;mostrar [edx]
	;EDX = EDX + sizeofElementos
	;EAX++   
    ;end
    
    mov edx, dword_array
    mov eax, 0
    
while_loop_3:
    cmp eax, 10
    jge end_while_3	; salto por eax >=10 
    
    PRINT_DEC 4, [edx]
    
    NEWLINE
    
    add edx, 4
    inc eax
    
    jmp  while_loop_3
    
end_while_3:
    mov eax, 0		; return back to C
    
    ret
