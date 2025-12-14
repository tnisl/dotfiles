{pkgs, lib, ...}:
{
  i18n.inputMethod = {
    		type = "fcitx5";
      enable = true;
  		fcitx5.addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-configtool
        fcitx5-bamboo
        catppuccin-fcitx5
        fcitx5-material-color
        qt6Packages.fcitx5-with-addons
  		];

      fcitx5.settings.addons.classicui.globalSection.Theme = "Catppuccin Mocha Blue";
    };



  
    #environment.sessionVariables = {
    #  GTK_IM_MODULE = "fcitx5";
    #  QT_IM_MODULE = "fcitx5";
    #  XMODIFIERS = "@im=fcitx5";
    #};
}
