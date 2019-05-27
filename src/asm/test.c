#include <sys.h>

  static int
fmt_int(register char *s, register int u)
{
  register unsigned int len;
  register int q;

  len = 1;
  q = u;
  while (q > 9) {
    ++len;
    q /= 10;
  }
  if (s) {
    s += len;
    do {
      *--s = '0' + (u % 10);
      u /= 10;
    } while(u); /* handles u == 0 */
  }
  return len;
}

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
main(int argc, const char **argv, const char **envp)
{
  char s[100];
  int i;
  int l;

  l = fmt_int(s, argc);
  write(1, "argc = ", 7);
  write(1, s, l);
  write(1, "\n", 1);
  for (i = 0; i < argc; ++i) {
    l = fmt_int(s, i);
    write(1, "argv[", 5);
    write(1, s, l);
    write(1, "] = '", 5);
    write(1, argv[i], str_len(argv[i]));
    write(1, "'\n", 2);
  }
  for (i = 0; envp[i]; ++i) {
    l = fmt_int(s, i);
    write(1, "envp[", 5);
    write(1, s, l);
    write(1, "] = '", 5);
    write(1, envp[i], str_len(envp[i]));
    write(1, "'\n", 2);
  }
  return 0;
}
