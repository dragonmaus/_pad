. "${XDG_CONFIG_HOME:-$HOME/.config}"/base16/current.sh

case $BASE16_SHELL_SET_BACKGROUND in
(0|[Ff][Aa][Ll][Ss][Ee]|[Nn][Oo])
	set_background=false
	;;
(*)
	set_background=true
	;;
esac

case $TERM in
(linux|linux-*)
	put_template() {
		test "$1" -lt 16 && printf '\033]P%x%s' $1 `echo $2 | tr -d /`
	}
	put_template_var() {
		true
	}
	put_template_custom() {
		true
	}
	;;
(*)
	put_template() {
		printf '\033]4;%d;rgb:%s\033\\' "$@"
	}
	put_template_var() {
		printf '\033]%d;rgb:%s\033\\' "$@"
	}
	put_template_custom() {
		printf '\033]%s%s\033\\' "$@"
	}
	;;
esac

$set_background && put_template 0 $colour_base00
put_template 1 $colour_base08
put_template 2 $colour_base0b
put_template 3 $colour_base0a
put_template 4 $colour_base0d
put_template 5 $colour_base0e
put_template 6 $colour_base0c
put_template 7 $colour_base05
put_template 8 $colour_base03
put_template 9 $colour_base08
put_template 10 $colour_base0b
put_template 11 $colour_base0a
put_template 12 $colour_base0d
put_template 13 $colour_base0e
put_template 14 $colour_base0c
put_template 15 $colour_base07
# 256 color space
put_template 16 $colour_base09
put_template 17 $colour_base0f
put_template 18 $colour_base01
put_template 19 $colour_base02
put_template 20 $colour_base04
put_template 21 $colour_base06
# foreground / background / cursor color
put_template_var 10 $colour_base05
$set_background && put_template_var 11 $colour_base00
put_template_custom 12 ';7'
