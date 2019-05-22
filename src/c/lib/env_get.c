#include "env.h"

#ifdef WIN32
#include "case.h"

#define start(s,t) case_starts((s), (t))
#else
#include "str.h"

#define start(s,t) str_start((s), (t))
#endif

  const char *
env_get(const char *s)
{
  int i;
  unsigned int len;

  if (!s) return 0;
  len = str_len(s);
  for (i = 0; environ[i]; ++i) if (start(environ[i], s) && environ[i][len] == '=') return environ[i] + len + 1;
  return 0;
}
