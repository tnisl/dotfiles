{pkgs, lib, ...}:

{
  wayland.windowManager.sway = {
    config = rec {


      #default
      modifier = "Mod4";
      terminal = "kitty"; 
      menu = "rofi -show drun";
      # the mkdOptionDefault make sure not erase all the default configs
      keybindings = 
        lib.mkOptionDefault
        {

        #kill window 
        "${modifier}+q" = "kill";

        #brightness control


        #"XF86MonBrightnessUp"  = "exec brightnessctl set 5%+";
        #"XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

        "--locked XF86MonBrightnessUp" = "exec swayosd-client --brightness raise";
        "--locked XF86MonBrightnessDown" = "exec swayosd-client --brightness lower";

        #volume control


        #"--locked XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        #"--locked XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        #"--locked XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        #"--locked XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";


        "--locked XF86AudioRaiseVolume" = "exec swayosd-client --output-volume raise";
        "--locked XF86AudioLowerVolume" = "exec swayosd-client --output-volume lower";
        "--locked XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
        "--locked XF86AudioMicMute" = "exec swayosd-client --input-volume mute-toggle";

        # screen capture
        "${modifier}+s"  = "exec screen-capture";
        "${modifier}+shift+s"  = "exec region-capture";

        # reload Sway
        "${modifier}+Shift+c" = "reload";

        # exit Sway
        "${modifier}+BackSpace" = "exec swaymsg exit";

        # lock Sway (using Hyprlock :D )
        "${modifier}+m" = "exec swaylock";

        # open swaync
        "${modifier}+n" = "exec swaync-client -t";

        # moving focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        
        # moving window
        "${modifier}+Ctrl+h" = "move left";
        "${modifier}+Ctrl+j" = "move down";
        "${modifier}+Ctrl+k" = "move up";
        "${modifier}+Ctrl+l" = "move right";


        #resize window
        "${modifier}+Shift+h" = "resize shrink width 10 px or 10 ppt";
        "${modifier}+Shift+k" = "resize grow height 10 px or 10 ppt";
        "${modifier}+Shift+j" = "resize shrink height 10 px or 10 ppt";
        "${modifier}+Shift+l" = "resize grow width 10 px or 10 ppt";


        #fullscreen
        "${modifier}+f"  = "fullscreen toggle";

        #toggle split
        "${modifier}+i" = "layout toggle split";

        # toggle floating
        "${modifier}+t" = "floating toggle";
        #"--whole-window ${modifier}+Shift+button1" = "resize";

        #reload waybar
        "${modifier}+Shift+r" = "exec reload_wb";


        #file manager
        "${modifier}+e" = "exec kitty -e yazi";

      };




    };

      #extraConfig = ''
      #    bindsym --whole-window Mod4+Shift+button1 resize
      #'';



  };

}
