#include "display.h"
#include <time.h>
#define RATIO 10

typedef struct pos {
    short x;
    short y;
} pos;

pos head = { 50, 50 };
pos* body = 0;
unsigned short length = 2;
clock_t last_move;
pos direction = { 0, 1 };
pos apples[5];

pos random_apple() {
    pos temp;
    temp.x = rand() % 100;
    temp.y = rand() % 100;
    return temp;
}

bool draw(display* window, void* data, const char key) {
    colour(window, 0x000000ff);
    block(window, 0, 0, 100 * RATIO, 100 * RATIO);
    colour(window, 0xffffffff);
    block(window, head.x * RATIO, head.y * RATIO, RATIO, RATIO);
    colour(window, 0xffff00ff);
    for (unsigned short body_index = 0; body_index != length; body_index++) {
        block(window, body[body_index].x * RATIO, body[body_index].y * RATIO, RATIO, RATIO);
    }
    colour(window, 0xff0000ff);
    for (unsigned short apple_index = 0; apple_index != 5; apple_index++) {
        block(window, apples[apple_index].x * RATIO, apples[apple_index].y * RATIO, RATIO, RATIO);
    }
    show(window);
    switch (key) {
    case SDLK_w:
        direction.x = 0;
        direction.y = -1;
        break;
    case SDLK_s:
        direction.x = 0;
        direction.y = 1;
        break;
    case SDLK_a:
        direction.x = -1;
        direction.y = 0;
        break;
    case SDLK_d:
        direction.x = 1;
        direction.y = 0;
        break;
    }
    clock_t current_time = clock();
    if (current_time != last_move) {
        last_move = current_time;
        pos new_head = { head.x + direction.x, head.y + direction.y };
        if (new_head.x < 0) {
            new_head.x += 100;
        }
        new_head.x %= 100;
        if (new_head.y < 0) {
            new_head.y += 100;
        }
        new_head.y %= 100;
        for (unsigned short apple_index = 0; apple_index != 5; apple_index++) {
            if (apples[apple_index].x == new_head.x && apples[apple_index].y == new_head.y) {
                length++;
                body = realloc(body, length * sizeof(pos));
                memmove(body + 1, body, (length - 1) * sizeof(pos));
                body[0] = head;
                head = new_head;
                apples[apple_index] = random_apple();
                return false;
            }
        }
        memmove(body + 1, body, length * sizeof(pos));
        body[0] = head;
        head = new_head;
    }
    return false;
}

int main(int argc, char* args[]) {
    srand(time(0));
    body = (pos*)malloc(2 * sizeof(pos));
    body[0].x = body[1].x = 50;
    body[0].y = 49;
    body[1].y = 48;
    last_move = clock();
    for (unsigned short apple_index = 0; apple_index != 5; apple_index++) {
        apples[apple_index] = random_apple();
    }
    display* window1 = newDisplay("dududamowang", 100 * RATIO, 100 * RATIO);
    run(window1, 0, draw);
    freeDisplay(window1);
}