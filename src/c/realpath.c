#include "path.h"
#include "print.h"
#include "str.h"
#include "unix.h"

#define SIZE 4096

#ifdef WIN32
/* CreateFileW chokes if given too few backslashes, but does not care if given too many */
  unsigned int
fix_str_copy(char *to, const char *from)
{
  int n = 0;

  for (;;) {
    if (!*from) return n; if (*from == '\\') { *to++ = *from; ++n; }; *to++ = *from++; ++n;
    if (!*from) return n; if (*from == '\\') { *to++ = *from; ++n; }; *to++ = *from++; ++n;
    if (!*from) return n; if (*from == '\\') { *to++ = *from; ++n; }; *to++ = *from++; ++n;
    if (!*from) return n; if (*from == '\\') { *to++ = *from; ++n; }; *to++ = *from++; ++n;
  }
}
#else
#define fix_str_copy(x, y) str_copy(x, y)
#endif

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
      len = path_canonicalize(len, path, SIZE);
      if (len < 0) _exit(1);

      print_ln(path);
    }
  } else {
    len = str_copy(path, ".");
    len = path_canonicalize(len, path, SIZE);
    if (len < 0) _exit(1);

    print_ln(path);
  }

  _exit(0);
}
