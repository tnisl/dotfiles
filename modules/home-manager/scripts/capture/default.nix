
{ pkgs, ... }:

let
	screen-capture= pkgs.writeShellScriptBin "screen-capture" ''
		MONITOR=$(${pkgs.hyprland}/bin/hyprctl monitors | ${pkgs.gawk}/bin/awk '/Monitor/{name=$2} /focused: yes/{print name}')

  	  	${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy

  	  	${pkgs.libnotify}/bin/notify-send "Screen Captured!" -t 3000
  	'';

  	region-capture = pkgs.writeShellScriptBin "region-capture" ''
  		${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy ; ${pkgs.libnotify}/bin/notify-send "Region Capture!" -t 3000
  	'';


in
{
  home.packages = [screen-capture region-capture];
}
