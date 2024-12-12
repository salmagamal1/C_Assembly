//
// Created by Aya Ehab Ramadan on 12/12/2024.
//
#include <stdio.h>

int main(){
  int arr[10] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
  int counter = 0;

  for (int i = 0 ;i<10;i++){
    if (arr[i] % 2 == 0){
      counter++;
    }
  }
  printf(" Count of even numbers is: %d",counter);
}
