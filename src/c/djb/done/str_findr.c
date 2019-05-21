#include "str.h"

  unsigned int str_findr(register const char *s, char c)
{
  register const char *t;
  register const char *u;
  register char x;

  t = s;
  u = 0;
  for (;;) {
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
  }
  if (!u) u = t;
  return u - s;
}
