#ifndef DEBUG_H
#define DEBUG_H

extern int write(int, const char *, unsigned int);

  static unsigned int
debug_fmt_uint(register char *s, register unsigned int u)
{
  register unsigned int len;
  register unsigned int q;

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
    } while (u); /* handles u == 0 */
  }
  return len;
}

  static unsigned int
debug_fmt_int(register char *s, register int i)
{
  unsigned int len;

  len = 0;
  if (i < 0) {
    s[len] = '-';
    s[++len] = 0;
    i = -i;
  }
  len += debug_fmt_uint(s + len, i);
  return len;
}

  static unsigned int
debug_str_len(const char *s)
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

  static unsigned int
debug_write(int fd, const char *s)
{
  return write(fd, s, debug_str_len(s));
}

  static unsigned int
debug(const char *name, const char *s, unsigned int n)
{
  unsigned int len;
  char x[1000];

  len = 0;
  len += debug_write(1, "  ");
  len += debug_write(1, name);
  len += debug_write(1, " (");
  x[debug_fmt_uint(x, n)] = 0;
  len += debug_write(1, x);
  len += debug_write(1, ") = '");
  len += debug_write(1, s);
  len += debug_write(1, "'\n");
  return len;
}

  static unsigned int
debugnum(const char *name, long long int n)
{
  char len;
  char x[1000];

  len = 0;
  len += debug_write(1, "  ");
  len += debug_write(1, name);
  len += debug_write(1, " = ");
  x[debug_fmt_int(x, n)] = 0;
  len += debug_write(1, x);
  len += debug_write(1, "\n");
  return len;
}

#endif
