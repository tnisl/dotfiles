{pkgs, ...}: 

{
	home.packages = with pkgs; [
    		vscode
    		obsidian
    		mysql-workbench
	];
}
