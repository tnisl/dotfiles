{pkgs, ...}:
let
	theme = pkgs.writeShellScriptBin "theme" ''
		wallust run $1
		pkill -9 waybar
		pkill -9 waybar-cava
		waybar &
		mkdir -p ~/.cache/current_wallpaper
		magick $1 ~/.cache/current_wallpaper/image.jpg
		swww img $1
	'';



in
{
	home.packages = [theme];



}
