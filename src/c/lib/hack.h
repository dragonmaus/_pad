#ifndef HACK_H
#define HACK_H

#ifdef WIN32
extern void hack_fixio(void);
#else
#define hack_fixio()
#endif

#endif
