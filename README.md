# Minimal Hyprland Mocha Mauve Setup
![screenshot_2025-01-25_230554](https://github.com/user-attachments/assets/5795174c-0954-41e8-839e-b3b48ff0d6bb) ![screenshot_2025-01-26_033356](https://github.com/user-attachments/assets/5b9003d1-9b0d-424a-a77e-90400656f4f2)

## Installation
```
curl -LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup.sh
chmod +x hyprland-setup.sh
sh hyprland-setup.sh
```
### For Nvidia GPUs
The following script will install nvidia-open-dkms, if you have an older GPU, change the nvidia package accordingly in the script. 
```
curl -LO https://raw.githubusercontent.com/lenistarr/hyprland-mocha/refs/heads/main/hyprland-setup-nvidia.sh
chmod +x hyprland-setup-nvidia.sh
sh hyprland-setup-nvidia.sh
```
Nvidia does not load kernel mode setting by default, enabling it is required to make Wayland compositors function properly:
<dl><dd>
<pre>
sudo vim /etc/mkinitcpio.conf <i># In the MODULES array, add the following module names:
        MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)</i>
sudo vim /etc/modprobe.d/nvidia.conf # <i>Write the following:
        options nvidia_drm modeset=1 fbdev=1</i>
sudo mkinitcpio -P
reboot
</pre>
</dd></dl>

## Important Notice
Work in progress. Backup your home folder before installing. Best run on clean install of Arch Linux. Uses master tiling layout. 

Change GTK theme manually in nwg-looks. Change Firefox theme manually in Firefox settings. Get the theme at https://addons.mozilla.org/en-US/firefox/addon/catppuccin-mocha-mauve-git/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search.

The keyboard layout and bindings are configured according to the German/Croatian QWERTZ layout. To change it:
<dl><dd>
<pre>
vim ~/.config/hypr/hyprland.conf
         <i>kb_layout = [keyboard layout]</i>
</pre>
</dd></dl>
        
Wallpaper change is automatically enabled via script. If the folder is empty the script can cause high cpu usage, so do not be surprised. To disable it in hyprland.conf, delete:
<dl><dd>
<pre>
<i>exec-once = ~/.local/bin/swww-random ~/pictures/wallpapers &</i>
</pre>
</dd></dl>

Or change it to the following for a static wallpaper:
<dl><dd>
<pre>
<i>exec-once = swww ~/path/to/img &</i>
</pre>
</dd></dl>

You can also rebind or remove the key combination that cycles wallpapers in hyprland.conf. The relevant bind is:
<dl><dd>
<pre>
<i>bind = CONTROL,         dstroke,               exec,                   ~/.local/bin/swww-next-wallpaper</i>
</pre>
</dd></dl>

## Other 
Install AUR manually.

This install has no display manager or logout functionality since I do not use them. Some non-essential hyprland features and binds are missing. 

To modify the wallpaper change time:
<dl><dd>
<pre>
vim ~/.local/bin/swww-random
         <i>INTERVAL=[seconds]</i>
</pre>
</dd></dl>

## Installed Packages
brightnessctl – controls brightness levels  
cliphist – logs clipboard history  
fastfetch – shows system information  
ffmpegthumbnailer – makes video thumbnails in the file browser  
file-roller – archive extraction tool  
firefox – web browser  
grim – screenshot utility  
gvfs – usb mounting and trash functionality  
htop – system monitor  
hyprland – window manager  
imv – image viewer  
keepassxc – password manager (very blurry on NVIDIA for some reason, stil useable)  
kitty – terminal emulator  
mako – notification daemon  
mpv – media player  
network-manager-applet – waybar applet for networks  
nm-connection-editor – GUI network manager  
nwg-look – GTK themer  
pavucontrol – GUI audio control  
polkit-gnome – authentication agent  
pipewire – audio processor  
pipewire-pulse – extra package for pipeweire  
slurp – screenshot utility for capturing a screen region  
swww – wallpaper daemon  
tela-circle-icon-theme-purple – icon theme  
thunar – GUI file manager  
thunar-archive-plugin – enables right-click to extract archives in Thunar  
transmission-gtk – GUI torrent client  
ttf-ibm-plex – default system font  
ttf-font-awesome – font for tray icons  
tumbler – needed for thunar to display video thumbnails  
waybar – system status bar  
wireplumber – manages audio devices with pipewire  
wlsunset – sets night mode  
wofi – program launcher  
xdg-desktop-portal-hyprland – desktop integration portal  
yt-dlp – youtube media downloader  
zathura – document viewer  
zathura-pdf-poppler – pdf support for zathura

## Default Keybindings
Mod+Enter – Spawn terminal  
Mod+Q – Close window  
Mod+Shift+Q – Exit hyprland  
Mod+W – Launch web browser  
Mod+E – Launch file manager  
Mod+D – Launch wofi  
Mod+R – Launch system monitor

### Show desktop and cycle wallpaper
Control+Dstroke – Next wallpaper  
Control+Scaron – Hide waybar and show desktop

### Restart waybar
Mod+Shift+B – Restart waybar

### Night light
Mod+F9 – Turn on night light  
Mod+F10 – Turn off night light

### Screenshot
bind = , Print, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/pictures/screenshots/screenshot_$(date +%F_%T).png | notify-send "Screenshot of the region taken" ### Screenshot region
bind = $mainMod, Print, exec, grim - | wl-copy && wl-paste > ~/pictures/screenshots/screenshot_$(date +%F_%T).png | notify-send "Screenshot of whole screen taken" ### Screenshot full

### Show clipboard history
bind = $mainMod, P, exec, cliphist list | wofi --show dmenu -H 600 -W 900 | cliphist decode | wl-copy ### Show clipboard history

### Session
bind = $mainMod, Backspace, exec, shutdown now
bind = $mainMod SHIFT, Backspace, exec, reboot

### Window management
bind = $mainMod, J, layoutmsg, cyclenext ### Cycle focus to next window in stack
bind = $mainMod, down, layoutmsg, cyclenext
bind = $mainMod, Tab, cyclenext
bind = $mainMod, Tab, bringactivetotop
bind = $mainMod, K, layoutmsg, cycleprev ### Cycle focus to previous window in stack
bind = $mainMod, up, layoutmsg, cycleprev
bind = $mainMod SHIFT, J, layoutmsg, swapnext ### Swap focused window with next window in stack
bind = $mainMod SHIFT, K, layoutmsg, swapprev ### Swap focused window with previous window in stack

### Resize horizontal stack
bind = $mainMod, H, resizeactive, -5 0
bind = $mainMod, left, resizeactive, -5 0
bind = $mainMod, L, resizeactive, 5 0
bind = $mainMod, right, resizeactive, 5 0

### Resize vertical stack
bind = $mainMod SHIFT, H, resizeactive, 0 20
bind = $mainMod SHIFT, left, resizeactive, 0 20
bind = $mainMod SHIFT, L, resizeactive, 0 -20
bind = $mainMod SHIFT, right, resizeactive, 0 -20

### Focus master
bind = $mainMod, C, layoutmsg, focusmaster ### Focus master window
bind = $mainMod, X, layoutmsg, removemaster ### Remove focused window from the master stack
bind = $mainMod, SPACE, layoutmsg, swapwithmaster auto ### Swap with master automatically

### Fullscreen
bind = $mainMod, F, fullscreen
bind = $mainMod SHIFT, F, fullscreenstate

### Monocle
bind = $mainMod, G, togglegroup

### Floating
bind = $mainMod SHIFT, SPACE, togglefloating
bind = $mainMod SHIFT, SPACE, centerwindow

### Special workspaces
bind = $mainMod, grave, togglespecialworkspace, scratchpad
bind = $mainMod SHIFT, grave, movetoworkspace, special:scratchpad
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic
bind = $mainMod, apostrophe, togglespecialworkspace, spcalc
bind = $mainMod SHIFT, apostrophe, movetoworkspace, special:spcalc

### Focus monitor
bind = $mainMod, comma, focusmonitor, -1
bind = $mainMod, period, focusmonitor, +1

### Move window to monitor
bind = $mainMod SHIFT, comma, movewindow, mon:-1
bind = $mainMod SHIFT, period, movewindow, mon:+1

### Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

### Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

### Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

### Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

### Laptop multimedia keys
bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = , XF86MonBrightnessUp, exec, brightnessctl s 10%+
bindel = , XF86MonBrightnessDown, exec, brightnessctl s 10%-

### Bindings for playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous
