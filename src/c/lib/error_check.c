#include <errno.h>
#include "error.h"

#define X(n) if (e == n) return 1

  unsigned int
error_check(int e)
{
  X(error_noent);
#ifdef EPERM
  X(EPERM);
#endif
/* #ifdef ENOENT */
/*   X(ENOENT); */
/* #endif */
#ifdef ESRCH
  X(ESRCH);
#endif
#ifdef EINTR
  X(EINTR);
#endif
#ifdef EIO
  X(EIO);
#endif
#ifdef ENXIO
  X(ENXIO);
#endif
#ifdef E2BIG
  X(E2BIG);
#endif
#ifdef ENOEXEC
  X(ENOEXEC);
#endif
#ifdef EBADF
  X(EBADF);
#endif
#ifdef ECHILD
  X(ECHILD);
#endif
#ifdef EAGAIN
  X(EAGAIN);
#endif
#ifdef EWOULDBLOCK
  X(EWOULDBLOCK);
#endif
#ifdef ENOMEM
  X(ENOMEM);
#endif
#ifdef EACCES
  X(EACCES);
#endif
#ifdef EFAULT
  X(EFAULT);
#endif
#ifdef ENOTBLK
  X(ENOTBLK);
#endif
#ifdef EBUSY
  X(EBUSY);
#endif
#ifdef EEXIST
  X(EEXIST);
#endif
#ifdef EXDEV
  X(EXDEV);
#endif
#ifdef ENODEV
  X(ENODEV);
#endif
#ifdef ENOTDIR
  X(ENOTDIR);
#endif
#ifdef EISDIR
  X(EISDIR);
#endif
#ifdef EINVAL
  X(EINVAL);
#endif
#ifdef ENFILE
  X(ENFILE);
#endif
#ifdef EMFILE
  X(EMFILE);
#endif
#ifdef ENOTTY
  X(ENOTTY);
#endif
#ifdef ETXTBSY
  X(ETXTBSY);
#endif
#ifdef EFBIG
  X(EFBIG);
#endif
#ifdef ENOSPC
  X(ENOSPC);
#endif
#ifdef ESPIPE
  X(ESPIPE);
#endif
#ifdef EROFS
  X(EROFS);
#endif
#ifdef EMLINK
  X(EMLINK);
#endif
#ifdef EPIPE
  X(EPIPE);
#endif
#ifdef EDOM
  X(EDOM);
#endif
#ifdef ERANGE
  X(ERANGE);
#endif
#ifdef EDEADLK
  X(EDEADLK);
#endif
#ifdef EDEADLOCK
  X(EDEADLOCK);
#endif
#ifdef ENAMETOOLONG
  X(ENAMETOOLONG);
#endif
#ifdef ENOLCK
  X(ENOLCK);
#endif
#ifdef ENOSYS
  X(ENOSYS);
#endif
#ifdef ENOTEMPTY
  X(ENOTEMPTY);
#endif
#ifdef ELOOP
  X(ELOOP);
#endif
#ifdef ENOMSG
  X(ENOMSG);
#endif
#ifdef EIDRM
  X(EIDRM);
#endif
#ifdef ECHRNG
  X(ECHRNG);
#endif
#ifdef EL2NSYNC
  X(EL2NSYNC);
#endif
#ifdef EL3HLT
  X(EL3HLT);
#endif
#ifdef EL3RST
  X(EL3RST);
#endif
#ifdef ELNRNG
  X(ELNRNG);
#endif
#ifdef EUNATCH
  X(EUNATCH);
#endif
#ifdef ENOCSI
  X(ENOCSI);
#endif
#ifdef EL2HLT
  X(EL2HLT);
#endif
#ifdef EBADE
  X(EBADE);
#endif
#ifdef EBADR
  X(EBADR);
#endif
#ifdef EXFULL
  X(EXFULL);
#endif
#ifdef ENOANO
  X(ENOANO);
#endif
#ifdef EBADRQC
  X(EBADRQC);
#endif
#ifdef EBADSLT
  X(EBADSLT);
#endif
#ifdef EBFONT
  X(EBFONT);
#endif
#ifdef ENOSTR
  X(ENOSTR);
#endif
#ifdef ENODATA
  X(ENODATA);
#endif
#ifdef ETIME
  X(ETIME);
#endif
#ifdef ENOSR
  X(ENOSR);
#endif
#ifdef ENONET
  X(ENONET);
#endif
#ifdef ENOPKG
  X(ENOPKG);
#endif
#ifdef EREMOTE
  X(EREMOTE);
#endif
#ifdef ENOLINK
  X(ENOLINK);
#endif
#ifdef EADV
  X(EADV);
#endif
#ifdef ESRMNT
  X(ESRMNT);
#endif
#ifdef ECOMM
  X(ECOMM);
#endif
#ifdef EPROTO
  X(EPROTO);
#endif
#ifdef EMULTIHOP
  X(EMULTIHOP);
#endif
#ifdef EDOTDOT
  X(EDOTDOT);
#endif
#ifdef EBADMSG
  X(EBADMSG);
#endif
#ifdef EOVERFLOW
  X(EOVERFLOW);
#endif
#ifdef ENOTUNIQ
  X(ENOTUNIQ);
#endif
#ifdef EBADFD
  X(EBADFD);
#endif
#ifdef EREMCHG
  X(EREMCHG);
#endif
#ifdef ELIBACC
  X(ELIBACC);
#endif
#ifdef ELIBBAD
  X(ELIBBAD);
#endif
#ifdef ELIBSCN
  X(ELIBSCN);
#endif
#ifdef ELIBMAX
  X(ELIBMAX);
#endif
#ifdef ELIBEXEC
  X(ELIBEXEC);
#endif
#ifdef EILSEQ
  X(EILSEQ);
#endif
#ifdef ERESTART
  X(ERESTART);
#endif
#ifdef ESTRPIPE
  X(ESTRPIPE);
#endif
#ifdef EUSERS
  X(EUSERS);
#endif
#ifdef ENOTSOCK
  X(ENOTSOCK);
#endif
#ifdef EDESTADDRREQ
  X(EDESTADDRREQ);
#endif
#ifdef EMSGSIZE
  X(EMSGSIZE);
#endif
#ifdef EPROTOTYPE
  X(EPROTOTYPE);
#endif
#ifdef ENOPROTOOPT
  X(ENOPROTOOPT);
#endif
#ifdef EPROTONOSUPPORT
  X(EPROTONOSUPPORT);
#endif
#ifdef ESOCKTNOSUPPORT
  X(ESOCKTNOSUPPORT);
#endif
#ifdef ENOTSUP
  X(ENOTSUP);
#endif
#ifdef EOPNOTSUPP
  X(EOPNOTSUPP);
#endif
#ifdef EPFNOSUPPORT
  X(EPFNOSUPPORT);
#endif
#ifdef EAFNOSUPPORT
  X(EAFNOSUPPORT);
#endif
#ifdef EADDRINUSE
  X(EADDRINUSE);
#endif
#ifdef EADDRNOTAVAIL
  X(EADDRNOTAVAIL);
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
#ifdef EISCONN
  X(EISCONN);
#endif
#ifdef ENOTCONN
  X(ENOTCONN);
#endif
#ifdef ESHUTDOWN
  X(ESHUTDOWN);
#endif
#ifdef ETOOMANYREFS
  X(ETOOMANYREFS);
#endif
#ifdef ETIMEDOUT
  X(ETIMEDOUT);
#endif
#ifdef ECONNREFUSED
  X(ECONNREFUSED);
#endif
#ifdef EHOSTDOWN
  X(EHOSTDOWN);
#endif
#ifdef EHOSTUNREACH
  X(EHOSTUNREACH);
#endif
#ifdef EALREADY
  X(EALREADY);
#endif
#ifdef EINPROGRESS
  X(EINPROGRESS);
#endif
#ifdef ESTALE
  X(ESTALE);
#endif
#ifdef EUCLEAN
  X(EUCLEAN);
#endif
#ifdef ENOTNAM
  X(ENOTNAM);
#endif
#ifdef ENAVAIL
  X(ENAVAIL);
#endif
#ifdef EISNAM
  X(EISNAM);
#endif
#ifdef EREMOTEIO
  X(EREMOTEIO);
#endif
#ifdef EDQUOT
  X(EDQUOT);
#endif
#ifdef ENOMEDIUM
  X(ENOMEDIUM);
#endif
#ifdef EMEDIUMTYPE
  X(EMEDIUMTYPE);
#endif
#ifdef ECANCELED
  X(ECANCELED);
#endif
#ifdef ENOKEY
  X(ENOKEY);
#endif
#ifdef EKEYEXPIRED
  X(EKEYEXPIRED);
#endif
#ifdef EKEYREVOKED
  X(EKEYREVOKED);
#endif
#ifdef EKEYREJECTED
  X(EKEYREJECTED);
#endif
#ifdef EOWNERDEAD
  X(EOWNERDEAD);
#endif
#ifdef ENOTRECOVERABLE
  X(ENOTRECOVERABLE);
#endif
#ifdef ERFKILL
  X(ERFKILL);
#endif
#ifdef EHWPOISON
  X(EHWPOISON);
#endif
  return 0;
}
