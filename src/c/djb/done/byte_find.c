#include "byte.h"

  unsigned int
byte_find(const char *s, register unsigned int n, register char c)
{
  register char *t;

  t = s;
  for (;;) {
    if (!n) break; if (*t == c) break; ++t; --n;
    if (!n) break; if (*t == c) break; ++t; --n;
    if (!n) break; if (*t == c) break; ++t; --n;
    if (!n) break; if (*t == c) break; ++t; --n;
  }
  return t - s;
}
