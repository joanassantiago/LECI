#include <stdio.h>

int main(void){
    int array[] = {0,2,2,0,3,3,0,4,4,0};
    size_t len = sizeof(array)/sizeof(array[0]);
    unsigned int counter;
    unsigned int comparisons;

    counter = 0;
    comparisons = 0;

    for(int i = 1; i < len - 1; i++){
        comparisons++;
        if(array[i] == array[i - 1] + array[i+ 1]){
            counter++;
        }
    }

    printf("Counter = %u, comparissons = %u\n", counter, comparisons);

    int prev, prev_prev;

    prev = array[1];
    prev_prev = array [0];
    counter = 0;
    comparisons = 0;

    for(int i = 2; i < len; i++){
        comparisons++;
        int sub = prev - prev_prev;

        prev_prev = prev;
        prev  = array[i];

        if(prev == sub){
            counter++;
        }
    }

    printf("Counter = %u, comparissons = %u\n", counter, comparisons);
    
    return 0;
}