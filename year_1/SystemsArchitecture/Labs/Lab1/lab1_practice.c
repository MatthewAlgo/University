#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

void print4BytesFromMemory(void* memoryLocation, size_t size){ // Prints chunks of size int 
    int* pointerToMem = (int*)memoryLocation;
    for(int i = 0; i < size; ++i){
        for(int j = 0; j<32; ++j){
            int bit_at_position_i_in_pointer = (*pointerToMem >> (31-j)) & 0x01;
            printf("%i", bit_at_position_i_in_pointer);
        }
        pointerToMem++; // Goes to the next int
        printf("\n");
    }
}

void checkCharRepetability(char c){ // The internal representation of a char -> overflows that actually have a logic
    for(int i = 0; i<256; ++i){
        printf("%i ", c);
        c++;
    }
    printf("%i ", c);
    printf("\n");
} // Personal thought: "Data about the number's number of repetitions is lost in the overflow" 

int main(){
    int vector[] = {81723412, -2048};
    print4BytesFromMemory(&vector, 2);
    printf("\nBits right shifted\n");

    vector[0] <<= 5;
    print4BytesFromMemory(&vector, 2);
    printf("%i\n", vector[0]);

    vector[0] = ~vector[0] + 1;
    print4BytesFromMemory(&vector, 2);
    printf("%i\n", vector[0]);

    checkCharRepetability(40);
}