#!/bin/bash

file=$1
nasm -f elf -d ELF_TYPE asm_io.asm
nasm -f elf $file.asm
gcc -m32  -o $file driver.c asm_io.o $file.o 
