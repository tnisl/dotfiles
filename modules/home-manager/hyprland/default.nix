{pkgs, ...} :
{
	wayland.windowManager.hyprland = {
		enable = true;
		package = pkgs.hyprland;
    xwayland.enable = true;
    settings = {
			"$USERCONFIG" = "~/.config/hypr/configs";
			source = [
			"~/.cache/wallust/colors-hypr.conf"
			"$USERCONFIG/default.conf"
			"$USERCONFIG/startup.conf"
			"$USERCONFIG/monitors.conf"
			"$USERCONFIG/decoration.conf"
			"$USERCONFIG/input.conf"
			"$USERCONFIG/keybinds.conf"
			"$USERCONFIG/environment.conf"
			];
		};

    systemd.enable = true;
  };
}
