#include <unistd.h>
#include "open.h"
#include "path.h"
#include "strerr.h"

#define safely(x) if ((x) == -1) strerr_die(1, program, ": ")

  int
main(int argc, const char **argv)
{
  const char *program = path_base(*argv);
  register int fd;

  if (argc <= 1) strerr_die(1, "Usage: ", program, " file [file...]");
  while (*++argv) {
    safely(fd = open_read(*argv));
    safely(fsync(fd));
    safely(close(fd));
  }
  _exit(0);
}
