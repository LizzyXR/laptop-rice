#!/usr/bin/env bash

set -euo pipefail

if command -v pacman >/dev/null 2>&1; then
    read -rp "Install yay? [Y/n]: " answer
    answer=${answer:-Y}
    
    case "$answer" in
        [Yy]*)
        cd "$HOME" || exit 1
        git clone https://aur.archlinux.org/yay.git
        cd yay || exit 1
        makepkg -si
        cd "$HOME" || exit 1
        rm -rf yay
        cd "$HOME/laptop-rice" || exit 1
        clear;;
    
        [Nn]*) clear;; *)
    esac

    echo "Installing required packages..."
    
    sudo pacman -S --needed --noconfirm niri waybar mako notification-daemon fuzzel fastfetch swaylock swayidle swww kitty helix thunar htop calcurse networkmanager gammastep geoclue2 rust libpipewire pkgconf clang gnu-free-fonts noto-fonts noto-fonts-emoji xcursor-vanilla-dmz
    yay -S --needed --noconfirm ttf-adwaita-mono-nerd bluetuith
    cargo install wiremix

    sudo systemctl enable --now NetworkManager.service

    clear
    
    echo "Performing magic..."
    mkdir -p "$HOME/.config"
    cp -r niri "$HOME/.config/"
    cp -r kitty "$HOME/.config"
    cp -r waybar "$HOME/.config/"
    cp -r mako "$HOME/.config/"
    cp -r fuzzel "$HOME/.config/"
    cp -r fastfetch "$HOME/.config/"
    
    echo "Applying permissions for waybar scripts..."
    chmod +x "$HOME/.config/waybar/menus/power_menu.sh"
    find "$HOME/.config/waybar" -type f -name "executable_*.sh" -exec chmod +x {} \;

    swww-daemon &
    swww img bnuuy.png
    
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
