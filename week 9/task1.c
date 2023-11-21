#include <stdio.h>

int main(int argc, char* args[]) {
    if (argc == 3) {
        FILE* input = fopen(args[1], "r");
        FILE* output = fopen(args[2], "w");
        while (1) {
            int single_char = getc(input);
            if (feof(input)) {
                break;
            }
            if (single_char >= 'a' && single_char <= 'z') {
                single_char += 'A' - 'a';
            }
            putc(single_char, output);
        }
        fclose(input);
        fclose(output);
    }
    return 0;
}