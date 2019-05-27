#include <sys.h>

  static unsigned int
str_len(const char *s)
{
  register const char *t;

  t = s;
  for (;;) {
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
    if (!*t) return t - s; ++t;
  }
}

int
main(int argc, const char **argv, int envc, const char **envp)
{
  write(1, "argv[0] = '", 11);
  write(1, *argv, str_len(*argv));
  write(1, "'\n", 2);
  return 0;
}
