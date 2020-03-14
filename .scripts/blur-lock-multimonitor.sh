#!/bin/bash

lock_args=""

for output in `swaymsg -t get_outputs | jq -r '.[].name'`
do
    image=/tmp/$output-lock.ppm
    grim -o $output $image -t ppm
    gm convert $image -resize 20% -blur 0x2 $image

    if [[ "${output}" == "HDMI-A-1" ]]; then
      gm composite -matte -gravity SouthWest -resize 50% /opt/lockscreen/senko.png -resize 500% $image $image
    fi

    lock_args="${lock_args} --image ${output}:${image}"
    images="${images} ${image}"
done

swaylock --text-color=ffffff00 --inside-color=ffffff1c --ring-color=ffffff3e --line-color=ffffff00 --key-hl-color=00000080 --ring-ver-color=00000000 --inside-ver-color=0000001c --ring-wrong-color=00000055 --inside-wrong-color=0000001c $lock_args

rm $images
