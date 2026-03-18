#ifndef LIBPIM_H
#define LIBPIM_H

#include <stdint.h>

// PIM 가속기 초기화
void pim_init();

// 행렬 곱셈 가속 (Tiling 로직 포함)
void pim_gemm(uint64_t M, uint64_t N, uint64_t K, float* A, float* B, float* C);

#endif