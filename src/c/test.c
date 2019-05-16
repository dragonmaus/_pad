#include "path.h"
#include "print.h"
#include "str.h"

#define SIZE 4096

  int
main(int argc, char **argv)
{
  char path[SIZE];
  int len;

  len = str_copy(path, *++argv);
  print_ln(path);
  len = path_canonical(len, path, SIZE);
  print_ln(path);
}
