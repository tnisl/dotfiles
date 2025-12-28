{ config, pkgs, inputs, ... }:



{
  imports = [
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

