#include <fcntl.h>
#include "open.h"

  int
open_trunc(const char *fn)
{
#ifdef WIN32
  return open(fn, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0644);
#else
  return open(fn, O_WRONLY | O_CREAT | O_TRUNC | O_NONBLOCK, 0644);
#endif
}
