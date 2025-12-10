{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = render-markdown-nvim;
      type = "lua";
    }
  ];


}
