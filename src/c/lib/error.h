/* automatically generated */
#ifndef ERROR_H
#define ERROR_H

#ifndef errno
# ifdef WIN32
extern int *_errno(void);
#define errno (*_errno())
#else
extern int *__errno_location(void);
#define errno (*__errno_location())
#endif
#endif

extern int error_perm;
extern int error_noent;
extern int error_intr;
extern int error_nomem;
extern int error_acces;
extern int error_isdir;
extern int error_inval;

extern const char * error_str(int);
extern unsigned int error_temp(int);

#endif
