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
    grim
    slurp
    wl-clipboard
    swaynotificationcenter
    imagemagick
  ];
}
