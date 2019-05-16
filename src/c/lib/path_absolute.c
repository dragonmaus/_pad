#ifdef WIN32
#define WINVER _WIN32_WINNT_WIN7
#include <windows.h>
#else
#include <stdio.h>
#include "unix.h"
#endif
#include "path.h"
#include "str.h"

#ifndef WIN32
  unsigned int
get_element(char *el, char *path)
{
  char *e = el;
  char *p = path;
  char n = 0;

  for (;;) {
    if (!*p) return n; if (*p == '/') { *e = 0; return ++n; }; *e++ = *p++; ++n;
    if (!*p) return n; if (*p == '/') { *e = 0; return ++n; }; *e++ = *p++; ++n;
    if (!*p) return n; if (*p == '/') { *e = 0; return ++n; }; *e++ = *p++; ++n;
    if (!*p) return n; if (*p == '/') { *e = 0; return ++n; }; *e++ = *p++; ++n;
  }
}
#endif

  int
path_absolute(int size, char *path, int bufsize)
{
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

  size = path_fix(size, path);
#else
  printf("  a.path (%d) = '%s'\n", size, path);
  char full[bufsize];
  char *f = full;
  char *p = path;
  char el[bufsize];

  if (*path != '/') {
    if (!getcwd(full, bufsize)) return -1;
    f += str_len(full);
  }


  for (;;) {
    if (!*p) break;
    p += get_element(el, p);
    if (!*el) continue;
    if (str_equal(".", el)) continue;
    if (str_equal("..", el)) {
      while (f > full + 1 && *f != '/') --f;
      *f = 0;
      continue;
    }
    f += str_copy(f, "/");
    f += str_copy(f, el);
    *f = 0;
  }
  *f = 0;

  size = str_copy(path, full);
#endif

  return size;
}
