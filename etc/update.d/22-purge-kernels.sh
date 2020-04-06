echo '>> Purging old kernels'
list=$(vkpurge list | sed '$d')
[[ -z "$list" ]] || doas vkpurge rm $list
