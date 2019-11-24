#!/bin/sh
log=$HOME/log/freedns.log
url=$(cat $HOME/etc/secret/freedns.uri)
sleep 12
curl -s $url | grep -v '^No IP change detected for .*, skipping update$' >>$log || :
