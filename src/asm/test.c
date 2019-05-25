extern int write(int, const char *, unsigned int);
extern void exit(int);

_start(void)
{
  write(1, "Hello, world!\n", 14);
  exit(0);
}
