{ config, pkgs, ... }:



{
  imports = [
    ##sway
    #../../modules/home-manager/sway/default.nix
    ##hyprland
		#../../modules/home-manager/hyprland/default.nix
		##packages
		#../../modules/home-manager/packages/ricing/default.nix
		#../../modules/home-manager/packages/work/default.nix
		#../../modules/home-manager/packages/apps/default.nix
		#../../modules/home-manager/packages/hypr-eco/default.nix
		#../../modules/home-manager/packages/tool/default.nix
		##services
		#../../modules/home-manager/services/default.nix
		##configs
		#../../modules/home-manager/configs/default.nix

		##scripts
		#../../modules/home-manager/scripts/default.nix

    ../../modules/home-manager/default.nix
  ];




  programs.home-manager.enable = true;
  home = {
    username = "cyme";
    homeDirectory = "/home/cyme";
    stateVersion = "24.05";
    sessionVariables = {
      TERMINAL = "kitty";

      TERM = "xterm-256color";

    };
  };

}

