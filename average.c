/*
 * Problem 3
 * Salma Gamal Kamel 20221073
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
   //use static array
    int arr1[]={1,2,3,4,5,6,7,8,9,10};
    int arr2[]={7,2,5,11,4,6,1,1,8,3};

    float avg1,avg2=0;
    float sum1,sum2=0;
    int i=0;

    //get length
    int len1=sizeof(arr1)/sizeof(arr1[0]);
    int len2=sizeof(arr2)/sizeof(arr2[0]);

    for(i=0;i<len1;i++)
    {
        sum1=sum1+arr1[i];
    }

    for(i=0;i<len2;i++)
    {
        sum2=sum2+arr2[i];
    }

    avg1=sum1/len1;
    avg2=sum2/len2;

    printf("The average is in first array %.1f\n",avg1);
    printf("The average is in second array %.1f\n",avg2);
}

/*If you use dynamic memory allocation*/
// int *arr;
// float avg,sum=0;
// int len=sizeof(arr)/sizeof(arr[0]),i;
// //Get length
// printf("Enter the number of elements for the array: ");
// scanf("%d", &len1);
// arr = (int *)malloc(len*sizeof(int));
// //Input elements for the array
// printf("Enter %d elements for the array:\n", len1);
// for (i = 0; i < len; i++)
//     {
//         scanf("%d", &arr1[i]);
//     }
// // Calculate sum and average
// for (i = 0; i < len; i++) {
//     sum += arr[i];
// }
// avg1 = sum / len;
// printf("The average is: %.2f\n", avg);
// // Free dynamically allocated memory
// free(arr);
