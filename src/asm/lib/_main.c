extern int main(int, const char **, const char **);
/* warning: this is a hack until I figure out how to add this functionality to _start */
int _main(int argc, const char **argv) { return main(argc, argv, argv + argc + 1); }
