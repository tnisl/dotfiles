{pkgs, ...}:

{
	home.packages = with pkgs; [
		graphite-gtk-theme
    		catppuccin-gtk
    		papirus-icon-theme
    		cava
    		btop
    		wallust
    		fastfetch
    		swww
    		nwg-look
    font-manager

    #for testing, not for real using
    quickshell
    pamixer
    pulseaudio
	];
}
