#include <stdio.h>

#define N 4

int up_to_n[10];

void increment(int * number, int index, int max){
    if(index == max) return;

    number[index]++;
    if (number[index] == 10){
        number[index] = 0;
        increment(number, index + 1, max);
    }
}

long power(long base, long exponent){
    if(exponent == 0) return 1;
    return base * power(base, exponent -1);
}


int main(void){
    //int number[3] = {0 , 0, 1}; //number[2] - hundreds, number[1] - tens, number[0] - units
    int counter = 0;
    int number[N] = {0};
    int min, max;

    number[N - 1] = 1;
    min = powe(10 ,N -1);
    max = power(10, N);

    for(int i = 0; i < 10; i++){
        up_to_n[i] = power(i, N);
    }

    for(unsigned int i = min; i <= max; i++){
        int sum = 0;
        for(int j = 0; j < N; j++){
            sum += up_to_n[number[j]];
        }
        if(sum == i){
            printf("%d is a Armstrong number\n", i);
        }

        increment(number,0,N);
        number[0] = (number[0] + 1) % 10;
        if(number[0] == 0){
            number[1] = (number[1] + 1) % 10;
            if(number[1] == 0) number[2]++;
        }
    }
    return 0;
}