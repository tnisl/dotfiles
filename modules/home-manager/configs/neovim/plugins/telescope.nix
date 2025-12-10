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
      
      # --- Treesitter (Highlight cú pháp) ---
      # Lưu ý: Nix quản lý Treesitter tốt hơn tự compile
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-cpp
      ]))


  ];


}
