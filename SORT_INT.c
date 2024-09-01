#include<stdio.h>
#include<stdlib.h>

void swap(int *a, int *b){
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

void quickSort(int *arr, int left, int right){
	if (left >= right) return;
	int pivot = arr[(left + right) / 2];
	int i = left, j = right;
	while (i <= j){
		while (arr[i] < pivot){
			i++;
		}
		while (arr[j] > pivot){
			j--;
		}
		if (i <= j){
			swap(&arr[i], &arr[j]);
			i++;
			j--;
		}
	}
	quickSort(arr, left, j);
	quickSort(arr, i, right);
}

int main(int *argc, const char ** argv){
	int n;
	scanf("%d", &n);
	int *arr = (int *)malloc(n * sizeof(int));
	for (int i = 0; i < n ; i++){
		scanf("%d", &arr[i]);
	}
	quickSort(arr, 0, n - 1);
	for (int i = 0; i < n ; i++){
		printf("%d ", arr[i]);
	}
	return 0;
}
