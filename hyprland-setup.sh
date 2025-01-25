#!/bin/bash
# Basic setup and permissions
sudo pacman -Syu
sudo pacman -S git
git clone https://github.com/lenistarr/hyprland-mocha.git
cp ~/hyprland-mocha/.bash_profile ~/
cp ~/hyprland-mocha/.bashrc ~/
chmod +x ~/hyprland-mocha/scripts/*
chmod +x ~/hyprland-mocha/.config/hypr/xdg-portal-hyprland

# Home folder setup
mkdir ~/documents ~/downloads ~/pictures ~/pictures/screenshots ~/pictures/wallpapers ~/videos
mv ~/hyprland-mocha/.config ~/

# Copy program and theme
sudo cp -r ~/hyprland-mocha/themes/* /usr/share/themes/
sudo cp -r ~/hyprland-mocha/scripts/* /usr/local/bin/
# sudo mv ~/hyprland-mocha/vconsole.conf /etc/vconsole.conf
# sudo mkdir /etc/systemd/system/getty@tty1.service.d
# sudo mv ~/hyprland-mocha/override.conf /etc/systemd/system/getty@tty1.service.d/
# sudo systemctl enable getty@tty1
sudo rm -r hyprland-mocha

# Install programs
sudo pacman -Syu
sudo pacman -S brightnessctl cliphist fastfetch ffmpegthumbnailer file-roller firefox grim gvfs htop hyprland imv keepassxc kitty mako mpv network-manager-applet nm-connection-editor nwg-look pavucontrol polkit-gnome pipewire pipewire-pulse slurp swww tela-circle-icon-theme-purple thunar thunar-archive-plugin transmission-gtk ttf-font-awesome ttf-ibm-plex tumbler waybar wireplumber wlsunset wofi xdg-desktop-portal-hyprland yt-dlp zathura zathura-pdf-poppler
