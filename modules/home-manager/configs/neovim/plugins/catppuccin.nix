{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [

      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({
            transparent_background = true,

            integrations = {
              markdown = true;
            }

          })
          vim.cmd.colorscheme "catppuccin"
        '';
      }

  ];


}
