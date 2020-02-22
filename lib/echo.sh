case "$KSH_VERSION" in
(*MIRBSD\ KSH*|*LEGACY\ KSH*|*PD\ KSH*)
  echo() {
    print -R "$@"
  }
  ;;
(*)
  echo() {
    if [[ "$1" = -n ]]
    then
      shift
      printf '%s' "$*"
    else
      printf '%s\n' "$*"
    fi
  }
  ;;
esac

warn() {
  echo "$@" 1>&2
}

die() {
  e="$1"
  shift 1
  warn "$@"
  exit "$e"
}
