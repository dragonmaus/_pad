redo-ifchange clang.binary

redo-always

realpath "$( which musl-clang )" > "$3"
redo-stamp < "$3"
