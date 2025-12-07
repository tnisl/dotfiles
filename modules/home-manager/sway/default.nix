{pkgs, lib, ...}:


{
  wayland.windowManager.sway = {
    enable = true;
  };
  imports = [
    ./keybinds/default.nix
    ./startup/default.nix
    ./inputs/default.nix
    ./decorations/default.nix
    ./monitors/default.nix
  ];

}
