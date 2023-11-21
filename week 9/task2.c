#include <stdio.h>

int main(int argc, char* args[]) {
    if (argc == 2) {
        FILE* input = fopen(args[1], "rb");
        size_t count = 0;
        while (1) {
            char value = getc(input);
            if (feof(input)) {
                break;
            }
            char high = (value & 0b11110000) >> 4;
            putchar((high > 9) ? (high - 10 + 'a') : (high + '0'));
            char low = value & 0b1111;
            putchar((low > 9) ? (low - 10 + 'a') : (low + '0'));
            putchar(' ');
            count += 1;
            if (!(count % 20)) {
                putchar('\n');
            }
        }
        fclose(input);
    }
}