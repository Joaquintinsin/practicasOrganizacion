%include "asm_io.inc"

%define Doscientos 200

segment .data
        label db 10010b ; se pone la b de binario, para identificar
        var3 db 34h     ; se pone la h de hexadecimal, para identificar

segment .text
global asm_main
asm_main:
        xor eax, eax
        xor ebx, ebx
        xor ebp, ebp
        xor ecx, ecx
        xor edx, edx
        xor esi, esi
        call sub_dump_regs      ; muestra lo que tienen los registros hasta este punto, como si fuese un printf en c

; Incrementar el valor del registro EAX.
; Actividad 1a
        inc eax
        call sub_dump_regs

; Cargar el registro EBX con el decimal 18 utilizando una etiqueta label binaria.
; Actividad 1b
        mov ebx, label          ; mov ebx, 18
        call sub_dump_regs

; Sumar al registro EAX el valor 200 (expresado en decimal).
; Actividad 1c
        add eax, Doscientos     ; add eax, 200
        call sub_dump_regs

; Cargar el registro AX (parte baja del registro EAX) con el contenido de la celda de memoria cuya dirección está almacenada en el registro EBX
; Actividad 1d
        mov ax, [ebx]
        ;call sub_dump_regs ; tira Instrucción ilegal ('core' generado)

; Multiplicar el valor 52 almacenado en una etiqueta en formato hexadecimal, con el valor cuya dirección de memoria está almacenada en el registro EBX
; Actividad 1e
        imul ebx, var3
        call sub_dump_regs

; Sumar al registro EAX el contenido de la celda de memoria cuya dirección es calculada incrementando el registro EBX en 4 unidades.
; Actividad 1f
        add eax, [ebx+4]

        ret
