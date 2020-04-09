#!/bin/sh

log=~/log/freedns.log
url=$(cat ~/etc/secret/freedns.uri)

sleep 12

curl -s $url | grep -v '^No IP change detected for .*, skipping update$' >> $log || :
