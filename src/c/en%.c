#include <unistd.h>
#include "buffer.h"
#include "strerr.h"

#define FATAL "en%: fatal: "

#define safe_buffer_flush(b) if (buffer_flush((b)) == -1) strerr_die2sys(1, FATAL, "error flushing buffer: ")
#define safe_buffer_putc(b,c) if (buffer_putc((b), (c)) == -1) strerr_die2sys(1, FATAL, "error writing to buffer: ")

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
main(int argc, const char **argv)
{
  char c, k;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (!special(c)) safe_buffer_putc(buffer_1, c);
    else {
      safe_buffer_putc(buffer_1, '%');

      k = enhex((c & 0xF0) / 0x10);
      if (k == -1) strerr_die4x(1, FATAL, "could not encode character '", &c, "'");
      safe_buffer_putc(buffer_1, (char)k);

      k = enhex(c & 0x0F);
      if (k == -1) strerr_die4x(1, FATAL, "could not encode character '", &c, "'");
      safe_buffer_putc(buffer_1, (char)k);
    }
  }
  safe_buffer_flush(buffer_1);
  _exit(0);
}
