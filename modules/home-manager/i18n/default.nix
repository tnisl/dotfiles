{pkgs, ...}:

{
	i18n.inputMethod = {
  		type = "fcitx5";
    enable = true;
		fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-configtool
      qt6Packages.fcitx5-unikey

		];
  	};


	
  #home.sessionVariables = {
  #  GTK_IM_MODULE = "fcitx";
	#	QT_IM_MODULE = "fcitx";
  #  XMODIFIERS = "@im=fcitx";
  #  SDL_IM_MODULE = "fcitx"; # Cho game Steam
  #};
}

