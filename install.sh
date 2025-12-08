#!/usr/bin/env bash

set -euo pipefail

echo "Installing required packages..."
sudo pacman -S --needed niri waybar mako fuzzel fastfetch swaylock swayidle

echo "Cloning repo..."
TMPDIR=$(mktemp -d)
git clone https://github.com/LizzyXR/laptop-rice.git "$TMPDIR"

echo "Performing magic..."
mkdir -p "$HOME/.config"
cp -r "$TMPDIR"/niri "$HOME/.config/"
cp -r "$TMPDIR"/waybar "$HOME/.config/"
cp -r "$TMPDIR"/mako "$HOME/.config/"
cp -r "$TMPDIR"/fuzzel "$HOME/.config/"
cp -r "$TMPDIR"/fastfetch "$HOME/.config/"
cp -r "$TMPDIR"/swaylock "$HOME/.config/"
cp -r "$TMPDIR"/swayidle "$HOME/.config/"

echo "Cleaning up..."
rm -rf "$TMPDIR"

echo "Done! :D"
