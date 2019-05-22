#include "path.h"
#include "str.h"

#ifdef WIN32
#define SEP '\\'
#else
#define SEP '/'
#endif

  const char *
path_base(const char *path)
{
  int i;

  i = str_findr(path, SEP);
  if (i >= str_len(path)) return path;
  return path + i;
}