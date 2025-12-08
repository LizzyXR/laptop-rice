#!/usr/bin/env bash

set -euo pipefail

echo "Installing required packages..."
sudo pacman -S --needed niri waybar mako fuzzel fastfetch swaylock swayidle

echo "Performing magic..."
mkdir -p "$HOME/.config"
cp -r niri "$HOME/.config/"
cp -r waybar "$HOME/.config/"
cp -r mako "$HOME/.config/"
cp -r fuzzel "$HOME/.config/"
cp -r fastfetch "$HOME/.config/"

echo "Done! :D"
