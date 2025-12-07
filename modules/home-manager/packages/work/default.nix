{pkgs, ...}: 

{
	home.packages = with pkgs; [
		neovim
    		vscode
    		obsidian
    		kitty
    		mysql-workbench
		python3
		python313Packages.pip
	];
}
