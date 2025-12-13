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

      nvim-autopairs
      comment-nvim
    ];

    # 3. Options and keymap
    extraLuaConfig = ''
      -- 1. Options
      vim.cmd("set expandtab")
      vim.cmd("set tabstop=2")
      vim.cmd("set softtabstop=2")
      vim.cmd("set shiftwidth=2")
      vim.keymap.set('i', '<C-BS>', '<C-W>', { noremap = true })
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.cursorline = true
    '';
  };
}
