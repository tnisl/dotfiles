{pkgs, lib, ...}:
let
  mocha = import ../theme.nix;
in

{
  services.swayosd.enable = true;
  wayland.windowManager.sway = {
  };



}
