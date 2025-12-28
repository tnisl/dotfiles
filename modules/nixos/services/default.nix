{lib, pkgs, ...}:
{
  services = {


    xserver = {
      enable = true;
      videoDrivers = [
      "modesetting"
      #"nvidia"
      ];
      windowManager.i3.enable = true;
    };



    




    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        tapping = true;
        disableWhileTyping = true;
        clickMethod = "clickfinger";
      };
      
    };

    power-profiles-daemon.enable = true;


    # asus only!

    asusd = {
      enable = true;
      enableUserService = true;
    };

    mysql = {
      enable = true;
      package = pkgs.mysql84;
    };

    greetd.enable = lib.mkDefault false;

    #displayManager.ly = {
    #  enable = true;
    #  settings = {
    #    animation = "colormix";
    #    clock = "%c";
    #    bigclock = "en";
    #    vi_mode = true;
    #  };
    #};

    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
      sddm.theme = "catppuccin-mocha-mauve";
      sddm.package = pkgs.kdePackages.sddm;
    };

    openssh.enable = true;

  };

  systemd.services.mysql.wantedBy = lib.mkForce [];

}
