redo-ifchange gcc.binary

redo-always

realpath "$( which musl-gcc )" > "$3"
redo-stamp < "$3"
