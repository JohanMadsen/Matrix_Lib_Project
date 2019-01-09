
#include "matmult.h"
#include "cblas.h"
#define MIN(x, y) (((x) < (y)) ? (x) : (y))
void matmult_mnk(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            for (l = 0; l < k; ++l) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}


void matmult_nmk(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (j = 0; j < n; ++j) {
        for (i = 0; i < m; ++i) {
            for (l = 0; l < k; ++l) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_kmn(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (l = 0; l < k; ++l) {
        for (i = 0; i < m; ++i) {
            for (j = 0; j < n; ++j) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_knm(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (l = 0; l < k; ++l) {
        for (j = 0; j < n; ++j) {
            for (i = 0; i < m; ++i) {

                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_nkm(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (j = 0; j < n; ++j) {
        for (l = 0; l < k; ++l) {
            for (i = 0; i < m; ++i) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_mkn(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (i = 0; i < m; ++i) {
        for (l = 0; l < k; ++l) {
            for (j = 0; j < n; ++j) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_nat(int m, int n, int k, double **A, double **B, double **C) {
    int i1, i, j, l;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (i = 0; i < m; ++i) {
        for (j = 0; j < n; ++j) {
            for (l = 0; l < k; ++l) {
                C[i][j] += A[i][l] * B[l][j];
            }
        }
    }
}

void matmult_lib(int m, int n, int k, double **A, double **B, double **C) {
    int i1;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, m, n, k, 1, A[0], k, B[0], n, 0, C[0], n);
}

void matmult_blk(int m, int n, int k, double **A, double **B, double **C, int bs) {
    int i1, i, j, l,j1;
    for (i1 = 0; i1 < m * n; ++i1) {
        (*C)[i1] = 0;
    }
    for (j1 = 0; j1 <m; j1+=bs) {
        for (i = 0; i < m; ++i) {
            for (l = 0; l < k; ++l) {
                for (j = 0; j <MIN(m-j1,bs) ; ++j) {
                    C[i][j1+j] += A[i][l] * B[l][j+j1];
                }
            }
        }
    }
}