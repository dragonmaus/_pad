#ifdef WIN32
#define WINVER _WIN32_WINNT_WIN7
#include <windows.h>
#else
#include <errno.h>
#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include "unix.h"
#endif
#include "path.h"
#include "str.h"

  int
path_canonical(int size, char *path, int bufsize)
{
#ifdef WIN32
  wchar_t wpath[bufsize];
  DWORD wsize;
  HANDLE file;
  int i, j;

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
    size = WideCharToMultiByte(CP_UTF8, 0, wpath, wsize, path, bufsize, NULL, NULL);
    if (!size || path[size-1] == '\\') return -1; // reached root with no resolution
    path[size] = 0;

    /* search backwards from the end for the last path separator */
    i = size - 1;
    for (;;) {
      if (i < 0) return -1;
      if (path[i] == '\\') break;
      --i;
    }
    if (i > 3)
      path[i] = 0;
    else
      path[++i] = 0;

    /* save the last path element for later */
    char tail[size-i];
    str_copy(tail, path+1+i);

    /* canonicalize the parent */
    size = path_canonical(i, path, bufsize);
    if (size == -1) return -1;

    /* re-append the last path element */
    path[size++] = '\\';
    size += str_copy(path + size, tail);

    return size;
  }

  wsize = GetFinalPathNameByHandleW(file, wpath, bufsize, VOLUME_NAME_DOS);
  if (wsize == -1) return -1;
  wpath[wsize] = 0;

  size = WideCharToMultiByte(CP_UTF8, 0, wpath, wsize, path, bufsize, NULL, NULL);
  if (!size) return -1;
  path[size] = 0;

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
#else
  char real[bufsize];
  int i, j;

  /* make path absolute */
  if (*path != '/') {
    if (!getcwd(real, bufsize)) return -1;
    size = str_len(real);
    real[size++] = '/';
    size += str_copy(real + size, path);
    size = str_copy(path, real);
    *real = 0;
  }

  printf("  c.path (%d) = '%s'\n", size, path);

  if (!realpath(path, real)) {
    if (errno != ENOENT) return -1;
    size = str_copy(real, path);
    if (size == 1) return -1; // reached root with no resolution

    /* search backwards from the end for the last path separator */
    i = size - 1;
    for (;;) {
      if (i < 0) return -1;
      if (real[i] == '/') break;
      --i;
    }

    real[i] = 0;
    if (!i) i = str_copy(real, "/");

    /* save the last path element for later */
    char tail[size-i];
    j = str_copy(tail, real+1+i);
    printf("  c.tail (%d) = '%s'\n", j, tail);

    /* canonicalize the parent */
    size = path_canonical(i, real, bufsize);
    if (size == -1) return -1;

    /* re-append the last path element */
    real[size++] = '/';
    size += str_copy(real + size, tail);

    printf("  c.real (%d) = '%s'\n", size, real);
  }

  size = path_absolute(size, real, bufsize);
  size = str_copy(path, real);
#endif

  return size;
}
