#include <stdio.h>
#include <string.h>
#include <math.h>
#include "armstrong_numbers.h"

bool is_armstrong_number(int candidate) {
    char candidate_string[10];
    int digits_sum = 0;

    sprintf(candidate_string, "%d", candidate);
    int number_of_digits = strlen(candidate_string);

    for (int i = 0; i < number_of_digits; i++) {
        int digit = candidate_string[i] - '0';
        digits_sum += pow(digit, number_of_digits);
    }

    return digits_sum == candidate;
}
