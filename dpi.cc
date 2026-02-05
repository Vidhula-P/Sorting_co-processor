// C handles Radix Sort
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int max_element (int *arr);

// Helper function to return the largest element
int max_element (int *arr) {
  int len = sizeof(arr) / sizeof(arr[0]);
  int res = arr[0];
  for (int i =0; i<len; i++) {
    if (arr[i]>res)
      res = arr[i];
  }
  return (res);
}


extern "C" void call_sv_from_c();

extern "C" int count_sort(int *arr, int exp);

// Declare the SV functions
void call_sv_from_c() {
  int arr [20] = {12660,110,949,584,9,0,92,80,49,78482,78481,3,48,77,385,76,444,73,28,100};
  
  //int limit = max_digits(arr);
  int max = max_element(arr);;
  
  for (int i = 1; max/i!= 0; i=i*10) {
    count_sort(arr, i);
  }
  
  printf("Sorted array from SystemVerilog: ");
  for (int i = 0; i < 20; i++)
    printf("%d ", arr[i]);
  
  printf("\n");
}
