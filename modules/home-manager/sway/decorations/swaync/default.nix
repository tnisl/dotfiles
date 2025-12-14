{pkgs, lib, config, ...}:
let
  mocha = import ../theme.nix;
  nightlight = pkgs.writeShellScriptBin "nightlight" ''
    


    if ${pkgs.procps}/bin/pgrep -x "wlsunset" > /dev/null
    then
      ${pkgs.procps}/bin/pkill -x wlsunset
    else
      ${pkgs.wlsunset}/bin/wlsunset -t 5000 > /dev/null 2>&1 &
    fi

  '';

  state = pkgs.writeShellScriptBin "state" ''
    ${pkgs.procps}/bin/pgrep -x wlsunset
  '';



  capture = pkgs.writeShellScriptBin "capture" ''
    PATH_IMG="$HOME/Pictures/Screenshot_$(${pkgs.coreutils}/bin/date +'%Y-%m-%d_%H-%M-%S').png"
  
    ${pkgs.coreutils}/bin/mkdir -p "$HOME/Pictures"
  
    ${pkgs.grim}/bin/grim "$PATH_IMG"

    ${pkgs.swaynotificationcenter}/bin/swaync-client -cp 

    ${pkgs.coreutils}/bin/sleep 0.5
  
    choose=$(${pkgs.libnotify}/bin/notify-send -w -t 5000 \
      "Screen Captured!" \
      "Saved at $PATH_IMG" \
      --action="open=Open" \
      --action="delete=Delete")
    if [ $choose == "open" ]; then
      ${pkgs.firefox}/bin/firefox $PATH_IMG
    else
      ${pkgs.coreutils}/bin/rm -rf $PATH_IMG
      ${pkgs.coreutils}/bin/sleep 0.5
      ${pkgs.libnotify}/bin/notify-send "Deleted!"
    fi

  '';

in
{

  


  
  services.swaync = {
    enable = true;


    settings = {
      

      # positioning
      positionX = "left";       
      positionY = "top";         
      control-center-width = 400; 
      fit-to-screen = true;
      # widgets that allowed to popup
      widgets = [
        "title"           
        "dnd"
        "buttons-grid"
        "volume"
        "backlight"
        "mpris"           
        "notifications"
      ];

      # configuration
      widget-config = {
        title = {
          mocha.text = "Notifications";
          clear-all-button = true;
          button-mocha.text = "Delete all";
        };
        
        dnd = {
          mocha.text = "Do not disturb!";
        };
        
        mpris = {
          image-size = 100;
          image-radius = 10;
        };

        volume = {
          label = "  "; 
        };
        backlight = {
          label = "☀  "; 
        };

        buttons-grid = {
          actions = [
            {
              label = "";
              type = "toggle";
              command = "[[ $SWAYNC_TOGGLE_STATE == true ]] && ${pkgs.networkmanager}/bin/nmcli radio wifi on || ${pkgs.networkmanager}/bin/nmcli radio wifi off";
              update-command = "[[ $(${pkgs.networkmanager}/bin/nmcli radio wifi) == \"enabled\" ]] && ${pkgs.coreutils}/bin/echo true || ${pkgs.coreutils}/bin/echo false";

            }
            
            {
              label = "";
              type = "toggle";
              #command = "${nightlight}/bin/nightlight";
              command = "[[ $SWAYNC_TOGGLE_STATE == true ]] && ${pkgs.wlsunset}/bin/wlsunset -t 5000  || ${pkgs.procps}/bin/pkill -x wlsunset";
              update-command = "[[ $(${pkgs.procps}/bin/pgrep -x wlsunset) != '' ]]  && ${pkgs.coreutils}/bin/echo true || ${pkgs.coreutils}/bin/echo false";

            }

            {
              label = "󰂯";
              type = "normal";
              command = "${pkgs.swaynotificationcenter}/bin/swaync-client -cp ; ${pkgs.coreutils}/bin/sleep 0.5 ; ${pkgs.blueman}/bin/blueman-manager";
            }     



            {
              label = "󰄄";
              type = "normal";
              active = "true";
              command = "${capture}/bin/capture";
            }

          ];
        };
      };



    };



    style = ''
      /* general styling */


      .control-center {
        background: ${mocha.base};
        border: 2px solid ${mocha.mauve};
        border-radius: 10px;
        color: ${mocha.text};
      }

      /* Widget handle */ 
      .widget-title {
        color: ${mocha.mauve};
        font-weight: bold;
      }

      .widget-title > button {
        background: ${mocha.surface0}; 
        color: ${mocha.text};          
        border: none;
        box-shadow: none;              
        border-radius: 5px;            
      }

      .widget-title > button:hover {
        background: ${mocha.red}; 
        color: ${mocha.base};     
      }





      /* Notification (you can try notify-send :D )*/


      .notification {
        border: none;
        border-radius: 0px;
        background: transparent;
      }



      
      .notification-content {
        background: ${mocha.base};
        color: ${mocha.text};      
        padding: 10px;
        border: 3px solid ${mocha.mauve};
        border-radius: 10px;
      }

      .notification-action button{
        background: ${mocha.red};
        color: ${mocha.base};
      }


      .notification-content progress {
        background: ${mocha.mauve};
      }
      
      .notification-content progress::-moz-progress-bar {
        background-color: #89b4fa; 
      }
      
      /*X button*/
      .close-button {
        background: ${mocha.red};
        color: ${mocha.base};     
        border-radius: 50;
      }


      /* DO NO DISTURB >:( */
      .widget-dnd {
        background: ${mocha.surface0}; 
        margin: 10px;                 
        border-radius: 10px;         
      }


      /* Switch */
      .widget-dnd > switch {
        background: ${mocha.overlay0};
        border-radius: 10px;
      }
      
      /* Switch checked */
      .widget-dnd > switch:checked {
        background: ${mocha.mauve};    
      }





      /* Mpris */
      .widget-mpris {
        background: ${mocha.surface0}; 
        padding: 10px;                 
        margin: 10px;                  
        border-radius: 10px;           
      }


      /* Volume and backlight control */
      /* Thanh trượt (Slider) */
      .widget-volume,
      .widget-backlight {
        background: ${mocha.surface0};
        padding: 5px;
        margin: 10px;
        border-radius: 10px;
      }
      
      /* (Trough) */
      .widget-volume > box > scale > trough,
      .widget-backlight > box > scale > trough {
        border: none;
        background: ${mocha.overlay0};
        border-radius: 5px;
        min-height: 8px;
      }
      
      /* (Highlight) */
      .widget-volume > box > scale > trough > highlight,
      .widget-backlight > box > scale > trough > highlight {
        background: ${mocha.mauve};
        border-radius: 5px;
      }

      /* buttons-grid */
      .widget-buttons-grid > flowbox{
        padding-left: 15px;

      }
      .widget-buttons-grid > flowbox > flowboxchild > button{
        padding: 10 20 10 20;
      }
      .widget-buttons-grid > flowbox > flowboxchild > button:checked{
        background-color: ${mocha.mauve};
      }










    '';
  };


}
