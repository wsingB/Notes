#include "../common.h"
typedef unsigned long size_t;

/*
 * for insert_sort, it will be devidide into two parts;
 * sorted, unsorted
*/
static void copy_void_data (void *src, void *dst, size_t type_size);

void
insert_sort (void *vec, size_t type_size, size_t n,  int (*compare) (void *, void *))
{
    for (int i = 1; i < n; ++i) {
        void *key = vec + type_size * i;
        int j = i - 1;
        while (j > 0 && compare (vec + (type_size * j), key)) {
            copy_void_data (vec + j * type_size, vec + (j + 1) * type_size, type_size);
            j = j - 1;
        }
        copy_void_data(key, vec + (j + 1) * type_size, type_size);
    }
}

static void
copy_void_data (void *src, void *dst, size_t type_size)
{
    char *p = (char *)(dst);
    for (int i = 0; i < type_size; ++ i) {
        *(p + i) = *(((char *) (src)) + i);
    }
}

#ifdef __TEST__
#include <stdio.h>

int less(void *a, void *b) {
    return *(int*) (a) > *(int *) (b);
}
int main(int argc, char **argv) {
    int vec[] = {1, 2 ,4, 3, 5, 7, 6};
    insert_sort ((void *) (vec), sizeof(int), 7, less);
    for (int i = 0; i < 7; ++i) {
        printf("%4d", vec[i]);
    }
    printf ("\n");
    return 0;
}
#endif
