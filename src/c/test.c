#include <unistd.h>
#include "path.h"
#include "print.h"
#include "str.h"

#define SIZE 4096

  int
main(int argc, char **argv)
{
  char path[SIZE];
  int len;

  if (argc > 1) {
    while (*++argv) {
      len = str_copy(path, *argv);
      print_ln(path);
      len = path_absolute(len, path, SIZE);
      print_ln(path);
    }
  } else {
    len = str_copy(path, ".");
    print_ln(path);
    len = path_absolute(len, path, SIZE);
    print_ln(path);
  }

  _exit(0);
}
