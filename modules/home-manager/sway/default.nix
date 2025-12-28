{pkgs, lib, ...}:


{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
  };
  imports = [
    ./keybinds/default.nix
    ./startup/default.nix
    ./inputs/default.nix
    ./decorations/default.nix
    ./monitors/default.nix
  ];

}
