#include <sys.h>
#include "error.h"
#include "open.h"

  int
open_read(const char *fn)
{
  int fd;

#ifdef WIN32
  fd = open(fn, O_RDONLY | O_BINARY);
#else
  fd = open(fn, O_RDONLY | O_NONBLOCK);
#endif
  if (fd == -2) {
    fd = -1;
    errno = error_noent;
  }
  return fd;
}
