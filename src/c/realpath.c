#include "path.h"
#include "print.h"
#include "str.h"
#include "unix.h"

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
      len = str_copy(path, *argv);
      len = path_canonical(len, path, SIZE);
      if (len == -1) _exit(1);

      print_ln(path);
    }
  } else {
    len = str_copy(path, ".");
    len = path_canonical(len, path, SIZE);
    if (len == -1) _exit(1);

    print_ln(path);
  }

  _exit(0);
}
