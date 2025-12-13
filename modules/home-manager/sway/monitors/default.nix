{pkgs, libs,...}:

{

  wayland.windowManager.sway = {
    config = rec {
      output = {
        "eDP-1" = {
          mode = "1920x1080@60Hz";
        };
      };
    };
  };
}
