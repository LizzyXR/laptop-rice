#!/bin/bash
CHOICE=$(printf "Suspend\nHibernate\nShutdown\nReboot" | fuzzel --dmenu --prompt "Power:")

case $CHOICE in
    Suspend) systemctl suspend ;;
    Hibernate) systemctl hibernate ;;
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
esac
