#ifdef WIN32
#define WINVER _WIN32_WINNT_WIN7
#include <windows.h>
#else
#include <limits.h>
#include <stdlib.h>
#include <unistd.h>
#endif
#include "error.h"
#include "path.h"
#include "str.h"

  int
path_canonical(char *path, int bufsize)
{
  if (!*path) {
    errno = error_inval;
    return -1;
  }

#ifdef WIN32
  wchar_t wpath[bufsize];
  DWORD wsize;
  HANDLE file;
  int i, size;

  size = path_absolute(path, bufsize);
  if (size == -1) return -1;

  wsize = MultiByteToWideChar(CP_UTF8, 0, path, size, wpath, bufsize);
  if (!wsize) return -1;
  wpath[wsize] = 0;

  file = CreateFileW(wpath,
                     0,
                     FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
                     NULL,
                     OPEN_EXISTING,
                     FILE_FLAG_BACKUP_SEMANTICS,
                     NULL);
  /* if path does not exist, canonicalize its parent, then manually append the last element */
  /* (recursive) */
  if (file == INVALID_HANDLE_VALUE) {
    errno = error_noent;

    if (size <= 3) return -1; /* reached `X:\` or `\\` (local or network root) without resolution */

    i = str_findr(path, '\\');
    if (i >= size) return -1;

    /* save the last path element for later */
    char tail[size - i];
    str_copy(tail, path+1+i);

    if (i > 3)
      path[i] = 0;
    else
      path[i + 1] = 0;

    /* canonicalize the parent */
    size = path_canonical(path, bufsize);
    if (size == -1) return -1;

    /* re-append the last path element */
    size += str_copy(path + size, "\\");
    size += str_copy(path + size, tail);

    return size;
  }

  wsize = GetFinalPathNameByHandleW(file, wpath, bufsize, VOLUME_NAME_DOS);
  if (wsize == -1) return -1;
  wpath[wsize] = 0;

  size = WideCharToMultiByte(CP_UTF8, 0, wpath, wsize, path, bufsize, NULL, NULL);
  if (!size) return -1;
  path[size] = 0;

  return path_fix(path);
#else
  char full[bufsize];
  char real[bufsize];
  int i, size;

  /* make path absolute */
  size = 0;
  if (*path != '/') {
    if (!getcwd(full, bufsize)) return -1;
    size = str_len(full);
    if (full[size - 1] != '/') full[size++] = '/';
  }
  size += str_copy(full + size, path);

  if (!realpath(full, real)) {
    if (errno != error_noent) return -1;
    if (size == 1) return -1; // somehow `/` does not exist

    i = str_findr(full, '/');

    char tail[size - i];
    str_copy(tail, full + i + 1);

    if (i > 1)
      full[i] = 0;
    else
      full[i + 1] = 0;

    size = path_canonical(full, bufsize);
    if (size == -1) return -1;

    full[size++] = '/';
    str_copy(full + size, tail);
    path_absolute(full, bufsize);

    return str_copy(path, full);
  }

  return str_copy(path, real);
#endif
}
