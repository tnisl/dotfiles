{lib, pkgs, ...}:
{
  services = {
    xserver.enable = true;
    xserver.videoDrivers = ["modesetting"];

    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    libinput.enable = true;
    #swayosd.enable = true;

    power-profiles-daemon.enable = true;
    mysql = {
      enable = true;
      package = pkgs.mysql84;
    };

    greetd.enable = lib.mkDefault false;

    displayManager.ly = {
      enable = true;
      settings = {
        animation = "colormix";
        clock = "%c";
        bigclock = "en";
        vi_mode = true;
      };
    };

  };

}
