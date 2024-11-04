#include <stdio.h>

int main(void){
    double array[] = {1,2,4,8,16,32,64,128,256,512};
    double r = array[1] / array[0];
    size_t len = sizeof(array) / sizeof(array[0]);
    int valid;
    int cost;
    int prev;

    valid = 1;
    cost = 1;

    for(int i = 2; i < len; i++){
        cost++;
        if(array[i] != r * array[i - 1]){
            valid = 0;
            break;
        }
    }

    if(valid){
        printf("Valid sequence cost = %d\n", cost);
    }else{
        printf("Non-valid sequence cost = %d\n", cost);
    }

    valid = 1;
    cost = 1;

    for(int i = 2; i < len; i++){
        cost ++;
        prev *= r;
        if(array[i] != prev){
            valid = 0;
            break;
        }
    }

    return 0;
}