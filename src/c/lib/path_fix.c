#ifdef WIN32
#include "path.h"

  int
path_fix(int size, char *path)
{
  int i, j;

  /* "\\?\S:\ome\Local\Path" => "S:\ome\Local\Path" */
  if (path[0] == '\\' && path[1] == '\\' && path[2] == '?' && path[3] == '\\') {
    i = 4;
    j = 0;
    /* "\\?\UNC\Some\Network\Path" => "\\Some\Network\Path" */
    if (path[4] == 'U' && path[5] == 'N' && path[6] == 'C' && path[7] == '\\') {
      i = 8;
      j = 2;
    }
    for (;;) {
      path[j] = path[i];
      if (i >= size || !path[i]) break;
      ++i;
      ++j;
    }
    size = j;
  }

  /* "S:\ome\Path\" => "S:\ome\Path", "S:\" => "S:\" */
  if (path[size - 1] == '\\' && size > 3) path[--size] = 0;

  return size;
}
#endif
