extern int main(int, const char **, const char **);

extern char **environ;
extern int    errno;

char **environ;
int    errno;

/* warning: this is a hack until I figure out how to add this functionality to _start */
  int
_main(int argc, const char **argv)
{
  environ = (char **)(argv + argc + 1);
  errno = 0;
  return main(argc, argv, environ);
}
