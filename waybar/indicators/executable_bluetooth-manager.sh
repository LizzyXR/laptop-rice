#!/bin/bash

if rfkill list bluetooth | grep -q "Soft blocked: yes"; then
  rfkill unblock bluetooth
  sleep 1
fi

$TERMINAL --class=Bluetuith -e bluetuith
