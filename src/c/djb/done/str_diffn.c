#include "str.h"

  int
str_diffn(register const char *s, register unsigned int len, register const char *t)
{
  register char x;

  for (;;) {
    if (!len) return 0; x = *s; if (x != *t) break; if (!x) break; ++s; ++t; --len;
    if (!len) return 0; x = *s; if (x != *t) break; if (!x) break; ++s; ++t; --len;
    if (!len) return 0; x = *s; if (x != *t) break; if (!x) break; ++s; ++t; --len;
    if (!len) return 0; x = *s; if (x != *t) break; if (!x) break; ++s; ++t; --len;
  }
  return ((int)(unsigned int)(unsigned char) x)
       - ((int)(unsigned int)(unsigned char) *t);
}
