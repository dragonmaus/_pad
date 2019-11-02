#!/bin/sh

dir="$HOME/bin/wine"

[[ "$0" -ot "$dir" ]] && exit 0

rm -fr "$dir"
mkdir -p "$dir"

while IFS=, read -r n d p
do
	case "$n" in
	(\#*) continue ;;
	esac
	printf "#!/bin/sh\\nexec wine start /d '%s' '%s' \${1+\"\$@\"}\\n" "$d" "$p" > "$dir/$n"
	chmod +x "$dir/$n"
done <<'END'
#caesar-2,C:\GOG Games\Caesar II,C:\GOG Games\Caesar II\Launch Caesar II.lnk
#caesar-3,C:\GOG Games\Caesar 3,C:\GOG Games\Caesar 3\Launch Caesar 3.lnk
#cossacks-1.1-european-wars,C:\GOG Games\Cossacks - European Wars,C:\GOG Games\Cossacks - European Wars\Launch Cossacks - European Wars.lnk
#cossacks-1.2-art-of-war,C:\GOG Games\Cossacks - Art Of War,C:\GOG Games\Cossacks - Art Of War\Launch Cossacks - Art Of War.lnk
#cossacks-1.3-back-to-war,C:\GOG Games\Cossacks - Back To War,C:\GOG Games\Cossacks - Back To War\Launch Cossacks - Back To War.lnk
#cossacks-2.1-napoleonic-wars,C:\GOG Games\Cossacks II - Napoleonic Wars,C:\GOG Games\Cossacks II - Napoleonic Wars\Launch Cossacks II - Napoleonic Wars.lnk
#cossacks-2.2-battle-for-europe,C:\GOG Games\Cossacks II - Battle for Europe,C:\GOG Games\Cossacks II - Battle for Europe\Launch Cossacks II - Battle for Europe.lnk
#creeper-world-1,C:\Program Files\KnuckleCracker\Creeper World Anniversary Edition,C:\Program Files\KnuckleCracker\Creeper World Anniversary Edition\CreeperWorld.exe
creeper-world-2,C:\Program Files\KnuckleCracker\Creeper World 2 Anniversary Edition,C:\Program Files\KnuckleCracker\Creeper World 2 Anniversary Edition\CreeperWorld2.exe
#emperor,C:\GOG Games\Emperor - Rise of the Middle Kingdom,C:\GOG Games\Emperor - Rise of the Middle Kingdom\Launch Emperor - Rise of the Middle Kingdom.lnk
#empire-earth-gold,C:\GOG Games\Empire Earth Gold,C:\GOG Games\Empire Earth Gold\Launch Empire Earth Gold.lnk
#rollercoaster-tycoon,C:\GOG Games\RollerCoaster Tycoon Deluxe,C:\GOG Games\RollerCoaster Tycoon Deluxe\Launch RollerCoaster Tycoon Deluxe.lnk
#total-annihilation,C:\GOG Games\Total Annihilation,C:\GOG Games\Total Annihilation\TotalA.exe
#total-annihilation-devolution,C:\GOG Games\Total Annihilation\TA Devolution,C:\GOG Games\Total Annihilation\TA Devolution\TotalA.exe
#total-annihilation-escalation,C:\GOG Games\Total Annihilation\TA Escalation,C:\GOG Games\Total Annihilation\TA Escalation\TotalA.exe
#total-annihilation-mayhem,C:\GOG Games\Total Annihilation\Total Mayhem,C:\GOG Games\Total Annihilation\Total Mayhem\TotalA.exe
#total-annihilation-zero,C:\GOG Games\Total Annihilation\TA Zero,C:\GOG Games\Total Annihilation\TA Zero\TotalA.exe
END
