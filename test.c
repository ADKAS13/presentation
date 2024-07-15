#include <stdio.h>
#include <stdlib.h>

void fillArray(int *arr, int size)
{
    for (int i = 0; i < size; i++)
    {
        *(arr + i) = i * 2;
    }
}

void updateArray(int **arr, int old_size, int new_size)
{
    *arr = (int *)realloc(*arr, new_size * sizeof(int));
    for (int i = old_size; i < new_size; i++)
    {
        *(*arr + i) = i * 3;
    }
}

int main()
{
    int size = 5;

    // Dynamically allocate memory for an array of integers
    int *numbers = (int *)malloc(size * sizeof(int));
    if (numbers == NULL)
    {
        printf("Memory allocation failed\n");
        return 1;
    }

    // Fill the array
    fillArray(numbers, size);

    // Update the array to a larger size
    int new_size = 8;
    updateArray(&numbers, size, new_size);

    // Print the array elements
    for (int i = 0; i < new_size; i++)
    {
        printf("%d ", *(numbers + i));
    }

    // Free the allocated memory
    free(numbers);

    return 0;
}