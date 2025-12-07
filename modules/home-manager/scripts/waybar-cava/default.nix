{ pkgs, ... }:
{
	xdg.configFile."scripts/waybar-cava.sh" = {
		source = ./waybar-cava.sh;
		executable = true;
	};
}
