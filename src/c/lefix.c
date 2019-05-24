#include <unistd.h>
#include "buffer.h"
#include "strerr.h"

#define FATAL "lefix: fatal: "

#define safe_buffer_flush(b) if (buffer_flush((b)) == -1) strerr_die2sys(1, FATAL, "error flushing buffer: ")
#define safe_buffer_putc(b,c) if (buffer_putc((b), (c)) == -1) strerr_die2sys(1, FATAL, "error writing to buffer: ")

  int
main(int argc, const char **argv)
{
  char c;

  while (buffer_getc(buffer_0, &c) > 0) {
    if (c != '\r') safe_buffer_putc(buffer_1, c);
    else {
      safe_buffer_putc(buffer_1, '\n');
      if (*buffer_peek(buffer_0) == '\n') buffer_seek(buffer_0, 1);
    }
  }
  safe_buffer_flush(buffer_1);
  _exit(0);
}
