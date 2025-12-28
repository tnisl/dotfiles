{pkgs, config, ...}:
{
  programs = {
    sway = {
      enable =true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
    };
    
    hyprland.enable = true;
    dconf.enable = true;
    firefox.enable = true;
    zsh.enable = true;
    steam.enable = true;
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
    intel-undervolt
    rar
    zip
    brightnessctl
    gnome-keyring
    libnotify
    pavucontrol
    bluez
    bluez-tools
    renderdoc
    wl-mirror
    obs-studio

    catppuccin-sddm
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtsvg
    fzf

    qt6.qtdeclarative

  ];



}
