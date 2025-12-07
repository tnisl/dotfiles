{pkgs, ...}:

let
	reload_waybar = pkgs.writeShellScriptBin "reload_wb" ''
		pkill -9 waybar
		pkill -9 cava
		${pkgs.waybar}/bin/waybar &
	'';

in

{
	home.packages = [reload_waybar];

}
