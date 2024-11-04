#include <stdio.h>

int chamadas1 = 0;
int chamadas2 = 0;
int chamadas3 = 0;

unsigned int f1(int n){
    if(n == 1){
        return 1;
    }else if (n > 1){
        chamadas1++;
        return f1(n/2) + n;
    }
    return 0;
}

unsigned int f2(int n){
    if(n == 1){
        return 1;
    }else if (n > 1){
        chamadas2 = chamadas2 +2;
        return (f2(n/2) + f2((n+1)/2) + n); 
    }
    return 0;
}

unsigned int f3(int n){
    if(n == 1){
        return 1;
    }else if (n%2 == 0){
        chamadas3++;
        return (2 * f3(n/2) + n);
    }else{
        chamadas3 = chamadas3 + 2;
        return (f3(n/2) + f3((n+1)/2) + n);
        
    }
    return 0;
}

int main(void){
    printf("N\t  f1(N)\t  Chamadas f1\t  f2(N)\t  Chamadas f2\t  f3(N)\t  Chamadas f3\n");
    printf("--------------------------------------------------------------------------\n");

    for(int n = 1; n <= 65; n++){
        chamadas1 = 0;
        chamadas2 = 0;
        chamadas3 = 0;

        int resultado1 = f1(n);
        int resultado2 = f2(n);
        int resultado3 = f3(n);
        
        printf("%d\t%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d\n", n, resultado1,chamadas1,resultado2,chamadas2,resultado3,chamadas3);
    }
}