#include <unistd.h>
#include "buffer.h"
#include "path.h"
#include "str.h"
#include "strerr.h"

#define SIZE 4096
#define safely(x) if ((x) == -1) strerr_die2sys(1, program, ": fatal: ")

  int
main(int argc, const char **argv)
{
  const char *program = path_base(*argv);
  char path[SIZE];
  int len;

  if (argc > 1) {
    while (*++argv) {
      str_copy(path, *argv);
      safely(path_canonical(path, SIZE));
      safely(buffer_puts(buffer_1, path));
      safely(buffer_putc(buffer_1, '\n'));
    }
  } else {
    str_copy(path, ".");
    safely(path_canonical(path, SIZE));
    safely(buffer_puts(buffer_1, path));
    safely(buffer_putc(buffer_1, '\n'));
  }
  safely(buffer_flush(buffer_1));
  _exit(0);
}
