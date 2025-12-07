{pkgs, ...}:

{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		shellAliases = {
			upd = "sudo nix-channel --update";
			upg = "sudo nixos-rebuild switch --upgrade";
			hupd = "home-manager switch --flake ~/.config/home-manager";
			gc = "sudo nix-collect-garbage -d";
			hgc = "nix-collect-garbage -d";
		};

		history.size = 1000;

		oh-my-zsh = {
			enable = true;
			plugins = ["git"];
			theme = "bira";
		};

		initContent = ''
fastfetch
source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
		'';



	};
}
