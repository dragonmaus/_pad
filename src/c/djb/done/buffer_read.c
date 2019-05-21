#include <unistd.h>
#include "buffer.h"

  int
buffer_read(int fd, char *buf, unsigned int len)
{
  return read(fd, buf, len);
}
