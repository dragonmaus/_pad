echo '>> Purging old kernels'
(
  set -- $(vkpurge list | sed '$d')
  if [[ $# -gt 0 ]]
  then
    doas vkpurge rm "$@"
  fi
)
