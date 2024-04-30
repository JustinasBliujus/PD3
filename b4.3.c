#include <stdio.h>
#include <omp.h>
#include <math.h>

#define DELTA_X 0.0000001
#define DELTA_Y 0.0000003

double function(double x, double y) {
    return 100 * y - x * x * x * x + 1 - x * x;
}

int main() {
    int num_threads = omp_get_max_threads();
    printf("Number of threads: %d\n", num_threads);

    double max_result = -INFINITY;
    double max_x = 0, max_y = 0;

    #pragma omp parallel for collapse(2) shared(max_result, max_x, max_y)
    for (int i = -((2210328 % 39 + 1) / 39); i <= ((2210328 % 39 + 1) / 39); i++) {
        for (int j = -((2210328 % 35 + 1) / 35); j <= ((2210328 % 65 + 1) / 35); j++) {
            double x = i * DELTA_X;
            double y = j * DELTA_Y;
            double result = function(x, y);
            if (result > max_result) {
                #pragma omp critical
                {
                    if (result > max_result) {
                        max_result = result;
                        max_x = x;
                        max_y = y;
                    }
                }
            }
        }
    }

    printf("Maximum value of the function: %f\n", max_result);
    printf("Optimum: x = %f, y = %f\n", max_x, max_y);

    return 0;
}

