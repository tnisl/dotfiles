{pkgs, ...}:

let
  
  volumectl = pkgs.writeShellScriptBin "volumectl" ''
    

    state=$1
    
    
    if [ "$state" = "up" ]; then

      
      cur=$(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

      if [ $cur -gt 95 ]; then
        ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 100%

      else
        ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+

      fi


    elif [ "$state" = "down" ]; then
      ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    fi
    
    percentage=($(${pkgs.wireplumber}/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'))
    
    
    
    ${pkgs.libnotify}/bin/notify-send "Volume: $percentage%" -t 5000 -h string:x-canonical-private-synchronous:volume -h int:value:$percentage

    '';

in
{
  home.packages = [volumectl];
}
