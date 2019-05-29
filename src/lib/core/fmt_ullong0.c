#include "fmt.h"

  unsigned int
fmt_ullong0(register char *s, register unsigned long long int u, unsigned int n)
{
  register unsigned int len;

  len = fmt_ullong(FMT_LEN, u);
  while (len < n) {
    if (s) *s++ = '0';
    ++len;
  }
  if (s) fmt_ullong(s, u);
  return len;
}
