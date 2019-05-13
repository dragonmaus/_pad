_cd() {
  PWD=$(env - "PATH=$PATH" pwd)
}
cd() {
  command cd "$@" && _cd
}
