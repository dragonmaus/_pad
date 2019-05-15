#ifdef WIN32
#define WINVER _WIN32_WINNT_WIN7
#include <windows.h>
#else
#include <limits.h>
#include <stdlib.h>
#include "str.h"
#endif
#include "path.h"

  int
path_canonicalize(int size, char *path, int bufsize)
{
#ifdef WIN32
  wchar_t wpath[bufsize];
  DWORD wsize;
  HANDLE file;
  int i, j;

  wsize = MultiByteToWideChar(CP_ACP, 0, path, size, wpath, bufsize);
  if (wsize == 0) return -1;
  wpath[wsize] = 0;

  file = CreateFileW(wpath,
                     0,
                     FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
                     NULL,
                     OPEN_EXISTING,
                     FILE_FLAG_BACKUP_SEMANTICS,
                     NULL);
  if (file == INVALID_HANDLE_VALUE) return -3;

  wsize = GetFinalPathNameByHandleW(file, wpath, bufsize, VOLUME_NAME_DOS);
  if (wsize == -1) return -4;
  wpath[wsize] = 0;

  size = WideCharToMultiByte(CP_ACP, 0, wpath, wsize, path, 4096, NULL, NULL);
  if (!size) return -5;

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
#else
  char real[PATH_MAX];

  if (!realpath(path, real)) return -1;

  size = str_len(real);
  if (size > bufsize) return -2;
  str_copy(path, real);
#endif

  return size;
}
