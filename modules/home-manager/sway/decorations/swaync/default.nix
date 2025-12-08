{pkgs, lib, ...}:
let
  mocha = import ../theme.nix;

in
{

  
  services.swaync = {
    enable = true;


    settings = {
      

      # positioning
      positionX = "left";       
      positionY = "top";         
      control-center-width = 400; 
      fit-to-screen = false;
      # widgets that allowed to popup
      widgets = [
        "title"           
        "dnd"             
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
          label = "☀  "; # Icon mặt trời
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
        box-shadow: 0 0 0 1px ${mocha.mauve};
        border-radius: 10px;
        margin: 10px;
      }
      
      /* Nội dung bên trong bong bóng */
      .notification-content {
        background: ${mocha.base};
        color: ${mocha.text};      
        padding: 10px;
        border-radius: 10px;
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
        background: ${mocha.surface0}; /* Nền tách biệt */
        padding: 10px;                 /* Nội dung bên trong cách viền 10px */
        margin: 10px;                  /* Cách các widget khác 10px */
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
      
      /* Phần rãnh trượt (Trough) */
      .widget-volume > box > scale > trough,
      .widget-backlight > box > scale > trough {
        border: none;
        background: ${mocha.overlay0};
        border-radius: 5px;
        min-height: 8px;
      }
      
      /* Phần đã trượt (Highlight) */
      .widget-volume > box > scale > trough > highlight,
      .widget-backlight > box > scale > trough > highlight {
        background: ${mocha.mauve};
        border-radius: 5px;
      }







    '';
  };


}
