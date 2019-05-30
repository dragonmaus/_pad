#include <sys.h>
#include "error.h"
#include "open.h"

  int
open_path(const char *fn)
{
  int fd;

#ifdef WIN32
  fd = open(fn, O_PATH | O_CLOEXEC | O_BINARY, 0);
#else
  fd = open(fn, O_PATH | O_CLOEXEC | O_NONBLOCK, 0);
#endif
  if (fd == -2) {
    fd = -1;
    errno = error_noent;
  }
  return fd;
}
