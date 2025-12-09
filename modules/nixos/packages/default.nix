{pkgs, config, ...}:
{
  programs = {
    sway.enable = true;
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
    swayosd
    yazi
    asusctl # asus only!
    powertop # tuning 
    intel-media-driver
    libva-utils
  ];



}
