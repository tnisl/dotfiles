{pkgs, ...}:


{
	imports = [
		./waybar/default.nix
		./fastfetch/default.nix
		./kitty/default.nix
		./wallust/default.nix
		./rofi/default.nix
		./zsh/default.nix
    ./btop/default.nix
    ./cursors/default.nix
	];
}
