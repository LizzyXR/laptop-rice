#!/bin/bash

curret_profile=$(powerprofilesctl get)
selected_profile=$(powerprofilesctl list |
  awk '/^\s*[* ]\s*[a-zA-Z0-9\-]+:$/ { gsub(/^[*[:space:]]+|:$/,""); print }' |
  tac |
  fuzzel -d --select=$current_profile)

if [ "$curret_profile" != "$selected_profile" ]; then
  powerprofilesctl set "$selected_profile"
fi
