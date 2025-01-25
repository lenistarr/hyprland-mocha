#!/bin/bash
# Basic home folder setup
mkdir ~/documents ~/downloads ~/pictures ~/pictures/screenshots ~/pictures/wallpapers ~/videos
cp -r ~/config/* ~/.config/
rm -r ~/config

# Administration and customization
sudo cp -r ~/themes/* /usr/share/themes/
rm -r ~/themes
sudo cp -r ~/scripts/* /usr/local/bin/
rm -r ~/scripts
# sudo mv ~/vconsole.conf /etc/vconsole.conf
# sudo mv ~/override.conf /etc/systemd/system/getty@tty1.service.d/
# systemctl enable getty@tty1
rm vconsole.conf LICENSE README.md

# Install programs
sudo pacman -Syu
sudo pacman -S brightnessctl cliphist fastfetch ffmpegthumbnailer file-roller firefox grim gvfs htop hyprland imv keepassxc kitty mako mpv network-manager-applet nm-connection-editor nwg-look pavucontrol polkit-gnome pipewire pipewire-pulse slurp swww tela-circle-icon-theme-purple thunar thunar-archive-plugin transmission-gtk ttf-font-awesome ttf-ibm-plex tumbler waybar wireplumber wlsunset wofi xdg-desktop-portal-hyprland yt-dlp zathura zathura-pdf-poppler 
