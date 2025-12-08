#!/usr/bin/env bash

set -euo pipefail

echo "Installing required packages..."
sudo pacman -S --needed --noconfirm niri waybar mako fuzzel fastfetch swaylock swayidle rust libpipewire pkgconf clang
cargo install wiremix

echo "Performing magic..."
mkdir -p "$HOME/.config"
cp -r niri "$HOME/.config/"
cp -r waybar "$HOME/.config/"
cp -r mako "$HOME/.config/"
cp -r fuzzel "$HOME/.config/"
cp -r fastfetch "$HOME/.config/"

echo "Applying correct permissions to waybar menu's..."
chmod +x ~/.config/waybar/indicators/executable_bluetooth-manager.sh
chmod +x ~/.config/waybar/indicators/executable_bluetooth-toggle.sh
chmod +x ~/.config/waybar/indicators/executable_power-profiles.sh
chmod +x ~/.config/waybar/indicators/executable_screen-recording.sh

read -p "Done! Reboot? [Y/n]: " answer
answer=${answer:-Y}
case "$answer" in
    [Yy]* ) systemctl reboot;;
    [Nn]* ) echo "No"; exit 0;;
esac
