#include <sys.h>
#include "error.h"
#include "path.h"
#include "str.h"

  unsigned int
next(char *elem, char *path)
{
  int i, j;

  i = str_find(path, '/');
  path[i] = 0;
  j = str_copy(elem, path);
  return j+1;
}

  int
path_absolute(char *path, int bufsize)
{
  int size;

  if (!*path) {
    errno = error_inval;
    return -1;
  }

  size = str_len(path);
  char elem[bufsize];
  char full[bufsize];
  register char *f;
  register char *p;

  f = full;
  p = path;
  if (*p != '/') {
    if (!getcwd(f, bufsize)) return -1;
    f += str_len(f);
    if (*(f - 1) == '/') --f;
  }

  while ((p - path) < size && *p) {
    p += next(elem, p);
    if (!*elem || str_equal(".", elem)) continue;
    if (str_equal("..", elem)) {
      f = full + str_findr(full, '/');
      *f = 0;
      continue;
    }
    f += str_copy(f, "/");
    f += str_copy(f, elem);
  }

  if (f == full) str_copy(f, "/");

  return str_copy(path, full);
}
