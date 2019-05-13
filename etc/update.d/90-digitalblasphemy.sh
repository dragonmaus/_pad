(
	base=https://secure.digitalblasphemy.com/content/zips
	path=$HOME/Downloads
	while read res suf
	do
		file=$path/$res.zip
		url=$base/$res.zip
		case $(file -b --mime-type "$file") in
		(application/zip)
			;;
		(*)
			touch -r /etc/epoch "$file"
			;;
		esac
		print -r -- fetch "${file##*/}" "($url)" >&2
		pass2netrc web/com.digitalblasphemy | curl --netrc-file /dev/fd/0 --output "$file" --remote-time --time-cond "$file" --url "$url"
	done <"$HOME"/etc/wallpaper/res.list
)
