#! /usr/bin/env bash

# Last-modified header missing -- time-stamps turned off.
wget_args="--recursive --timestamping"

wget $wget_args https://api.ernte-teilen.org/entries

cat api.ernte-teilen.org/entries | jq -r '.. | .link? | strings' | sort -V | uniq |
sed 's|^|https://api.ernte-teilen.org|' |
xargs wget $wget_args
