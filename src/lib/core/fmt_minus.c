#include "fmt.h"

  unsigned int
fmt_minus(register char *s, register long long int i)
{
  unsigned int len;

  len = 0;
  if (i < 0) {
    len += fmt_str(s, "-");
    i = -i;
  }
  len += fmt_ullong(s + len, i);
  return len;
}
