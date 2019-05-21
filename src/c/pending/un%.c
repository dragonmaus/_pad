#include <unistd.h>
#include "buffer.h"
#include "path.h"
#include "strerr.h"

#define safely(x) if ((x) == -1) strerr_die(1, program, ": ")

  static int
dehex(const char c)
{
  if (c >= '0' && c <= '9') return c - '0' + 0x0;
  if (c >= 'A' && c <= 'F') return c - 'A' + 0xA;
  if (c >= 'a' && c <= 'f') return c - 'a' + 0xa;
  return -1;
}

  int
main(void)
{
  const char *program = path_base(*argv);
  register char c, k;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (c == '%') {
      if (buffer_getc(buffer_0, &k) <= 0) strerr_die(1, program, ": Incomplete percent-encoded sequence");
      if (buffer_getc(buffer_0, &c) <= 0) strerr_die(1, program, ": Incomplete percent-encoded sequence");
      safely(buffer_putc(buffer_1, (char)(k * 0x10 + c)));
    } else safely(buffer_putc(buffer_1, c));
  }
  safely(buffer_flush(buffer_1));
  _exit(0);
}
