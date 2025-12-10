#!/usr/bin/env bash

set -euo pipefail

if command -v pacman >/dev/null 2>&1; then
    echo "Installing required packages..."
    sudo pacman -S --needed --noconfirm niri waybar mako fuzzel fastfetch swaylock swayidle calcurse gammastep rust libpipewire pkgconf clang
    cargo install wiremix
    
    echo "Performing magic..."
    mkdir -p "$HOME/.config"
    cp -r niri "$HOME/.config/"
    cp -r waybar "$HOME/.config/"
    cp -r mako "$HOME/.config/"
    cp -r fuzzel "$HOME/.config/"
    cp -r fastfetch "$HOME/.config/"
    
    echo "Don't forget to apply the appropriate permissions for waybar!"
    
    read -p "Done! Reboot? [Y/n]: " answer
    answer=${answer:-Y}
    case "$answer" in
        [Yy]* ) systemctl reboot;;
        [Nn]* ) echo "No"; exit 0;;
    esac
else
    echo "This rice is unfortunately only available for Arch based systems :("
    exit 1
fi
