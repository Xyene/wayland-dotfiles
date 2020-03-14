#!/bin/bash

if pidof -o %PPID -x "$0"; then
  exit 0
fi

grim -g "$(slurp -d)" - | wl-copy -t image/png

exit 0

screenshot="$(mktemp --suffix screenshot.ppm)"
grim -t ppm "${screenshot}"
feh "${screenshot}" &
feh_pid=$!

while [ -z "$(swaymsg -t get_tree | grep feh)" ]; do
  sleep 0.01
done

gm convert -crop "$(slurp -d | perl -ne '/(\d+),(\d+) (.+)/;print"$3+$1+$2"')" "${screenshot}" png:- | wl-copy -t image/png
kill -SIGKILL ${feh_pid}
rm "${screenshot}"
