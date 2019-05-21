#include "alloc.h"
#include "env.h"
#include "str.h"

int env_isinit = 0; /* if env_isinit: */
static int ea; /* environ is a pointer to ea+1 char*'s. */
static int en; /* the first en of those are ALLOCATED. environ[en] is 0. */

static char *null = 0;

  static void
env_goodbye(int i)
{
  alloc_free(environ[i]);
  environ[i] = environ[--en];
  environ[en] = 0;
}

  void
env_clear(void)
{
  if (env_isinit) while (en) env_goodbye(0);
  else environ = &null;
}

  static void
env_unsetlen(const char *s, int len)
{
  int i;

  for (i = en - 1; i >= 0; --i) if (!str_diffn(s, environ[i], len) && environ[i][len] == '=') env_goodbye(i);
}

  static int
env_add(const char *s)
{
  char *t;

  t = env_findeq(s);
  if (t) env_unsetlen(s, t - s);
  if (en == ea) {
    ea += 30;
    if (!alloc_re(&environ, (en + 1) * sizeof(char *), (ea + 1) * sizeof(char *))) {
      ea = n;
      return 0;
    }
  }
  environ[en++] = s;
  environ[en] = 0;
  return 1;
}

  int
env_put(const char *s)
{
  char *u;

  if (!env_isinit && !env_init()) return 0;
  u = alloc(str_len(s) + 1);
  if (!u) return 0;
  str_copy(u, s);
  if (!env_add(u)) {
    alloc_free(u);
    return 0;
  }
  return 1;
}

  int
env_put2(const char *s, const char *t)
{
  char *u;
  int slen;

  if (!env_isinit && !env_init()) return 0;
  slen = str_len(s);
  u = alloc(slen + str_len(t) + 2);
  if (!u) return 0;
  str_copy(u, s);
  u[slen] = '=';
  str_copy(u + slen + 1, t);
  if (!env_add(u)) {
    alloc_free(u);
    return 0;
  }
  return 1;
}

  int
env_unset(const char *s)
{
  if (!env_isinit && !env_init()) return 0;
  env_unsetlen(s, str_len(s));
  return 1;
}
