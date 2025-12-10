{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
     
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-vim
        p.tree-sitter-bash
        p.tree-sitter-lua
        p.tree-sitter-python
        p.tree-sitter-json
        p.tree-sitter-cpp
        p.tree-sitter-markdown
        p.tree-sitter-markdown_inline
      ]))
      nvim-treesitter-parsers.latex

  ];


      programs.neovim.extraLuaConfig = ''
      require('nvim-treesitter.configs').setup({
        
        highlight = {
          enable = true, 
          
          additional_vim_regex_highlighting = false,
        },
      })
      
    '';




}
