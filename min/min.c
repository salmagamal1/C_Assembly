/*
 * Problem 1
 * Yomna Maged Ali 20221196
 */

#include <stdio.h>

int main() {
    int nums[10] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int min = nums[0];

    for (int i = 1; i < 10; i++) {
        if (nums[i] < min) {
            min = nums[i];
        }
    }

    printf("Min element is: %d\n", min);
}
