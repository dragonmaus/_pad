#include <unistd.h>
#include "buffer.h"
#include "path.h"
#include "strerr.h"

#define safely(x) if ((x) == -1) strerr_die(1, program, ": ")

  int
main(void)
{
  const char *program = path_base(*argv);
  register char c;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (c == '\r') {
      safely(buffer_putc(buffer_1, '\n'));
      if (buffer_peek(buffer_0) == '\n') buffer_seek(buffer_0, 1);
    } else safely(buffer_putc(buffer_1, c));
  }
  safely(buffer_flush(buffer_1));
  _exit(0);
}
