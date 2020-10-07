#include <sys/errno.h>
#include <stdio.h>

int main()
{
    int *lol = __error();
    *lol = 2;
}