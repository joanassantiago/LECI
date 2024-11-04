#include <stdio.h>

unsigned long del_rec(unsigned long m, unsigned long n, unsigned long * count) {
    if (m == 0 || n == 1) return 1;

    *count += 2;
    return del_rec(m - 1, n, count) + del_rec(m - 1, n - 1, count) + del_rec(m, n - 1, count);
}

unsigned long del_iter(unsigned long m, unsigned long n, unsigned long * count) { // Removed stray semicolon
    unsigned long d[m + 1][n + 1]; // Changed n - 1 to n + 1

    for (unsigned long i = 0; i <= m; i++) {
        d[i][0] = 1;
    }

    for (unsigned long i = 0; i <= n; i++) {
        d[0][i] = 1;
    }

    for (unsigned long i = 1; i <= m; i++) {
        for (unsigned long j = 1; j <= n; j++) {
            d[i][j] = d[i - 1][j] + d[i - 1][j - 1] + d[i][j - 1];
        }
    }

    *count = 2*m*n;

    return d[m][n];
}

#define K_MAX 10000
unsigned long del_mem[K_MAX + 1][K_MAX + 1] = {0};

unsigned long del_rec_mem(unsigned long m, unsigned n){
    if(m == 0 || n == 0) return 1;

    if(del_mem[m - 1][n] == 0){
        del_mem[m - 1][n] = del_rec_mem(m - 1, n);
    }

    
    if(del_mem[m - 1][n - 1] == 0){
        del_mem[m - 1][n - 1] = del_rec_mem(m - 1, n - 1);
    }

    
    if(del_mem[m][n - 1] == 0){
        del_mem[m][n - 1] = del_rec_mem(m, n - 1);
    }

    return del_mem[m - 1][n] + del_mem[m - 1][n - 1] + del_mem[m][n - 1];
}

int main(int argc, char *argv[]) {
    unsigned long k;

    if (argc < 2) return 1;
    if (sscanf(argv[1], "%lu", &k) != 1) return 2;
    if(k > K_MAX) return 3;

    //printf("Delanney(%lu, %lu) = %lu\n", k, k, del_rec(k, k));
    //Uncomment the following line if you want to test the iterative version
    // printf("Delanney_iter(%lu, %lu) = %lu\n", k, k, del_iter(k, k));
    printf("Delanney rec mem(%lu, %lu) = %lu\n", k, k, del_rec_mem(k, k));


    return 0;
}