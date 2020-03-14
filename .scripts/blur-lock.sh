#!/bin/bash

if pgrep swaylock; then
  exit 0
fi

cd /tmp
grim -t ppm lock.ppm
gm convert lock.ppm -resize 20% -blur 0x2 lock.ppm
gm composite -matte -gravity SouthWest /home/xyene/.wallpapers/senko2.png -resize 500% lock.ppm lock.ppm
swaylock -f -i lock.ppm
rm lock.ppm
