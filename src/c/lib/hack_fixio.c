#ifdef WIN32

#include <fcntl.h>
#include <unistd.h>
#include "hack.h"

/* textual IO on Windows is mangled to convert LF to CRLF */
  void
hack_fixio(void)
{
  setmode(0, O_BINARY);
  setmode(1, O_BINARY);
  setmode(2, O_BINARY);
}

#endif
