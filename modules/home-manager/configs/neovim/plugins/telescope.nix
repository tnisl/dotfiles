{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', {})
        '';
      }
      telescope-fzf-native-nvim

  ];


}
