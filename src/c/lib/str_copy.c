#include "str.h"

unsigned int str_copy(char *to, const char *from)
{
  int n = 0;

  for (;;) {
    if (!(*to = *from)) return n; ++to; ++from; ++n;
    if (!(*to = *from)) return n; ++to; ++from; ++n;
    if (!(*to = *from)) return n; ++to; ++from; ++n;
    if (!(*to = *from)) return n; ++to; ++from; ++n;
  }
}
