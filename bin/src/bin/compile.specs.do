redo-always

redo-ifchange compile.wrapper
wrapper="$( head -1 < compile.wrapper )"
sed -En 's/^.* -specs "(.*)".*$/\1/p' < "$wrapper" > "$3"
redo-stamp < "$3"
