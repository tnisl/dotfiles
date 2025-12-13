{ config, lib, pkgs, inputs, ... }:

{

nixpkgs.config.allowUnfree = true;
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      ../../modules/nixos/default.nix

    ];

# CACHE CONFIGURATION
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"           # It's a must!
      "https://nix-community.cachix.org"   # Community cache
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" # default key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" # community key
    ];
  };

























  home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
        extraSpecialArgs = {inherit inputs;};
        users = {
        	"cyme" = import ./home.nix;
        };
  };





  #system package



  system.stateVersion = "25.11"; # Did you read the comment?

  #flakes
  nix.settings.experimental-features = [
	"nix-command" "flakes"
  ];

}

