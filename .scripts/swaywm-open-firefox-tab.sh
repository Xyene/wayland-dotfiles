#!/bin/bash
export MOZ_ENABLE_WAYLAND=1

if ! pgrep firefox; then
  firefox &
else
  xdg-open "about:newtab"
  swaymsg "[app_id=firefox] focus"
fi

