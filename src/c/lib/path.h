#ifndef PATH_H
#define PATH_H

extern int path_absolute(int, char *, int);
extern int path_canonical(int, char *, int);
#ifdef WIN32
extern int path_fix(int, char *);
#endif

#endif
