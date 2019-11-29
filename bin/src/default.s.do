home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

redo-ifchange "$home/inc/whichsrc.sh"
. "$home/inc/whichsrc.sh"

src="$( whichsrc "$2.s" )"
redo-ifchange "$src"
cp -p "$src" "$3"
