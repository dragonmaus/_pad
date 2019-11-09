#include <fcntl.h>
#include <unistd.h>

  int
main(int argc, const char **argv)
{
  register int fd;

  if (!--argc) _exit(2);
  while (*++argv) {
    fd = open(*argv, O_NOATIME | O_NONBLOCK);
    if (fd == -1) _exit(1);
    if (fsync(fd) == -1) _exit(1);
    close(fd);
  }
  return 0;
}
