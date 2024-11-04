#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAX_LEN 1024

int main(void){
    char string_1[MAX_LEN+1];
    char string_2[MAX_LEN+1];
    int counter;
    int n;
    int diff;

    printf("1st string: ");
    fgets(string_1, sizeof(string_1), stdin);

    n = strlen(string_1);
    if(string_1[n - 1] == '\n') string_1[n - 1] = 0;

    printf("2st string: ");
    fgets(string_2, sizeof(string_2), stdin);

    n = strlen(string_2);
    if(string_2[n - 1] == '\n') string_2[n - 1] = 0;

    counter = 0;

    for (int i = 0; string_1[i] != 0; i++){
        if (isalpha(string_1[i])) counter++;
    }
    printf("%s has %d alphabetical characters\n", string_1, counter);

    counter = 0;

    for (int i = 0; string_2[i] != 0; i++){
        if (isupper(string_2[i])) counter++;
    }
    printf("%s has %d capital characters\n", string_2, counter);

    for(int i = 0; string_1[i] != 0; i++){
        string_1[i] = tolower(string_1[i]);
    }

    for(int i = 0; string_2[i] != 0; i++){
        string_2[i] = tolower(string_2[i]);
    }

    printf("Lower-case 1st string: %s\n", string_1);
    printf("Lower-case 2nd string: %s\n", string_2);

    diff = strcmp( string_1, string_2);

    if (diff == 0){
        puts("strings are equal\n");
    }
    else if (diff < 0){
        puts(string_1);
        puts(string_2);
    }
    else{
        puts(string_2);
        puts(string_1);
    }

    return 0;
}