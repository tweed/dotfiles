#!/usr/bin/env sh
#
# pbrisbin 2013 - perform a backup via tarsnap.
#
###
die() { printf "%s\n" "$*" >&2; exit 1; }

[ $UID -eq 0 ] || die 'You must be root'
which tarsnap >/dev/null || die 'You must install tarsnap'

timestamp=$(date +%Y%m%d.%H:%M:%S)

/home/patrick/.bin/gensetup > /root/setup

tarsnap "$@" \
  --keyfile /root/tarsnap.key \
  --cachedir /usr/local/tarsnap-cache \
  -c -f backup-$timestamp /home/patrick /root /etc
