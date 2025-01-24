#!/bin/bash
# Basic home folder setup
mv ~/bash_profile ~/.bash_profile && mv ~/bashrc ~/.bashrc
mkdir ~/documents ~/downloads ~/pictures ~/videos
mkdir ~/pictures/screenshots
mv ~/config/* ~/.config && rm -r ~/config

# Administration and customization
sudo mv ~/themes/* /usr/share/themes
rm -r ~/themes
sudo mv ~/scripts/* /usr/local/bin
rm -r ~/scripts
sudo mv ~/vconsole.conf /etc/vconsole.conf
sudo mv ~/override.conf /etc/systemd/system/getty@tty1.service.d/*
systemctl enable getty@tty1

# Install programs
sudo pacman -Syu
sudo pacman -S brightnessctl cliphist fastfetch ffmpegthumbnailer file-roller firefox grim gvfs htop hyprland imv keepassxc kitty mako mpv network-manager-applet nm-connection-editor nwg-look pavucontrol polkit-gnome pipewire pipewire-pulse slurp swww tela-circle-icon-theme-purple thunar thunar-archive-plugin transmission-gtk ttf-font-awesome ttf-ibm-plex waybar wireplumber wlsunset wofi xdg-desktop-portal-hyprland yt-dlp zathura zathura-pdf-poppler 

# Unmount USBs and reboot
sudo umount /dev/sd*
sync
reboot
