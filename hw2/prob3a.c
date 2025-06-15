#include <stdlib.h>
#include <stdio.h>

char* strrchr_example (char *dst, char character) {
    int i = 0;
    char *last_occurrence = NULL;  // Initialize pointer to NULL

    while (dst[i] != '\0') { 
        if (dst[i] == character) {  // Use '==' for comparison
            last_occurrence = &dst[i];  // Assign address, not value
        }
        i++; 
    } 

    return last_occurrence;   
}

int main() {
    char str[] = "hello world";
    char ch = 'o';
    
    char *result = strrchr_example(str, ch);

    if (result != NULL) {
        printf("Last occurrence of '%c' is at index: %ld\n", ch, result - str);
    } else {
        printf("Character '%c' not found in the string.\n", ch);
    }

    return 0;
}
