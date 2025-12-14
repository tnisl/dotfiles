{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
      {
        plugin = neo-tree-nvim;
        type = "lua";
        config = ''
        require("neo-tree").setup({
          close_if_last_window = true,
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true
        })
        vim.g.mapleader = " "
        vim.keymap.set('n', '<Leader>e', ':Neotree filesystem toggle left<CR>', {})

        vim.keymap.set('n', '<C-l>', function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd "p" 
          end
        end, { desc = "Toggle NeoTree Focus" })


        vim.keymap.set('n', '<C-h>', function()
          if vim.bo.filetype ~= "neo-tree" then
            vim.cmd "Neotree focus"
          end
        end)


        '';
      }


  ];


}
