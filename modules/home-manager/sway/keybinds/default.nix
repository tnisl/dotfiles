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

        "--locked XF86MonBrightnessUp" = "exec lightctl up";
        "--locked XF86MonBrightnessDown" = "exec lightctl down";

        #volume control



        "--locked XF86AudioRaiseVolume" = "exec volumectl up";
        "--locked XF86AudioLowerVolume" = "exec volumectl down";
        "--locked XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        "--locked XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";


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
        "${modifier}+e" = "exec foot -e yazi";


      };

      output = {
        eDP-1 = {
          resolution = "1920x1080@60Hz";
        };
      };




    };

    extraConfig = ''
      bindgesture swipe:right workspace prev
      bindgesture swipe:left workspace next
    '';
  };

}
