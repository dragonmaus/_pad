#include "str.h"

  unsigned int
str_find(register const char *s, char c)
{
  register const char *t;
  register char x;

  t = s;
  for (;;) {
    x = *t; if (!x) break; if (x == c) break; ++t;
    x = *t; if (!x) break; if (x == c) break; ++t;
    x = *t; if (!x) break; if (x == c) break; ++t;
    x = *t; if (!x) break; if (x == c) break; ++t;
  }
  return t - s;
}
