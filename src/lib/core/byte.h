#ifndef BYTE_H
#define BYTE_H

extern void         byte_copy(char *, const char *, unsigned int);
extern void         byte_copyr(char *, const char *, unsigned int);
extern int          byte_diff(const char *, unsigned int, const char *);
extern unsigned int byte_find(const char *, unsigned int, char);
extern unsigned int byte_findr(const char *, unsigned int, char);
extern void         byte_zero(char *, unsigned int);

#define byte_equal(s,n,t) (!byte_diff((s),(n),(t)))

#endif
