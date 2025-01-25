Work in progress.

Keybindings are configured according to German/Croatian QWERTZ. Change it manually in in .config/hypr/hyprland.conf under "kb_layout =".

Change GTK theme manually in nwg-looks. Change Firefox theme manually in Firefox settings.

No display manager or logout functionality. Scratchpad and some other features are missing. Uses master tiling layout. Install Nvidia drivers manually.

Wallpaper change is automatically enabled. To disable it, change the command in ~/~/~/hypr/hyprland.conf from "exec-once = swww-random ~/pictures/wallpapers &" to "exec-once = swww ~/path/to/img" and the rebind or remove "bind = CONTROL,         P,          exec,                   swww-next-wallpaper # Next wallpaper". 

To modify the wallpaper change time: "vim /usr/local/bin/swww-random", change "INTERVAL=[seconds]".
