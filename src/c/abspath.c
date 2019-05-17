#include <unistd.h>
#include "path.h"
#include "print.h"
#include "str.h"

#define SIZE 4096

  int
main(int argc, const char **argv)
{
  char path[SIZE];
  int len;

#ifdef WIN32
  setmode(1, 0x8000);
#endif

  if (argc > 1) {
    while (*++argv) {
      str_copy(path, *argv);
      if (path_absolute(path, SIZE) == -1) _exit(1);
      print_ln(path);
    }
  } else {
    str_copy(path, ".");
    if (path_absolute(path, SIZE) == -1) _exit(1);
    print_ln(path);
  }

  _exit(0);
}
