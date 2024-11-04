#include <stdio.h>

void printArray(char name[], int array[], int array_size){
    printf("%s:\n", name);
    for(int i = 0; i < array_size; i++){
        printf("%d |", array[i]);
    }
    printf("\n");
}

void cumSum(int a[], int b[], int arrayA_size){
    int c = 0;
    for(int i = 0; i < arrayA_size; i++){
        c += a[i];
        b[i] = c;
    }
}

int main(){
    int a[] = {31,28,31,30,31,30,31,31,30,31,30,31};
    printArray("a", a, sizeof(a)/sizeof(*a));


    int b[12];
    cumSum(a, b, sizeof(a)/sizeof(*a));
    printArray("b", b, sizeof(b)/sizeof(*b));

    return 0;
}   