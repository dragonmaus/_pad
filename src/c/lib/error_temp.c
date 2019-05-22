/* automatically generated */
#define RC_INVOKED /* we only want the E macros */
#include <errno.h>
#undef RC_INVOKED
#include "error.h"

#define X(n) if (e == n) return 1

  unsigned int
error_temp(int e)
{
  X(error_intr);
  X(error_io);
  X(error_again);
  X(error_wouldblock);
  X(error_nomem);
#ifdef EBUSY
  X(EBUSY);
#endif
#ifdef ENFILE
  X(ENFILE);
#endif
#ifdef EMFILE
  X(EMFILE);
#endif
  X(error_txtbsy);
#ifdef EFBIG
  X(EFBIG);
#endif
#ifdef ENOSPC
  X(ENOSPC);
#endif
#ifdef EDEADLK
  X(EDEADLK);
#endif
#ifdef EDEADLOCK
  X(EDEADLOCK);
#endif
#ifdef ENOLCK
  X(ENOLCK);
#endif
#ifdef EUSERS
  X(EUSERS);
#endif
#ifdef ENETDOWN
  X(ENETDOWN);
#endif
#ifdef ENETUNREACH
  X(ENETUNREACH);
#endif
#ifdef ENETRESET
  X(ENETRESET);
#endif
#ifdef ECONNABORTED
  X(ECONNABORTED);
#endif
#ifdef ECONNRESET
  X(ECONNRESET);
#endif
#ifdef ENOBUFS
  X(ENOBUFS);
#endif
#ifdef ETOOMANYREFS
  X(ETOOMANYREFS);
#endif
  X(error_timeout);
  X(error_connrefused);
#ifdef EHOSTDOWN
  X(EHOSTDOWN);
#endif
#ifdef EHOSTUNREACH
  X(EHOSTUNREACH);
#endif
#ifdef ESTALE
  X(ESTALE);
#endif
#ifdef EDQUOT
  X(EDQUOT);
#endif
#ifdef EPROCLIM
  X(EPROCLIM);
#endif
  return 0;
}
