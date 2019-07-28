(
	linux_version1=$(xbps-uhelper version linux)
	kernel_version1=$(xbps-uhelper version linux${linux_version1%_*})
	libxbps_version=
	xbps_version=

	while [[ $(xbps-uhelper version libxbps) != $libxbps_version || $(xbps-uhelper version xbps) != $xbps_version ]]
	do
		sudo xbps-install -u

		libxbps_version=$(xbps-uhelper version libxbps)
		xbps_version=$(xbps-uhelper version xbps)
	done

	linux_version2=$(xbps-uhelper version linux)
	kernel_version2=$(xbps-uhelper version linux${linux_version2%_*})

	if [[ $linux_version1 != $linux_version2 || $kernel_version1 != $kernel_version2 ]]
	then
		sudo vkpurge rm all
	fi
)
