#include <stdio.h>
#include <math.h>

int main(){
    int linhas;

    printf("Quantas linhas a tabela vai ter? ");
    scanf("%d", &linhas);

    printf("%6s | %9s | %s \n", "Numero", "Quadrados", "Raizes Quadradas");
    for( int i = 1; i <= linhas; i++){
        printf("%6d | %9d | %f\n", i, i*i, sqrt(i));
    }
    return 0;
}
