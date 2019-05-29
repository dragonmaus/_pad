#include <sys.h>
#include "error.h"
#include "open.h"

  int
open_excl(const char *fn)
{
  int fd;

#ifdef WIN32
  fd = open(fn, O_WRONLY | O_CREAT | O_EXCL | O_BINARY, 0644);
#else
  fd = open(fn, O_WRONLY | O_CREAT | O_EXCL | O_NONBLOCK, 0644);
#endif
  if (fd == -2) {
    fd = -1;
    errno = error_noent;
  }
  return fd;
}