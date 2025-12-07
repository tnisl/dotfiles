{pkgs, ...}:
{

  #font
  fonts.packages = with pkgs; [
    adwaita-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];


}
