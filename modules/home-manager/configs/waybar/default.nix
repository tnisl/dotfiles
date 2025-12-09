{pkgs, ...}:

{
  #xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 5;
        height = 20;
        width = 1850;

        spacing = 1;

        #basic layout
        modules-left = [
          "custom/notify"
          "hyprland/workspaces" 
          "sway/workspaces"
          #"custom/cava"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "group/left"
        ];

        #hyprland workspace

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = true;
          format = "{name}";
          format-icons = {
            default = "";
          };
        };

        #sway workspace

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = true;
          format = "{name}";
        };

        "group/left" = {
          orientation = "horizontal";
          modules = ["idle_inhibitor" "tray" "power-profiles-daemon" "battery"];
        };


        #config modules
        "custom/cava" = {
          format = "{}";
          exec = "~/.config/scripts/waybar-cava.sh";
          disable-scroll = true;
        };

        
        clock = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y:%m:%d}";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          disable-scroll = true;
        };

        tray = {
          spacing = 10;
          disable-scroll = true;
        };


        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format =  "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver =  "";
          };
          disable-scroll = true;

        };


        battery = {
          states = {
            good =  95;
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          tooltip-format = "{capacity}%\n{time}";
          format-full = "{icon}";
          format-charging = "";
          format-plugged = "";
          format-alt = "{capacity}% {time}";
          format-icons = ["" "" "" "" ""];
          disable-scroll = true;

        };

        "custom/notify" = {
          format = "";
          on-click = "swaync-client -t -sw";
        };



      };
    };

    style = builtins.readFile ./style.css;

  };
  #xdg.configFile."waybar/style.css".source = ./style.css;
}
