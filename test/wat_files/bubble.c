#include <stdio.h>

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

int main() {
    int arr[] = {69, 34, 25, 12, 86, 61, 79, 41, 53, 90
                ,60, 35, 26, 13, 87, 62, 70, 42, 54, 91
                ,61, 36, 27, 14, 88, 63, 71, 43, 55, 92
                ,62, 37, 28, 15, 89, 64, 72, 44, 56, 93
                ,63, 38, 29, 16, 80, 65, 73, 45, 57, 94
                ,64, 39, 20, 17, 81, 66, 74, 46, 58, 95
                ,65, 30, 21, 18, 82, 67, 75, 47, 59, 96
                ,66, 31, 22, 19, 83, 68, 76, 48, 50, 97
                ,67, 32, 23, 10, 84, 69, 77, 49, 51, 98
                ,68, 33, 24, 11, 85, 60, 78, 40, 52, 99
    }; // 待排序数组
    int n = sizeof(arr) / sizeof(arr[0]); // 计算数组长度

    printf("排序前的数组: \n");
    printArray(arr, n);

    bubbleSort(arr, n); // 调用冒泡排序函数

    printf("排序后的数组: \n");
    printArray(arr, n);

    return 0;
}