{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
        vim.lsp.enable({'lua_ls', 'pyright', 'clangd', "nil_ls", "qmlls"})
        '';
      }
  ];


}
