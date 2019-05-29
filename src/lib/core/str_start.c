#include "str.h"

  unsigned int
str_start(register const char *s, register const char *t)
{
  register char x;

  for (;;) {
    x = *t; if (!x) return 1; if (x != *s) return 0; ++s; ++t;
    x = *t; if (!x) return 1; if (x != *s) return 0; ++s; ++t;
    x = *t; if (!x) return 1; if (x != *s) return 0; ++s; ++t;
    x = *t; if (!x) return 1; if (x != *s) return 0; ++s; ++t;
  }
}
