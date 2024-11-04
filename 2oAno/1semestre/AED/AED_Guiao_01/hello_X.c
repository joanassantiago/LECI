#include <stdio.h>
#include <string.h>

#define MAX_NAME 10

int main(void){
    char name[MAX_NAME]; //name w/ MAX_NAme - 1 characaters
    char surname[MAX_NAME];

    printf("Name: ");
    scanf("%s", name);
    //fgets(name, MAX_NAME, stdin);
    printf("Surname: ");
    scanf("%s", surname);
    //fgets(surname, MAX_NAME, stdin);

    printf("Hello %s %s\n", name, surname);
}