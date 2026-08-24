#include "difference_of_squares.h"

unsigned int square_of_sum(unsigned int N){
    unsigned sum;
    sum = (N * (N + 1)) / 2;
    return sum * sum;
}

unsigned int sum_of_squares(unsigned int N) {
    unsigned sum;
    sum = (N * (N + 1) * (2 * N + 1)) / 6;
    return sum;
}

unsigned int difference_of_squares(unsigned int N){
    return square_of_sum(N) - sum_of_squares(N);
}