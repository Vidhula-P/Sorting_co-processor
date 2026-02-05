// C handles Radix Sort
#include "stdio.h"
#include "stdlib.h"

// Declare the SV functions
extern "C" void call_sv_from_c();

extern "C" int count_sort(int *arr, int exp);

void call_sv_from_c() {
  int arr [20] = {120,110,949,584,9,0,92,80,49,0,3,48,106,77,385,76,444,73,28,100};
  
  count_sort(arr, 1);
  printf("C got sorted array: ");
  for (int i = 0; i < 20; i++)
    printf("%d ", arr[i]);
  
  printf("\n");
}