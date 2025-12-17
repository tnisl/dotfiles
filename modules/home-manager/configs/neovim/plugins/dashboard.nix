{pkgs, ...}:
{
  programs.neovim.plugins = with pkgs.vimPlugins; [
    {
      plugin = dashboard-nvim;
      type = "lua";
      config = ''
      require('dashboard').setup({
        theme = 'doom',
        config = {
          header = {
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",
"███▄▄▄▄    ▄█  ▀████    ▐████▀  ▄██████▄     ▄████████", 
"███▀▀▀██▄ ███    ███▌   ████▀  ███    ███   ███    ███", 
"███   ███ ███▌    ███  ▐███    ███    ███   ███    █▀ ", 
"███   ███ ███▌    ▀███▄███▀    ███    ███   ███       ", 
"███   ███ ███▌    ████▀██▄     ███    ███ ▀███████████", 
"███   ███ ███    ▐███  ▀███    ███    ███          ███", 
"███   ███ ███   ▄███     ███▄  ███    ███    ▄█    ███", 
" ▀█   █▀  █▀   ████       ███▄  ▀██████▀   ▄████████▀ ", 
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",
"                                                      ",


          },--your header

          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = '1. Find File           ',
              desc_hl = 'String',
              key = '1',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope find_files'
            },
            {
              icon = ' ',
              desc = '2. Grep File',
              key = '2',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope live_grep'
            },
          },
          footer = {}  --your footer
        }


        })
      '';
    }
  ];



}
