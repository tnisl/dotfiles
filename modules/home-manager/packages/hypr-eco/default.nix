{pkgs, ...}:

{
	home.packages = with pkgs ; [
		hyprlock
    		hyprsunset
    		hypridle
    		hyprpicker
    		hyprcursor
		hyprpolkitagent
	];
}
