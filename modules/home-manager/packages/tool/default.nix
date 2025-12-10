{pkgs, ...}:


{
	home.packages = with pkgs ; [
    lua-language-server
    nil
    clang-tools
    pyright
    gcc


    
    ripgrep
    zsh-powerlevel10k
    gparted
    steam-run
    blueman
    networkmanagerapplet
    bluez
    bluez-tools
    grim
    slurp
    wl-clipboard
    libnotify
    pavucontrol
    swaynotificationcenter
    imagemagick
    brightnessctl
    gnome-keyring
  ];
}
