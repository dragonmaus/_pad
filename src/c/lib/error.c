/* automatically generated */
#define RC_INVOKED /* we only want the E macros */
#include <errno.h>
#undef RC_INVOKED
#include "error.h"

int errno;

int error_perm =
#ifdef EPERM
EPERM;
#else
-1;
#endif

int error_noent =
#ifdef ENOENT
ENOENT;
#else
-2;
#endif

int error_intr =
#ifdef EINTR
EINTR;
#else
-3;
#endif

int error_io =
#ifdef EIO
EIO;
#else
-4;
#endif

int error_nodevice =
#ifdef ENXIO
ENXIO;
#else
-5;
#endif

int error_again =
#ifdef EAGAIN
EAGAIN;
#else
-6;
#endif

int error_wouldblock =
#ifdef EWOULDBLOCK
EWOULDBLOCK;
#else
-7;
#endif

int error_nomem =
#ifdef ENOMEM
ENOMEM;
#else
-8;
#endif

int error_acces =
#ifdef EACCES
EACCES;
#else
-9;
#endif

int error_exist =
#ifdef EEXIST
EEXIST;
#else
-10;
#endif

int error_notdir =
#ifdef ENOTDIR
ENOTDIR;
#else
-11;
#endif

int error_isdir =
#ifdef EISDIR
EISDIR;
#else
-12;
#endif

int error_txtbsy =
#ifdef ETXTBSY
ETXTBSY;
#else
-13;
#endif

int error_pipe =
#ifdef EPIPE
EPIPE;
#else
-14;
#endif

int error_proto =
#ifdef EPROTO
EPROTO;
#else
-15;
#endif

int error_timeout =
#ifdef ETIMEDOUT
ETIMEDOUT;
#else
-16;
#endif

int error_connrefused =
#ifdef ECONNREFUSED
ECONNREFUSED;
#else
-17;
#endif

int error_inprogress =
#ifdef EINPROGRESS
EINPROGRESS;
#else
-18;
#endif
