#ifdef WIN32
#include "path.h"

  int
path_fix(char *path)
{
  register char *p;
  register char *q;
  int size;
  int i, j;

  p = q = path;
  size = str_len(path);
  /* "\\?\S:\ome\Local\Path" => "S:\ome\Local\Path" */
  if (str_start(p, "\\\\?\\")) {
    p += 4;
    /* "\\?\UNC\Some\Network\Path" => "\\Some\Network\Path" */
    if (str_start(p, "UNC\\")) {
      p += 4;
      q += 2;
    }

    for (;;) {
      if (!(*q = *p)) break; ++p; ++q;
      if (!(*q = *p)) break; ++p; ++q;
      if (!(*q = *p)) break; ++p; ++q;
      if (!(*q = *p)) break; ++p; ++q;
    }

    size = q - path;
  }

  /* "S:\ome\Path\" => "S:\ome\Path", "S:\" => "S:\" */
  if (path[size - 1] == '\\' && size > 3) path[--size] = 0;

  return size;
}
#endif
