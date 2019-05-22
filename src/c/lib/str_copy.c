#include "str.h"

  unsigned int
str_copy(register char *to, register const char *from)
{
  register int len;

  len = 0;
  for (;;) {
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
    if (!(*to = *from)) return len; ++to; ++from; ++len;
  }
}
