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

    #tlp = {
    #  enable = false;

    #  settings = {
    #    TLP_ENABLE = 1;
    #    TLP_DEFAULT_MODE = "BAT";
    #    TLP_PERSISTENT_DEFAULT = 1;

    #    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    #    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

    #    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    #    CPU_ENERGY_PERF_POLICY_ON_BAT = "balanced_power";

    #    CPU_BOOST_ON_AC = 1;
    #    CPU_BOOST_ON_BAT = 0;
    #  };
    #};


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

    displayManager.ly = {
      enable = true;
      settings = {
        animation = "colormix";
        clock = "%c";
        bigclock = "en";
        vi_mode = true;
      };
    };

    openssh.enable = true;

  };

  systemd.services.mysql.wantedBy = lib.mkForce [];

}
