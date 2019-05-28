#include <sys.h>
#include "error.h"
#include "open.h"

  int
open_write(const char *fn)
{
  int fd;

#ifdef WIN32
  fd = open(fn, O_WRONLY | O_BINARY);
#else
  fd = open(fn, O_WRONLY | O_NONBLOCK);
#endif
  if (fd == -2) {
    fd = -1;
    errno = error_noent;
  }
  return fd;
}
