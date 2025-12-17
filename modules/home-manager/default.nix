{pkgs, lib, ...}:
{
  imports = [
    ./hyprland/default.nix
    ./configs/default.nix
    ./packages/default.nix
    ./scripts/default.nix
    ./services/default.nix
    ./sway/default.nix
  ];



}
