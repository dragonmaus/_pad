#ifdef WIN32
#include <fcntl.h>
#endif
#include <sys.h>
#include "buffer.h"

  int
buffer_read(int fd, char *buf, unsigned int len)
{
#ifdef WIN32
  setmode(fd, O_BINARY);
#endif
  return read(fd, buf, len);
}
