{pkgs, lib, ...}:
{
  imports = [
    ./hyprland/default.nix
    ./configs/default.nix
    ./i18n/default.nix
    ./packages/default.nix
    ./scripts/default.nix
    ./services/default.nix
    ./sway/default.nix
  ];


}
