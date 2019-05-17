#include <unistd.h>
#include "print.h"
#include "str.h"

  int
print(const char *s)
{
  return write(1, s, str_len(s));
}
