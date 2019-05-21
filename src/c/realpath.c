#include <unistd.h>
#include "hack.h"
#include "path.h"
#include "print.h"
#include "str.h"

#define SIZE 4096

  int
main(int argc, const char **argv)
{
  char path[SIZE];
  int len;

  hack_fixio();

  if (argc > 1) {
    while (*++argv) {
      str_copy(path, *argv);
      if (path_canonical(path, SIZE) == -1) _exit(1);
      print_ln(path);
    }
  } else {
    str_copy(path, ".");
    if (path_canonical(path, SIZE) == -1) _exit(1);
    print_ln(path);
  }

  _exit(0);
}
