# name of prog cuda, boiler similar to c

#include <stdio.h>
#include <stdlib.h>

#include "../common/book.h"

#define TPB 512
#define N

//be sure to include -arch sm_11 for atomics

// kernel func
__global__ kernel(void){

}

int main(){
  //declar vars
  dim3 gridDim(1,1);
  dim3 blockDim(16,16);

  // allocate some memory

  //init memory

  //exec kernel
  kernel<<<gridDim, blockDim>>>(void);

  //copy mem

  //free mem
  
  return 0;
}
