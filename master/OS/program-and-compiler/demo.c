#include <unistd.h>
#include <stdio.h>
#define REGES_FOREACH(_) _(X) _(Y)
#define RUN_LOGIC X1 = !X && Y;\
                  Y1 = !X && !Y;
#define DEFINE(X) static int X, X##1;
#define UPDATE(X) X = X##1;
#define PRINT(X)  printf(#X " = %d; ", X);


int main() {
  REGES_FOREACH(DEFINE);
  while (1) {
    RUN_LOGIC;
    REGES_FOREACH(PRINT);
    REGES_FOREACH(UPDATE);
    putchar('\n');
    sleep(1);
  }
}
