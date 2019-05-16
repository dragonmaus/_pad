#ifndef STR_H
#define STR_H

extern unsigned int str_copy(char *, const char *);
extern int str_diff(const char *, const char *);
extern unsigned int str_len(const char *);

#define str_equal(s,t) (!str_diff((s),(t)))

#endif
