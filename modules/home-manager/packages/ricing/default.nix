{pkgs, ...}:

{
	home.packages = with pkgs; [
		graphite-gtk-theme
    		papirus-icon-theme
    		cava
    		btop
    		wallust
    		swww
        nitch
    #for testing, not for real using
        quickshell
    #pamixer
    #pulseaudio
	];
}
