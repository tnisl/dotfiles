{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
        
        require('lualine').setup({
          theme = "catppuccin",
          globalstatus = true,
        })
        '';
      }



  ];


}
