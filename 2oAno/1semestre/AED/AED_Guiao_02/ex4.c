#include <stdio.h>
#include <stdlib.h>

void DisplayArray(double* a, size_t n){
    printf("[");
    if(a != NULL && n > 0){
        for(size_t i = 0; i < n; i++){
            printf("%f", a[i]);
            if(i < n - 1){
                printf(",");
            }
        }
        printf("]\n");
    }else{
        return;
    }
}

double* ReadArray(size_t size_p){
    double* a = malloc(size_p * sizeof(double));
    if(size_p != NULL){
        for()
    }
}