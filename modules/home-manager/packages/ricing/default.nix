{pkgs, ...}:

{
	home.packages = with pkgs; [
		graphite-gtk-theme
    		papirus-icon-theme
    		cava
    		btop
    		wallust
    		fastfetch
    		swww
        nitch
    #nwg-look

    #for testing, not for real using
    quickshell
    pamixer
    pulseaudio
	];
}
