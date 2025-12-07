{pkgs, lib, ...}:
{
  wayland.windowManager.sway = {
    config = rec {
      input = {


        "type:touchpad" = {
          natural_scroll  = "enabled";
          tap =  "enabled";
          tap_button_map  = "lrm";
          dwt = "enabled";
          dwtp = "enabled";
          drag_lock = "disable";
        };

        "type:keyboard" = {
          repeat_delay = "400";
          repeat_rate = "50";
        };
      };

      #bindgesture = {
      #  swipe:right  = "workspace prev";
      #  swipe:left = "workspace next";
      #};

    };


  };


}
