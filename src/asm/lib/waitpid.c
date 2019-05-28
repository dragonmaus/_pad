#include <sys.h>

  int
waitpid(int pid, int *status, int options)
{
  return wait4(pid, status, options, 0);
}
