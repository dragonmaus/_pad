#!/bin/sh

force=0
case "$1" in
(-f)
  force=1
  ;;
esac

L=~/log/sv
R=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/runit
S=~/etc/sv

for d in $(ls $S)
do
  [[ -d $S/$d ]] || continue
  [[ -h $S/$d ]] && continue

  grep -Fqx 'exec 2>&1' $S/$d/run || sed -i -e '1 a \' -e 'exec 2>&1' $S/$d/run

  [[ $force -eq 1 ]] && rm -fr $S/$d/log

  [[ -x $S/$d/log/run ]] && continue

  mkdir -p $S/$d/log

  cat > $S/$d/log/run << END
#!/bin/sh
logdir=${L/#"$HOME/"/"~/"}/$d
mkdir -p \$logdir
exec svlogd -ttt \$logdir
END
  chmod +x $S/$d/log/run

  ln -fns $R/supervise.$d.log $S/$d/log/supervise

  echo Added logging to $d 1>&2
done
