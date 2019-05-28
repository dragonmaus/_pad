#include "fmt.h"

  unsigned int
fmt_ullongx(register char *s, register unsigned long long int u)
{
  register unsigned int len;
  register unsigned long long int q;
  register char c;

  len = 1;
  q = u;
  while (q > 15) {
    ++len;
    q /= 16;
  }
  if (s) {
    s += len;
    do {
      c = '0' + (u & 15);
      if (c > '0' + 9) c += 'a' - '0' - 10;
      *--s = c;
      u /= 16;
    } while (u);
  }
  return len;
}
