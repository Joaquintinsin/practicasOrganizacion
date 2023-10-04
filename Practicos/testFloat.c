#include <stdio.h>
#include <stdint.h>
#include <limits.h> /* for CHAR_BIT */

/** formatted output of ieee-754 representation of float */
void show_ieee754 (float f)
{
    union {
        float f;
        uint32_t u;
    } fu = { .f = f };

    int i = sizeof f * CHAR_BIT;

    
    printf("valor de sizeof %lu", sizeof f);
    printf("valor de i %d",i);


    printf ("  ");
    while (i--)    
        printf ("%d ", (fu.u >> i) & 0x1);
    
    putchar ('\n');
    printf (" |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|\n");
    printf (" |s|      exp      |                  mantissa"
            "                   |\n\n");
}

int main (void) {

    float f = 1.5;

    printf ("\nIEEE-754 Single-Precision representation of: %f\n\n", f);
    show_ieee754 (f);

    return 0;
}