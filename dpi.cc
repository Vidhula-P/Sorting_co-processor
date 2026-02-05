// C handles Merge Sort
#include "stdio.h"
#include "stdlib.h"

// Declare the SV functions
extern "C" void call_sv_from_c();

extern "C" int sv_sort(int *arr);

void call_sv_from_c() {
  int arr [4] = {6,2,4,5};
  
  sv_sort(arr);
  printf("C got sorted array: ");
  for (int i = 0; i < 4; i++)
    printf("%d ", arr[i]);
  
  printf("\n");
}
