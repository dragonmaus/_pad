#ifdef WIN32
#define WINVER _WIN32_WINNT_WIN7
#include <windows.h>
#else
#include <unistd.h>
#endif
#include "path.h"
#include "str.h"

#ifndef WIN32
  unsigned int
next(char *elem, char *path)
{
  int i, j;

  i = str_find(path, '/');
  path[i] = 0;
  j = str_copy(elem, path);
  return j+1;
}
#endif

  int
path_absolute(char *path, int bufsize)
{
  int size;

  size = str_len(path);
#ifdef WIN32
  if (bufsize > MAX_PATH) bufsize = MAX_PATH;

  wchar_t wpath[bufsize];
  wchar_t wfull[bufsize];
  DWORD wsize;

  wsize = MultiByteToWideChar(CP_UTF8, 0, path, size, wpath, bufsize);
  if (!wsize) return -1;
  wpath[wsize] = 0;

  wsize = GetFullPathNameW(wpath, bufsize, wfull, NULL);
  if (!wsize) return -1;
  wfull[wsize] = 0;

  size = WideCharToMultiByte(CP_UTF8, 0, wfull, wsize, path, bufsize, NULL, NULL);
  if (!size) return -1;
  path[size] = 0;

  return path_fix(path);
#else
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
      f = full + str_rfind(full, '/');
      *f = 0;
      continue;
    }
    f += str_copy(f, "/");
    f += str_copy(f, elem);
  }

  if (f == full) str_copy(f, "/");

  return str_copy(path, full);
#endif
}
