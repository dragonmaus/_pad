#!/bin/sh

dir="$HOME/bin/wine"
mkdir -p "$dir"

while IFS=, read -r n d e
do
	p="$( winepath -u "$d\\$e" )"

	if [[ -e "$p" ]]
	then
		rm -f "$dir/$n.new"
		printf "#!/bin/sh\\nexec wine start /d '%s' '%s' \"\$@\"\\n" "$d" "$d\\$e" > "$dir/$n.new"
		chmod +x-w "$dir/$n.new"
		cmp -s "$dir/$n" "$dir/$n.new" || mv -f "$dir/$n.new" "$dir/$n"
		rm -f "$dir/$n.new"
	else
		rm -f "$dir/$n"
	fi
done < "${0%.sh}.csv"
