{pkgs, ...}:
{
	xdg.configFile."wallust/wallust.toml".source = ./wallust.toml;
	xdg.configFile."wallust/templates/colors.css".source = ./templates/colors.css;
	xdg.configFile."wallust/templates/colors-hypr.conf".source = ./templates/colors-hypr.conf;
	xdg.configFile."wallust/templates/colors-kitty.conf".source = ./templates/colors-kitty.conf;
	xdg.configFile."wallust/templates/colors-rofi.rasi".source = ./templates/colors-rofi.rasi;
}

