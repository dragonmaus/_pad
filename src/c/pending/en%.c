#include <unistd.h>
#include "buffer.h"
#include "path.h"
#include "strerr.h"

#define c2s(c) ((char[2]){ (c), 0 })
#define safely(x) if ((x) == -1) strerr_die(1, program, ": ")

  static int
enhex(const char c)
{
  if (c >= 0x0 && c <= 0x9) return c - 0x0 + '0';
  if (c >= 0xA && c <= 0xF) return c - 0xA + 'A';
  return -1;
}

  static unsigned int
special(const char c)
{
  if (c == '\n') return 0;
  if (c == '-') return 0;
  if (c == '_') return 0;
  if (c >= '0' && c <= '9') return 0;
  if (c >= 'A' && c <= 'Z') return 0;
  if (c >= 'a' && c <= 'z') return 0;
  return 1;
}

  int
main(void)
{
  const char *program = path_base(*argv);
  register char c, k;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (special(c)) {
      safely(buffer_putc(buffer_1, '%'));
      if ((k = enhex((c & 0xF0) / 0x10)) == -1) strerr_die(1, program, ": Could not encode character '", c2s(c), "'");
      safely(buffer_putc(buffer_1, (char)k));
      if ((k = enhex(c & 0x0F)) == -1) strerr_die(1, program, ": Could not encode character '", c2s(c), "'");
      safely(buffer_putc(buffer_1, (char)k));
    } else safely(buffer_putc(buffer_1, c));
  }
  safely(buffer_flush(buffer_1));
  _exit(0);
}
