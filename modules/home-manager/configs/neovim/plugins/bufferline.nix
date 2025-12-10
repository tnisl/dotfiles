{pkgs, ...}:
{
    programs.neovim.plugins = with pkgs.vimPlugins; [
      {
        plugin = bufferline-nvim;
        type = "lua";

        config = ''
        vim.opt.termguicolors = true
        local bufferline = require("bufferline")

        bufferline.setup{
        options = {
        mode = "buffers",
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        seperator_style = "slant",


        offsets = {
          {
            filetype = "neo-tree",  
            text = "File Explorer", 
            text_align = "left",    
            separator = true,       
          }
        },

        vim.keymap.set('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Buffer' }),
        vim.keymap.set('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Prev Buffer' })
      }
    }
        '';

      }
    ];


}
