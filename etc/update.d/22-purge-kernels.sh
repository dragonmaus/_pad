print ">> Purging old kernels"
(
	set -- $(vkpurge list | sed '$d')
	if [[ $# -gt 0 ]]
	then
		sudo vkpurge rm "$@"
	fi
)
