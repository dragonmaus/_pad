#include <errno.h>
#include "error.h"

#define X(n,s) if (e == n) return s

  const char *
error_str(int e)
{
  X(0, "no error");
  X(error_noent, "no such file or directory");
#ifdef EPERM
  X(EPERM, "Operation not permitted");
#endif
/* #ifdef ENOENT */
/*   X(ENOENT, "No such file or directory"); */
/* #endif */
#ifdef ESRCH
  X(ESRCH, "No such process");
#endif
#ifdef EINTR
  X(EINTR, "Interrupted system call");
#endif
#ifdef EIO
  X(EIO, "Input/output error");
#endif
#ifdef ENXIO
  X(ENXIO, "No such device or address");
#endif
#ifdef E2BIG
  X(E2BIG, "Argument list too long");
#endif
#ifdef ENOEXEC
  X(ENOEXEC, "Exec format error");
#endif
#ifdef EBADF
  X(EBADF, "Bad file descriptor");
#endif
#ifdef ECHILD
  X(ECHILD, "No child processes");
#endif
#ifdef EAGAIN
  X(EAGAIN, "Resource temporarily unavailable");
#endif
#ifdef EWOULDBLOCK
  X(EWOULDBLOCK, "Resource temporarily unavailable");
#endif
#ifdef ENOMEM
  X(ENOMEM, "Cannot allocate memory");
#endif
#ifdef EACCES
  X(EACCES, "Permission denied");
#endif
#ifdef EFAULT
  X(EFAULT, "Bad address");
#endif
#ifdef ENOTBLK
  X(ENOTBLK, "Block device required");
#endif
#ifdef EBUSY
  X(EBUSY, "Device or resource busy");
#endif
#ifdef EEXIST
  X(EEXIST, "File exists");
#endif
#ifdef EXDEV
  X(EXDEV, "Invalid cross-device link");
#endif
#ifdef ENODEV
  X(ENODEV, "No such device");
#endif
#ifdef ENOTDIR
  X(ENOTDIR, "Not a directory");
#endif
#ifdef EISDIR
  X(EISDIR, "Is a directory");
#endif
#ifdef EINVAL
  X(EINVAL, "Invalid argument");
#endif
#ifdef ENFILE
  X(ENFILE, "Too many open files in system");
#endif
#ifdef EMFILE
  X(EMFILE, "Too many open files");
#endif
#ifdef ENOTTY
  X(ENOTTY, "Inappropriate ioctl for device");
#endif
#ifdef ETXTBSY
  X(ETXTBSY, "Text file busy");
#endif
#ifdef EFBIG
  X(EFBIG, "File too large");
#endif
#ifdef ENOSPC
  X(ENOSPC, "No space left on device");
#endif
#ifdef ESPIPE
  X(ESPIPE, "Illegal seek");
#endif
#ifdef EROFS
  X(EROFS, "Read-only file system");
#endif
#ifdef EMLINK
  X(EMLINK, "Too many links");
#endif
#ifdef EPIPE
  X(EPIPE, "Broken pipe");
#endif
#ifdef EDOM
  X(EDOM, "Numerical argument out of domain");
#endif
#ifdef ERANGE
  X(ERANGE, "Numerical result out of range");
#endif
#ifdef EDEADLK
  X(EDEADLK, "Resource deadlock avoided");
#endif
#ifdef EDEADLOCK
  X(EDEADLOCK, "Resource deadlock avoided");
#endif
#ifdef ENAMETOOLONG
  X(ENAMETOOLONG, "File name too long");
#endif
#ifdef ENOLCK
  X(ENOLCK, "No locks available");
#endif
#ifdef ENOSYS
  X(ENOSYS, "Function not implemented");
#endif
#ifdef ENOTEMPTY
  X(ENOTEMPTY, "Directory not empty");
#endif
#ifdef ELOOP
  X(ELOOP, "Too many levels of symbolic links");
#endif
#ifdef ENOMSG
  X(ENOMSG, "No message of desired type");
#endif
#ifdef EIDRM
  X(EIDRM, "Identifier removed");
#endif
#ifdef ECHRNG
  X(ECHRNG, "Channel number out of range");
#endif
#ifdef EL2NSYNC
  X(EL2NSYNC, "Level 2 not synchronized");
#endif
#ifdef EL3HLT
  X(EL3HLT, "Level 3 halted");
#endif
#ifdef EL3RST
  X(EL3RST, "Level 3 reset");
#endif
#ifdef ELNRNG
  X(ELNRNG, "Link number out of range");
#endif
#ifdef EUNATCH
  X(EUNATCH, "Protocol driver not attached");
#endif
#ifdef ENOCSI
  X(ENOCSI, "No CSI structure available");
#endif
#ifdef EL2HLT
  X(EL2HLT, "Level 2 halted");
#endif
#ifdef EBADE
  X(EBADE, "Invalid exchange");
#endif
#ifdef EBADR
  X(EBADR, "Invalid request descriptor");
#endif
#ifdef EXFULL
  X(EXFULL, "Exchange full");
#endif
#ifdef ENOANO
  X(ENOANO, "No anode");
#endif
#ifdef EBADRQC
  X(EBADRQC, "Invalid request code");
#endif
#ifdef EBADSLT
  X(EBADSLT, "Invalid slot");
#endif
#ifdef EBFONT
  X(EBFONT, "Bad font file format");
#endif
#ifdef ENOSTR
  X(ENOSTR, "Device not a stream");
#endif
#ifdef ENODATA
  X(ENODATA, "No data available");
#endif
#ifdef ETIME
  X(ETIME, "Timer expired");
#endif
#ifdef ENOSR
  X(ENOSR, "Out of streams resources");
#endif
#ifdef ENONET
  X(ENONET, "Machine is not on the network");
#endif
#ifdef ENOPKG
  X(ENOPKG, "Package not installed");
#endif
#ifdef EREMOTE
  X(EREMOTE, "Object is remote");
#endif
#ifdef ENOLINK
  X(ENOLINK, "Link has been severed");
#endif
#ifdef EADV
  X(EADV, "Advertise error");
#endif
#ifdef ESRMNT
  X(ESRMNT, "Srmount error");
#endif
#ifdef ECOMM
  X(ECOMM, "Communication error on send");
#endif
#ifdef EPROTO
  X(EPROTO, "Protocol error");
#endif
#ifdef EMULTIHOP
  X(EMULTIHOP, "Multihop attempted");
#endif
#ifdef EDOTDOT
  X(EDOTDOT, "RFS specific error");
#endif
#ifdef EBADMSG
  X(EBADMSG, "Bad message");
#endif
#ifdef EOVERFLOW
  X(EOVERFLOW, "Value too large for defined data type");
#endif
#ifdef ENOTUNIQ
  X(ENOTUNIQ, "Name not unique on network");
#endif
#ifdef EBADFD
  X(EBADFD, "File descriptor in bad state");
#endif
#ifdef EREMCHG
  X(EREMCHG, "Remote address changed");
#endif
#ifdef ELIBACC
  X(ELIBACC, "Can not access a needed shared library");
#endif
#ifdef ELIBBAD
  X(ELIBBAD, "Accessing a corrupted shared library");
#endif
#ifdef ELIBSCN
  X(ELIBSCN, ".lib section in a.out corrupted");
#endif
#ifdef ELIBMAX
  X(ELIBMAX, "Attempting to link in too many shared libraries");
#endif
#ifdef ELIBEXEC
  X(ELIBEXEC, "Cannot exec a shared library directly");
#endif
#ifdef EILSEQ
  X(EILSEQ, "Invalid or incomplete multibyte or wide character");
#endif
#ifdef ERESTART
  X(ERESTART, "Interrupted system call should be restarted");
#endif
#ifdef ESTRPIPE
  X(ESTRPIPE, "Streams pipe error");
#endif
#ifdef EUSERS
  X(EUSERS, "Too many users");
#endif
#ifdef ENOTSOCK
  X(ENOTSOCK, "Socket operation on non-socket");
#endif
#ifdef EDESTADDRREQ
  X(EDESTADDRREQ, "Destination address required");
#endif
#ifdef EMSGSIZE
  X(EMSGSIZE, "Message too long");
#endif
#ifdef EPROTOTYPE
  X(EPROTOTYPE, "Protocol wrong type for socket");
#endif
#ifdef ENOPROTOOPT
  X(ENOPROTOOPT, "Protocol not available");
#endif
#ifdef EPROTONOSUPPORT
  X(EPROTONOSUPPORT, "Protocol not supported");
#endif
#ifdef ESOCKTNOSUPPORT
  X(ESOCKTNOSUPPORT, "Socket type not supported");
#endif
#ifdef ENOTSUP
  X(ENOTSUP, "Operation not supported");
#endif
#ifdef EOPNOTSUPP
  X(EOPNOTSUPP, "Operation not supported");
#endif
#ifdef EPFNOSUPPORT
  X(EPFNOSUPPORT, "Protocol family not supported");
#endif
#ifdef EAFNOSUPPORT
  X(EAFNOSUPPORT, "Address family not supported by protocol");
#endif
#ifdef EADDRINUSE
  X(EADDRINUSE, "Address already in use");
#endif
#ifdef EADDRNOTAVAIL
  X(EADDRNOTAVAIL, "Cannot assign requested address");
#endif
#ifdef ENETDOWN
  X(ENETDOWN, "Network is down");
#endif
#ifdef ENETUNREACH
  X(ENETUNREACH, "Network is unreachable");
#endif
#ifdef ENETRESET
  X(ENETRESET, "Network dropped connection on reset");
#endif
#ifdef ECONNABORTED
  X(ECONNABORTED, "Software caused connection abort");
#endif
#ifdef ECONNRESET
  X(ECONNRESET, "Connection reset by peer");
#endif
#ifdef ENOBUFS
  X(ENOBUFS, "No buffer space available");
#endif
#ifdef EISCONN
  X(EISCONN, "Transport endpoint is already connected");
#endif
#ifdef ENOTCONN
  X(ENOTCONN, "Transport endpoint is not connected");
#endif
#ifdef ESHUTDOWN
  X(ESHUTDOWN, "Cannot send after transport endpoint shutdown");
#endif
#ifdef ETOOMANYREFS
  X(ETOOMANYREFS, "Too many references: cannot splice");
#endif
#ifdef ETIMEDOUT
  X(ETIMEDOUT, "Connection timed out");
#endif
#ifdef ECONNREFUSED
  X(ECONNREFUSED, "Connection refused");
#endif
#ifdef EHOSTDOWN
  X(EHOSTDOWN, "Host is down");
#endif
#ifdef EHOSTUNREACH
  X(EHOSTUNREACH, "No route to host");
#endif
#ifdef EALREADY
  X(EALREADY, "Operation already in progress");
#endif
#ifdef EINPROGRESS
  X(EINPROGRESS, "Operation now in progress");
#endif
#ifdef ESTALE
  X(ESTALE, "Stale file handle");
#endif
#ifdef EUCLEAN
  X(EUCLEAN, "Structure needs cleaning");
#endif
#ifdef ENOTNAM
  X(ENOTNAM, "Not a XENIX named type file");
#endif
#ifdef ENAVAIL
  X(ENAVAIL, "No XENIX semaphores available");
#endif
#ifdef EISNAM
  X(EISNAM, "Is a named type file");
#endif
#ifdef EREMOTEIO
  X(EREMOTEIO, "Remote I/O error");
#endif
#ifdef EDQUOT
  X(EDQUOT, "Disk quota exceeded");
#endif
#ifdef ENOMEDIUM
  X(ENOMEDIUM, "No medium found");
#endif
#ifdef EMEDIUMTYPE
  X(EMEDIUMTYPE, "Wrong medium type");
#endif
#ifdef ECANCELED
  X(ECANCELED, "Operation canceled");
#endif
#ifdef ENOKEY
  X(ENOKEY, "Required key not available");
#endif
#ifdef EKEYEXPIRED
  X(EKEYEXPIRED, "Key has expired");
#endif
#ifdef EKEYREVOKED
  X(EKEYREVOKED, "Key has been revoked");
#endif
#ifdef EKEYREJECTED
  X(EKEYREJECTED, "Key was rejected by service");
#endif
#ifdef EOWNERDEAD
  X(EOWNERDEAD, "Owner died");
#endif
#ifdef ENOTRECOVERABLE
  X(ENOTRECOVERABLE, "State not recoverable");
#endif
#ifdef ERFKILL
  X(ERFKILL, "Operation not possible due to RF-kill");
#endif
#ifdef EHWPOISON
  X(EHWPOISON, "Memory page has hardware error");
#endif
  return "unknown error";
}
