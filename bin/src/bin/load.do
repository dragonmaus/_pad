redo-ifchange compile.wrapper compile.binary compile.specs
wrapper="$( head -1 < compile.wrapper )"
binary="$( head -1 < compile.binary )"
specs="$( head -1 < compile.specs )"

redo-ifchange preamble.sh load.format "$wrapper" "$binary" "$specs"
( cat preamble.sh; printf "$( cat load.format )" "$wrapper" ) > "$3"
chmod +x-w "$3"
