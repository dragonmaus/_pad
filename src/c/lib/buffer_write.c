#ifdef WIN32
#include <fcntl.h>
#endif
#include <unistd.h>
#include "buffer.h"

  int
buffer_write(int fd, const char *buf, unsigned int len)
{
#ifdef WIN32
  setmode(fd, O_BINARY);
#endif
  return write(fd, buf, len);
}
