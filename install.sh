#!/usr/bin/env bash

set -euo pipefail

if command -v pacman >/dev/null 2>&1; then
    echo "Installing required packages..."
# install yay
    cd "$HOME"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
    cd "$HOME/laptop-rice"
    
    sudo pacman -S --needed --noconfirm niri waybar mako fuzzel fastfetch swaylock swayidle swww thunar htop calcurse networkmanager gammastep rust libpipewire pkgconf clang gnu-free-fonts noto-fonts
    yay -S ttf-noto-sans-mono-vf
    cargo install wiremix

    sudo systemctl enable --now NetworkManager
    
    echo "Performing magic..."
    mkdir -p "$HOME/.config"
    cp -r niri "$HOME/.config/"
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
