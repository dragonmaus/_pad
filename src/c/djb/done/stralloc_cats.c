#include "str.h"
#include "stralloc.h"

  int
stralloc_cats(stralloc *sa, const char *s)
{
  return stralloc_catb(sa, str_len(s), s);
}
