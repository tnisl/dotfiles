{ pkgs, ... }:
{
	xdg.configFile."scripts/nightlight.sh" = {
		source = ./nightlight.sh;
		executable = true;
	};
}
