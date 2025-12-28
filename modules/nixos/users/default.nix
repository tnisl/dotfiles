{pkgs, ...}:
{
  users.users.cyme = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "video" "docker" "audio" "render"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];

    shell = pkgs.zsh;
  };



}
