{lib, ...}:
{
  imports = [
    ./hardware/default.nix
    ./boot/default.nix
    ./network/default.nix
    ./services/default.nix
    ./desktop_portal/default.nix
    ./packages/default.nix
    ./timezone/default.nix
    ./virtualisation/default.nix
    ./security/default.nix
    ./users/default.nix
    ./fonts/default.nix
    ./i18n/default.nix
  ];


}
