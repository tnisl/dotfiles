{pkgs, config, ...}:
{
  programs = {
    sway = {
      enable =true;
      wrapperFeatures.gtk = true;

    };
    hyprland.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    power-profiles-daemon
    config.boot.kernelPackages.cpupower
    jdk21
    lshw
    asusctl # asus only!
    powertop # tuning 
    wlsunset
  ];



}
