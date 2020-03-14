#!/bin/sh
count=`ps aux | grep -c firefox`

if [ ! ps aux | grep -c firefox ]; then
    firefox
fi

xdg-open "https://google.com"
i3-msg "[class=Firefox] focus"

