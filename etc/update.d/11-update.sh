libxbps_version=$(xbps-uhelper version libxbps)
xbps_version=$(xbps-uhelper version xbps)

sudo xbps-install -u

if [[ $(xbps-uhelper version libxbps) != $libxbps_version || $(xbps-uhelper version xbps) != $xbps_version ]]
then
	# XBPS was updated, restart update script
	exec "$0" "$@"
fi
