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
Mod+Shift+Q – Exit Hyprland  
Mod+W – Launch web browser  
Mod+E – Launch file manager  
Mod+D – Launch Wofi  
Mod+R – Launch system monitor

### Show desktop and cycle wallpaper
Control+Dstroke – Next wallpaper  
Control+Scaron – Hide Waybar and show desktop

### Waybar
Mod+B – Hide Waybar

### Night light
Mod+F9 – Turn on night light  
Mod+F10 – Turn off night light

### Screenshot
Print – Screenshot region  
Mod+Print – Screenshot full

### Show clipboard history
Mod+P – Show clipboard history

### Session
Mod+Backspace – Shutdown  
Mod+Shift+Backspace – Reboot 

### Window management
Mod+J/Down – Cycle focus to next window in stack  
Mod+Tab – Bring active to top  
Mod+K/Up – Cycle focus to previous window in stack  
Mod+Shift+J – Swap focused window with next window in stack  
Mod+Shift+K – Swap focused window with previous window in stack

#### Resize horizontal stack
Mod+H/Left – Increase width of master window  
Mod+L/Right – Decrease width of master window

#### Resize vertical stack
Mod+Shift+H/Left – Increase height of master window  
Mod+Shift+L/Right – Decrease height of master window

#### Focus master
Mod+C – Focus master window  
Mod+X – Remove focused window from the master stack  
Mod+SPACE – Swap with master automatically

#### Fullscreen
Mod+F – Make focused window fullscreen  
Mod+Shift+F – Maximize focused window

#### Floating
Mod+Shift+Space – Toggle floating and center window

### Monitor
Mod+Period – Focus next monitor  
Mod+Comma – Focus previous monitor  
Mod+Shift+Period – Move window to next monitor  
Mod+Shift+Comma – Move window to previous monitor

### Workspaces
Mod+[0-9] – Switch workspaces  
Mod+Shift+[0-9] – Move active window to a workspace

### Mouse bindings
Mod+Mouse Wheel Down – Scroll down through existing workspaces  
Mod+Mouse Wheel Up – Scroll up through existing workspaces  
Mod+Mouse Right Click – Move window around  
Mod+Mouse Left Click – Resize window
