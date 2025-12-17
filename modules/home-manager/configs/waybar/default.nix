{pkgs, ...}:
let
  mocha = import ./theme.nix;
in
{
  #xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 5;
        height = 30;
        width = 1850;

        spacing = 1;

        #basic layout
        modules-left = [
          "custom/notify"
          "hyprland/workspaces" 
          "sway/workspaces"
          "custom/cava"
        ];

        modules-center = [
        ];

        modules-right = [
          "group/right"
          "tray"
        ];

        #hyprland workspace

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = true;
          format = "{icon} {name}";
          format-icons = {
            default = "";
            focused = "";
            urgent = "";
          };
        };

        #sway workspace

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = true;
          format = "{name}";
          format-icons = {
            default = "";
            #focused = "";
            #urgent = "";
          };

        };

        "group/right" = {
          orientation = "horizontal";
          modules = ["cpu" "memory" "temperature" "network"  "clock" "battery"];
        };


        #config modules
        "custom/cava" = {
          format = "{}";
          exec = "~/.config/scripts/waybar-cava.sh";
          disable-scroll = true;
        };

        
        clock = {
          format = " {:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = " {:%Y:%m:%d}";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            weeks-pos = "right";
            format = {
              months =     "<span color='${mocha.yellow}'><b>{}</b></span>";
              days =       "<span color='${mocha.text}'><b>{}</b></span>";
              weeks =      "<span color='${mocha.green}'><b>W{}</b></span>";
              weekdays =   "<span color='${mocha.peach}'><b>{}</b></span>";
              today =      "<span color='${mocha.red}'><b><u>{}</u></b></span>"; 
            };
          };
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
          format = "{icon}  {capacity}%";
          tooltip-format = "{time}";
          format-charging = "{icon} {capacity}%";
          format-plugged = "󱞜 {capacity}%";
          format-alt = "{time}";
          tooltip-format-plugged = "Plugged";
          tooltip-format-charging = "Charging";
          format-icons = {
            charging = ["󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
            default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          };
          on-scroll-up = "";
          on-scroll-down = "";

        };

        "custom/notify" = {
          format = "";
          on-click = "swaync-client -t -sw";
        };

        network = {
            interface = "wlp2s0";
            format = "{ifname}";
            format-wifi = "{icon} {signalStrength}%";
            format-disconnected = "󰤭";
            tooltip-format-wifi = "{essid} ({signalStrength}%) {icon}";
            tooltip-format-ethernet = "{ifname} ";
            max-length = 50;

            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];

            on-scroll-up = "";
            on-scroll-down = "";
        };
        cpu = {
            interval = 10;
            format = " {}%";
            max-length = 10;
            on-scroll-up = "";
            on-scroll-down = "";
        };

        memory = {
          interval = 10;
          format = " {}%";
          max-length = 10;
          on-scroll-up = "";
          on-scroll-down = "";
        };
        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon6/temp3_input";
          format = " {temperatureC}°C";
          on-scroll-up = "";
          on-scroll-down = "";
        };


      };
    };

    style = builtins.readFile ./style.css;

  };
  #xdg.configFile."waybar/style.css".source = ./style.css;
}
