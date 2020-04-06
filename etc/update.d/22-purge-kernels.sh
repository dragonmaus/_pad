echo '>> Purging old kernels'
list=$(vkpurge list | sed '$d')
[[ -n "$list" ]] && doas vkpurge rm $list
