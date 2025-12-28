{ pkgs, ... }:

{
  imports = [
  ./plugins/bufferline.nix
  ./plugins/catppuccin.nix
  ./plugins/lualine.nix
  ./plugins/neotree.nix
  ./plugins/telescope.nix
  ./plugins/lsp.nix
  ./plugins/cmp.nix
  ./plugins/dashboard.nix
  ./plugins/treesitter.nix
  ./plugins/render-markdown.nix
  ];



  
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # 1. Dependencies
    extraPackages = with pkgs; [
      # -- System Tools --
      ripgrep      
      fd           
      gcc          
      unzip        
      wl-clipboard 

      # -- LSP Servers & Formatters 
      lua-language-server 
      nil                 
      clang-tools         
      pyright 
    ];

    # 2. Plugins

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons     

      comment-nvim
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = ''
          require("nvim-autopairs").setup {}
        '';
      }


    ];

    # 3. Options and keymap
    extraLuaConfig = ''
      -- 1. Options
      vim.opt.autoindent = true   
      vim.opt.smartindent = true   
      vim.opt.expandtab = true    
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.softtabstop = 2
      vim.keymap.set('i', '<C-BS>', '<C-W>', { noremap = true })

      vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

      vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})


      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.cursorline = true

      local fcitx_cmd = "fcitx5-remote"
      vim.keymap.set("i", "<Esc>", function()
        vim.fn.system("fcitx5-remote -c")
        
        return "<Esc>"
      end, { expr = true, silent = true })


    '';
  };
}
