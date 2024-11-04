#include <stdio.h>

int main(){
    printf("Sizeof(void *).......&d\n", sizeof(void *));
    printf("Sizeof(void).........&d\n", sizeof(void));
    printf("Sizeof(char).........&d\n", sizeof(char));
    printf("Sizeof(short)........&d\n", sizeof(short));
    printf("Sizeof(int)..........&d\n", sizeof(int));
    printf("Sizeof(long).........&d\n", sizeof(long));
    printf("Sizeof(long long)....&d\n", sizeof(long long));
    printf("Sizeof(float)........&d\n", sizeof(float));
    printf("Sizeof(double).......&d\n", sizeof(double));
}