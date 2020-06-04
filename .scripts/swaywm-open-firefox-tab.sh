#!/bin/bash
if ! pgrep firefox; then
  firefox &
else
  xdg-open "about:newtab"
  swaymsg "[app_id=firefox] focus"
fi

