{pkgs, lib, ...}:

{

  wayland.windowManager.sway = {
    config = rec {


      startup = [
        {command = "swaymsg workspace number 1";}
        {command = "--no-startup-id waybar";}
        {command = "swww-daemon";}
        {command = "nm-applet";}
        # {command = "fcitx5";}
        {command = "swaymsg seat seat0 xcursor_theme Bibata-Modern-Ice 24";}
        #{command = "swayosd-server";}
      ];
    };
  };
}
