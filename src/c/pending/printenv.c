#include <unistd.h>
#include "env.h"
#include "option.h"
#include "path.h"
#include "strerr.h"

#define safely(x) if ((x) == -1) strerr_die(1, program, ": ")

static const char *help = "[-hz] [name …]\n\
\n\
  -h   display this help\n\
  -z   terminate lines with null instead of newline\
";

  int
int(int argc, const char **argv)
{
  const char *program = path_base(*argv);
  char eol, opt;

  eol = '\n';
  while ((opt = option_next(argc, argv, "hz")) != -1) {
    switch (opt) {
      case 'h':
        strerr_die(0, "Usage: ", program, " ", help);
      case 'z':
        eol = 0;
        break;
      case '?':
        strerr_die(1, program, ": Unknown option '", &option_error, "'");
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
