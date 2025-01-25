# Install Script for Minimal Hyprland Mocha Mauve
![screenshot-2025-01-25_22:30:08](https://github.com/user-attachments/assets/a4944ed3-3d02-467e-9137-cbf4f02399bf) ![screenshot-2025-01-25_22:32:35](https://github.com/user-attachments/assets/9e25829c-361f-4e05-bfbe-4f86e29fa621) 

## Important Notice
Work in progress. Best done on a clean install of Arch Linux. Uses master tiling layout. 

Change GTK theme manually in nwg-looks. Change Firefox theme manually in Firefox settings. Try the theme at https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-mauve-git/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search.

Wallpaper change is automatically enabled via script. If the folder is empty the script can cause high cpu usage, so do not be surprised. To disable it go to ~/.config/hypr/hyprland.conf and change <i>exec-once = swww-random ~/pictures/wallpapers &</i> to <i>exec-once = swww ~/path/to/img</i>

You can also rebind or remove the key combination that cycles wallpapers in hyprland.conf. The relevant bind is <i>bind = CONTROL,         P,          exec,                   swww-next-wallpaper</i>

Use the script at your own discretion.

## Installation
```
curl -LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup.sh
chmod +x hyprland-setup.sh
sh hyprland-setup.sh
```
## Other 
The keyboard layout and bindings are configured according to the German/Croatian QWERTZ layout. Change it manually in ~/.config/hypr/hyprland.conf under <i>kb_layout = [keyboard layout]</i>.

Install Nvidia drivers manually. Install AUR manually.

This install has no display manager or logout functionality since I do not use them. Some non-essential hyprland features and binds are missing. 

To modify the wallpaper change time,  edit /usr/local/bin/swww-random and change seconds to next image under <i>INTERVAL=[seconds]</i>.
