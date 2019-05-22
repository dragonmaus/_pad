#include "byte.h"

  unsigned int
byte_findr(const char *s, register unsigned int n, register char c)
{
  register const char *t;
  register const char *u;

  t = s;
  u = 0;
  for (;;) {
    if (!n) break; if (*t == c) u = t; ++t; --n;
    if (!n) break; if (*t == c) u = t; ++t; --n;
    if (!n) break; if (*t == c) u = t; ++t; --n;
    if (!n) break; if (*t == c) u = t; ++t; --n;
  }
  if (!u) u = t;
  return u - s;
}
