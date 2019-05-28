#include "fmt.h"

  unsigned int
fmt_plusminus(register char *s, register long long int i)
{
  unsigned int len;

  len = 0;
  if (i < 0) {
    len += fmt_str(s, "-");
    i = -i;
  } else {
    len += fmt_str(s, "+");
  }
  len += fmt_ullong(s + len, i);
  return len;
}
