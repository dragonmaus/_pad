echo '>> Updating system flatpaks'
doas flatpak update
echo '>> Updating user flatpaks'
flatpak update --user
