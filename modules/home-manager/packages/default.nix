{pkgs, libs, ...}:
{
  imports = [
    ./apps/default.nix
    ./hypr-eco/default.nix
    ./ricing/default.nix
    ./tool/default.nix
    ./work/default.nix
  ];
}
