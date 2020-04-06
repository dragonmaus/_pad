echo '>> Updating package list'
list=~/etc/packages.list
xbps-query -m | xargs -n 1 xbps-uhelper getpkgname > $list{new}
cmp -s $list{new} $list || mv -f $list{new} $list
rm -f $list{new}
