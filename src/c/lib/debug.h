#include "buffer.h"
#include "debug.h"
#include "fmt.h"

  unsigned int
debug(const char *name, const char *s, unsigned int n)
{
  char len;
  char x[1000];

  len = 0;
  len += buffer_puts(buffer_1, "  ");
  len += buffer_puts(buffer_1, name);
  len += buffer_puts(buffer_1, " (");
  x[fmt_uint(x, n)] = 0;
  len += buffer_puts(buffer_1, x);
  len += buffer_puts(buffer_1, ") = '");
  len += buffer_puts(buffer_1, s);
  len += buffer_puts(buffer_1, "'\n");
  buffer_flush(buffer_1);
  return len;
}

  unsigned int
debugnum(const char *name, long long int n)
{
  char len;
  char x[1000];

  len = 0;
  len += buffer_puts(buffer_1, "  ");
  len += buffer_puts(buffer_1, name);
  len += buffer_puts(buffer_1, " = ");
  x[fmt_minus(x, n)] = 0;
  len += buffer_puts(buffer_1, x);
  len += buffer_putc(buffer_1, '\n');
  buffer_flush(buffer_1);
  return len;
}
