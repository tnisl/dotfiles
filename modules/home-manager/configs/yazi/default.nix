{pkgs, ...}:
{



  programs.yazi = {
    enable = true;
    settings = {
        # 1. Định nghĩa hành động (Opener)
        opener = {
          # Đặt tên opener là "wall"

          edit = [
          {

            run = '' $EDITOR "$@" '';
            block = true;
            desc = "Edit file";
          }



        ];
          wall = [
            {
              run = ''${pkgs.swww}/bin/swww img "$1"'';
              orphan = true;
              desc = "Set as Wallpaper";
            }
          ];
        };
    
        open = {
          rules = [
            { mime = "image/*"; use = [ "open" "wall" ]; }
            { mime = "text/*"; use = [ "edit" ]; }
          ];
        };
      };


  };

}
