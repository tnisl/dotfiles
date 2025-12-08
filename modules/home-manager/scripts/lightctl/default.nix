{pkgs, ...}:

let
  
  lightctl = pkgs.writeShellScriptBin "lightctl" ''
    
    case "$1" in
    up)
      ${pkgs.brightnessctl}/bin/brightnessctl -q s +2%
    ;;
    down)
      ${pkgs.brightnessctl}/bin/brightnessctl -q s 2%-
    ;;
    *)
    ;;
    esac

    '';

in
{
  home.packages = [lightctl];
}
