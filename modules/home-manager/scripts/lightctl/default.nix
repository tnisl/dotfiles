{pkgs, ...}:

let
  
  lightctl = pkgs.writeShellScriptBin "lightctl" ''
    

    state=$1



    cur=$(${pkgs.brightnessctl}/bin/brightnessctl g)
    max=$(${pkgs.brightnessctl}/bin/brightnessctl m)

    percentage=$(($cur * 100 / $max))
    if [ "$state" = "up" ]; then
      ${pkgs.brightnessctl}/bin/brightnessctl -q s +2%
    elif [ "$state" = "down" ]; then
      

      next=$(($percentage - 2))
      
      if [ $next -lt 5 ]; then
        ${pkgs.brightnessctl}/bin/brightnessctl -q s 5%
      else
        ${pkgs.brightnessctl}/bin/brightnessctl -q s 2%-
      fi
    fi
    
    cur=$(${pkgs.brightnessctl}/bin/brightnessctl g)
    percentage=$(($cur*100/$max))
    
    ${pkgs.libnotify}/bin/notify-send "Brightness: $percentage%" -t 3000 -h string:x-canonical-private-synchronous:brightness -h int:value:$percentage

    '';
  

in
{
  home.packages = [lightctl];
}
