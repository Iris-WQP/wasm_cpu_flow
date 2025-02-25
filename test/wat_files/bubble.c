#include <stdio.h>
#include <stdlib.h>


// 冒泡排序函数
void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) { // 外层循环控制排序轮数
        for (int j = 0; j < n - i - 1; j++) { // 内层循环控制每轮比较次数
            if (arr[j] > arr[j + 1]) { // 如果前一个元素大于后一个元素，交换它们
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

// 打印数组函数
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// give vector length, generate a random vector
void generateVector(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 100;
    }
}

int main() {
    //initialize array
    int arr[10];
    generateVector(arr, 10);
    
    int n = sizeof(arr) / sizeof(arr[0]); // 计算数组长度

    printf("排序前的数组: \n");
    printArray(arr, n);

    bubbleSort(arr, n); // 调用冒泡排序函数

    printf("排序后的数组: \n");
    printArray(arr, n);

    return 0;
}