## Auto Install Script for Minimal Hyprland with Catppuccin Mocha Mauve Theme 
# Important Notice
Work in progress. Best done on a clean install of Arch.

Change GTK theme manually in nwg-looks. Change Firefox theme manually in Firefox settings.

Wallpaper change is automatically enabled. If the folder is empty the script can cause high cpu usage so do not be surprised. To disable it:
<dl><dd>
<pre>
vim ~/.config/hypr/hyprland.conf #
</pre>
</dd></dl>
 Change <i>exec-once = swww-random ~/pictures/wallpapers &</i> to <i>exec-once = swww ~/path/to/img</i>
You can also rebind or remove the key combination in hyprland.conf that cycles wallpapers. The relevant bind is:  <i>bind = CONTROL,         P,          exec,                   swww-next-wallpaper </i>

Use the script at your own discretion.

# Installation
```
curl -LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup.sh && chmod +x hyprland-setup.sh
sh hyprland-setup.sh
```
# Other 
Keyboard layout and bindings are configured according to German/Croatian QWERTZ. Change it manually in .config/hypr/hyprland.conf under "kb_layout =".

Install Nvidia drivers manually. Install AUR manually.

No display manager or logout functionality. Some non-essential features are missing. Uses master tiling layout. 

Modify the wallpaper change time: 
<dl><dd>
<pre>
<b>vim /usr/local/bin/swww-random</b> # Change seconds to next image under <i>INTERVAL=[seconds]</i>
</pre>
</dd></dl>
