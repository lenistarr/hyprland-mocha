#!/bin/bash
# Basic setup and permissions
sudo pacman -Syu
sudo pacman -S git
git clone https://github.com/lenistarr/hyprland-mocha.git
mv ~/hyprland-mocha/.bash_profile ~/
mv ~/hyprland-mocha/.bashrc ~/
chmod +x ~/hyprland-mocha/.local/bin/*
chmod +x ~/hyprland-mocha/.config/hypr/xdg-portal-hyprland

# Home folder setup
mv ~/hyprland-mocha/pictures ~/
mkdir ~/documents ~/downloads ~/music ~/pictures/screenshots ~/videos
mv ~/hyprland-mocha/.config ~/
mv ~/hyprland-mocha/.local/share/applications ~/.local/share/
mv ~/hyprland-mocha/.local/bin ~/.local/
mv ~/hyprland-mocha/.themes ~/
mv ~/.config/hypr/hyprland-nvidia.conf ~/.config/hypr/hyprland.conf

# Disable username on tty
sudo mkdir /etc/systemd/system/getty@tty1.service.d
sudo mv ~/hyprland-mocha/override.conf /etc/systemd/system/getty@tty1.service.d/
sudo systemctl enable getty@tty1

# Install programs
sudo pacman -Syu
sudo pacman -S linux-headers brightnessctl cliphist egl-wayland fastfetch ffmpegthumbnailer file-roller firefox grim gvfs htop hyprland imv keepassxc kitty libva-nvidia-driver mako mpv network-manager-applet nm-connection-editor nvidia-open-dkms nvidia-utils nwg-look pavucontrol polkit-gnome pipewire pipewire-pulse slurp swww tela-circle-icon-theme-purple thunar thunar-archive-plugin thunderbird transmission-gtk ttf-ibm-plex ttf-font-awesome tumbler waybar wireplumber wlsunset wofi xdg-desktop-portal-hyprland yt-dlp zathura zathura-pdf-poppler

# Script self delete
sudo rm -r hyprland-mocha
rm $0
