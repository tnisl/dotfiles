{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = dashboard-nvim;
    }

  ];

}
