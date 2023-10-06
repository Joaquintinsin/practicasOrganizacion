#!/bin/bash

file=$1 #primer argumento pasado por consola

# accedo a lo que tiene $file y lo compilo
nasm -f elf $file.asm
# compilar final
gcc -o $file driver.c asm_io.o $file.o

# para dar permisos de ejecucion chmod +x nombreScript.sh
# para correr el script ./nombreScript.sh nombreArchivo
