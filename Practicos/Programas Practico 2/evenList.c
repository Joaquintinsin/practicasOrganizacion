#include <stdio.h>
#include <stdlib.h>

#define N 127

int  main() {

	for (char x = 0; x <= N; x++) {
		if( x % 2  == 0)
			printf("x = %d \n", x);
	}

	return 0;    
}

/*
 * Con un tipo int en vez de char establecemos el rango de representacion normal y solucionamos
 * el ciclo infinito, tiene que ver con usar el codigo ascii
 * Llega hasta el -128
 */
