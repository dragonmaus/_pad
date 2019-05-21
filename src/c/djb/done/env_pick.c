#include "env.h"

  extern const char *
env_pick(void)
{
  return environ[0];
}
