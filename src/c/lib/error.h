#ifndef ERROR_H
#define ERROR_H

extern int errno;

extern int error_noent;

extern unsigned int error_check(int);
extern const char  *error_str(int);

#endif
