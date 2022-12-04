#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct MoneyGram {
    int mastermoneyamount;
    char* investment;
};

int main(){
    struct MoneyGram* as = (struct MoneyGram*) malloc(sizeof(struct MoneyGram));
    as->investment = (char*) malloc(sizeof(char) * 100);
    strcpy(as->investment, "Hello from investment\0");

    FILE* fisier = fopen("master.txt", "wb");
    fwrite(as, sizeof(struct MoneyGram), 1, fisier);
    fclose(fisier);

}