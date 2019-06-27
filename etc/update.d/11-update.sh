(
	libxbps_version=
	xbps_version=

	while [[ $(xbps-uhelper version libxbps) != $libxbps_version || $(xbps-uhelper version xbps) != $xbps_version ]]
	do
		sudo xbps-install -u

		libxbps_version=$(xbps-uhelper version libxbps)
		xbps_version=$(xbps-uhelper version xbps)
	done
)
