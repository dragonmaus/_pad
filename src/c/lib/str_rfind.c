#include "str.h"

  unsigned int
str_rfind(register const char *s, register char c)
{
  register const char *t;
  register const char *u;
  register char x;

  t = s;
  u = ((char *)0);
  for (;;) {
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
    x = *t; if (!x) break; if (x == c) u = t; ++t;
  }
  if (!u) u = t;
  return u - s;
}
