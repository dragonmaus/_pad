print ">> Updating packages"
(
	getversions() {
		for package
		do
			xbps-uhelper version "$package"
		done
	}
	while :
	do
		pre="$( getversions libxbps xbps )"
		sudo xbps-install -u
		post="$( getversions libxbps xbps )"
		[[ "$pre" == "$post" ]] && break
	done
)
