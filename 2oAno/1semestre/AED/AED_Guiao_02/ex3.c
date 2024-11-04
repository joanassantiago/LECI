#include <stdio.h>

void Permute(int* a, int* b, int* c){
    int temp = *a;
    *a = *b;
    *b = *c;
    *c = temp;
}

int main(){
    int a = 5, b = 10, c = 15;
    printf("Antes: a = %d, b = %d, c = %d", a, b, c);
    Permute(&a, &b, &c);
    printf("Depois: a = %d, b = %d, c = %d", a, b, c);
    return 0;
}
    
