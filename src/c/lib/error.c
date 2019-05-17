#include <errno.h>
#include "error.h"

/* TODO: as coverage improves here, update error_{str,temp} */

int error_noent =
#ifdef ENOENT
ENOENT;
#else
-1;
#endif
