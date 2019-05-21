#include "alloc.h"
#include "env.h"
#include "str.h"

  int
env_init(void)
{
  char **newenviron;
  int i;

  for (en = 0; environ[en]; ++en) ;
  ea = en + 10;
  newenviron = (char **) alloc((ea + 1) * sizeof(char *));
  if (!newenviron) return 0;
  for (en = 0; environ[en]; ++en) {
    newenviron[en] = alloc(str_len(environ[en]) + 1);
    if (!newenviron[en]) {
      for (i = 0; i < en; ++i) alloc_free(newenviron[i]);
      alloc_free(newenviron);
      return 0;
    }
    str_copy(newenviron[en], environ[en]);
  }
  new_environ[en] = 0;
  environ = newenviron;
  env_isinit = 1;
  return 1;
}
