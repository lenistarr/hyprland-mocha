# Minimal Hyprland Mocha Mauve Setup
![screenshot_2025-01-25_230554](https://github.com/user-attachments/assets/5795174c-0954-41e8-839e-b3b48ff0d6bb) ![screenshot_2025-01-26_033356](https://github.com/user-attachments/assets/5b9003d1-9b0d-424a-a77e-90400656f4f2)

## Installation
```
curl -LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup.sh
chmod +x hyprland-setup.sh
sh hyprland-setup.sh
```
### Install for Nvidia GPU
Script will install nvidia-open-dkms, if you have and older GPU, change the package accordingly in the script. 
```
curl - LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup-nvidia.sh
chmod +x hyprland-setup-nvidia.sh
sh hyprland-setup-nvidia.sh
```
Edit /etc/mkinitcpio.conf. In the MODULES array, add the following module names: 

<i>MODULES=(... nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)</i>

Then, create and edit /etc/modprobe.d/nvidia.conf. Add this line to the file: 

<i>options nvidia_drm modeset=1 fbdev=1</i>

Rebuild the initramfs with: 
```
sudo mkinitcpio -P
reboot
```

## Important Notice
Work in progress. Best done on a clean install of Arch Linux. Uses master tiling layout. 

Change GTK theme manually in nwg-looks. Change Firefox theme manually in Firefox settings. Try the theme at https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-mauve-git/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search.

Wallpaper change is automatically enabled via script. If the folder is empty the script can cause high cpu usage, so do not be surprised. To disable it go to ~/.config/hypr/hyprland.conf and change:

<i>exec-once = swww-random ~/pictures/wallpapers &</i> becomes <i>exec-once = swww ~/path/to/img</i>

You can also rebind or remove the key combination that cycles wallpapers in hyprland.conf. The relevant bind is:

<i>bind = CONTROL,         P,          exec,                   swww-next-wallpaper</i>

Use the script at your own discretion.

## Other 
The keyboard layout and bindings are configured according to the German/Croatian QWERTZ layout. Change it manually in ~/.config/hypr/hyprland.conf:

<i>kb_layout = [keyboard layout]</i>

Install AUR manually.

This install has no display manager or logout functionality since I do not use them. Some non-essential hyprland features and binds are missing. 

To modify the wallpaper change time,  edit /usr/local/bin/swww-random and change seconds to next image:

<i>INTERVAL=[seconds]</i>
