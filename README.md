# practicasOrganizacion
Mi repositorio para la materia Organización del Procesador
Universidad Nacional de Río Cuarto
Año 2023

# Quid novi
Varios archivos de C y assembler pedidos en las prácticas.

# Compilación
Se compila usando NASM y gcc

Para cada ejercicio, se lleva la librería principal: asm_io.asm y asm_io.inc
Para compilarla -> nasm -f elf -d ELF_TYPE asm_io.asm (Linux)
Para otros sistemas operativos, leer el comentario en .asm y elegir el flag correspondiente

Una vez compilada la libreria, compilar los ejercicios como sigue:
nasm -f elf nombreEjecicio.asm
gcc -o nombreEjercicioOut driver.c nombreEjercicio.o asm_io.o

Ejecutar mediante
./nombreEjercicioOut

# Script

#!/bin/bash

file=$1 # primer argumento pasado por consola

#compilando la libreria principal
nasm -f elf -d ELF_TYPE asm_io.asm
#accedo a lo que tiene $file y lo compilo
nasm -f elf $file.asm
#compilar final
gcc -o $file driver.c asm_io.o $file.o

#para dar permisos de ejecucion chmod +x nombreScript.sh
#para correr el script ./nombreScript.sh nombreArchivo
