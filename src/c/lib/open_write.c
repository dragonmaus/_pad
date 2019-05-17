#include <fcntl.h>
#include "open.h"

  int
open_write(const char *fn)
{
#ifdef WIN32
  return open(fn, O_WRONLY | O_BINARY);
#else
  return open(fn, O_WRONLY | O_NONBLOCK);
#endif
}
