#include <fcntl.h>
#include "open.h"

  int
open_append(const char *fn)
{
#ifdef WIN32
  return open(fn, O_WRONLY | O_CREAT | O_APPEND | O_BINARY, 0600);
#else
  return open(fn, O_WRONLY | O_CREAT | O_APPEND | O_NONBLOCK, 0600);
#endif
}
