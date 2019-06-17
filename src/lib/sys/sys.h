#ifndef SYS_H
#define SYS_H

struct timespec {
  long int tv_sec;
  long int tv_nsec;
};

struct timeval {
  long int tv_sec;
  long int tv_usec;
};

struct rusage {
  struct timeval ru_utime;
  struct timeval ru_stime;
  long int ru_maxrss;
  long int ru_ixrss;
  long int ru_idrss;
  long int ru_isrss;
  long int ru_minflt;
  long int ru_majflt;
  long int ru_nswap;
  long int ru_inblock;
  long int ru_oublock;
  long int ru_msgsnd;
  long int ru_msgrcv;
  long int ru_nsignals;
  long int ru_nvcsw;
  long int ru_nivcsw;
};

struct stat {
  unsigned long int st_dev;
  unsigned long int st_ino;
  unsigned long int st_nlink;
  unsigned int st_mode;
  unsigned int st_uid;
  unsigned int st_gid;
  unsigned int __pad0;
  unsigned long int st_rdev;
  long int st_size;
  long int st_blksize;
  long int st_blocks;
  struct timespec st_atim;
  struct timespec st_mtim;
  struct timespec st_ctim;
  long int __unused[3];
};

extern int   read(unsigned int, char *, unsigned int);
extern int   write(unsigned int, const char *, unsigned int);
extern int   open(const char *, int, unsigned short int);
extern int   close(unsigned int);
extern int   stat(const char *, struct stat *);
extern int   fstat(unsigned int, struct stat *);
extern int   lstat(const char *, struct stat *);
extern int   brk(void *);
extern void *sbrk(long int);
extern int   fork(void);
extern int   execve(const char *, const char **, const char **);
extern void  exit(int);
extern int   wait3(int *, int, struct rusage *);
extern int   wait4(int, int *, int, struct rusage *);
extern int   waitpid(int, int *, int);
extern int   fsync(unsigned int);
extern char *getcwd(char *, unsigned int);
extern int   chdir(const char *);
extern int   readlink(const char *, char *, unsigned int);

#define O_RDONLY    000000000
#define O_WRONLY    000000001
#define O_CREAT     000000100
#define O_EXCL      000000200
#define O_NOCTTY    000000400
#define O_TRUNC     000001000
#define O_APPEND    000002000
#define O_NONBLOCK  000004000
#define O_DSYNC     000010000
#define O_ASYNC     000020000
#define O_DIRECTORY 000200000
#define O_NOFOLLOW  000400000
#define O_CLOEXEC   002000000
#define O_SYNC      004010000
#define O_PATH      010000000

#define S_IFIFO     000010000
#define S_IFCHR     000020000
#define S_IFDIR     000040000
#define S_IFBLK     000060000
#define S_IFREG     000100000
#define S_IFLNK     000120000
#define S_IFSOCK    000140000
#define S_IFMT      000170000

#define S_ISFIFO(mode) (((mode) & S_IFMT) == S_IFIFO)
#define S_ISCHR(mode)  (((mode) & S_IFMT) == S_IFCHR)
#define S_ISDIR(mode)  (((mode) & S_IFMT) == S_IFDIR)
#define S_ISBLK(mode)  (((mode) & S_IFMT) == S_IFBLK)
#define S_ISREG(mode)  (((mode) & S_IFMT) == S_IFREG)
#define S_ISLNK(mode)  (((mode) & S_IFMT) == S_IFLNK)
#define S_ISSOCK(mode) (((mode) & S_IFMT) == S_IFSOCK)

#define S_IXOTH     000000001
#define S_IWOTH     000000002
#define S_IROTH     000000004
#define S_IRWXO     000000007
#define S_IXGRP     000000010
#define S_IWGRP     000000020
#define S_IRGRP     000000040
#define S_IRWXG     000000070
#define S_IXUSR     000000100
#define S_IWUSR     000000200
#define S_IRUSR     000000400
#define S_IRWXU     000000700
#define S_ISVTX     000001000
#define S_ISGID     000002000
#define S_ISUID     000004000

#define UTIME_OMIT  0x3ffffffe
#define UTIME_NOW   0x3fffffff

#define WEXITSTATUS(s) (((s) & 0xff00) >> 8)
#define WTERMSIG(s) ((s) & 0x7f)
#define WSTOPSIG(s) WEXITSTATUS(s)
#define WCOREDUMP(s) ((s) & 0x80)
#define WIFEXITED(s) (!WTERMSIG(s))
#define WIFSTOPPED(s) ((short)((((s) & 0xffff) * 0x10001) >> 8) > 0x7f00)
#define WIFSIGNALED(s) (((s) & 0xffff) - 1U < 0xffu)
#define WIFCONTINUED(s) ((s) == 0xffff)

#endif
