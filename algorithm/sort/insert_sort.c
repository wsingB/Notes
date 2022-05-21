#include "./common.h"

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
            copy_void_data (vec + j *type_size, vec + (j + 1) * type_size, type_size);
            j = j - 1;
        }
        copy_void_data(vec + (j + 1) * type_size, key);
    }
}
