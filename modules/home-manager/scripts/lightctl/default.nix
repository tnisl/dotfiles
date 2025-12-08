{pkgs, ...}:

let
  
  lightctl = pkgs.writeShellScriptBin "lightctl" ''
    

    state=$1
    
    
    if [ "$state" = "up" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -q s +2%
    elif [ "$state" = "down" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -q s 2%-
    fi
    
    cur=$(${pkgs.brightnessctl}/bin/brightnessctl g)
    
    max=$(${pkgs.brightnessctl}/bin/brightnessctl m)
    
    percentage=$(($cur*100/$max))
    
    ${pkgs.libnotify}/bin/notify-send "Brightness: $percentage%" -t 3000 -h string:x-canonical-private-synchronous:brightness -h int:value:$percentage

    '';

in
{
  home.packages = [lightctl];
}
