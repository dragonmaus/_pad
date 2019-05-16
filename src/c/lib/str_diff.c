#include "str.h"

  int
str_diff(const char *s, const char *t)
{
  for (;;) {
    if (*s != *t) break; if (!*s) break; ++s; ++t;
    if (*s != *t) break; if (!*s) break; ++s; ++t;
    if (*s != *t) break; if (!*s) break; ++s; ++t;
    if (*s != *t) break; if (!*s) break; ++s; ++t;
  }

  return ((int)(unsigned int)(unsigned char) *s)
       - ((int)(unsigned int)(unsigned char) *t);
}
