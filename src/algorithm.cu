#include <stdio.h>
#include <iostream>
#include <cuda_runtime.h>

__global__ void
hello()
{
    int i = blockDim.x * blockDim.y *blockDim.z;

    printf("hello~\n");
}
int test_cuda(void)
{

    hello<<<1,3>>>();

    cudaDeviceSynchronize();
    
    printf("done~\n");
    return 0;
}