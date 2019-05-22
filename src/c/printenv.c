#include <unistd.h>
#include "buffer.h"
#include "env.h"
#include "option.h"
#include "path.h"
#include "strerr.h"

#define safely(x) if ((x) == -1) strerr_die2sys(1, program, ": ")

static const char *help = "[-hz] [name …]\n\
\n\
  -h   display this help\n\
  -z   terminate lines with null instead of newline";

  int
main(int argc, const char **argv)
{
  const char *program = path_base(*argv);
  char eol, opt;
  const char *value;

  eol = '\n';
  while ((opt = option_next(argc, argv, "hz")) != -1) {
    switch (opt) {
      case 'h':
        strerr_die4x(0, "usage: ", program, " ", help);
      case 'z':
        eol = 0;
        break;
      case '?':
        strerr_die4x(1, program, ": fatal: unknown option '", &option_error, "'");
    }
  }
  argc -= option_index;
  argv += option_index;

  if (argc > 0) {
    while (*argv) {
      if ((value = env_get(*argv))) {
        safely(buffer_puts(buffer_1, value));
        safely(buffer_putc(buffer_1, eol));
      }
      ++argv;
    }
  } else {
    while (*environ) {
      safely(buffer_puts(buffer_1, *environ));
      safely(buffer_putc(buffer_1, eol));
      ++environ;
    }
  }
  safely(buffer_flush(buffer_1));
  _exit(0);
}
