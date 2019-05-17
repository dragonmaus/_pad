#include <fcntl.h>
#include "open.h"

  int
open_excl(const char *fn)
{
#ifdef WIN32
  return open(fn, O_WRONLY | O_CREAT | O_EXCL | O_BINARY, 0644);
#else
  return open(fn, O_WRONLY | O_CREAT | O_EXCL | O_NONBLOCK, 0644);
#endif
}
