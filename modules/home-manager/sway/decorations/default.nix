{pkgs, lib, ...}:

let
  mocha = import ./theme.nix;
in

{

  wayland.windowManager.sway = {
    config = {
      window = {
        titlebar = false;
      };

      colors = {
        focused = {
          border = mocha.mauve;
          background = mocha.base;
          text = mocha.text;
          indicator = mocha.red;
          childBorder = mocha.blue;
        };

        unfocused = {
          border      = mocha.overlay0; # Viền ngoài (Xám)
          background  = mocha.base;     # Nền (Đen tối)
          text        = mocha.overlay0; # Chữ (Xám - làm chữ mờ đi)
          indicator   = mocha.base;     # Ẩn luôn vạch chỉ hướng
          childBorder = mocha.overlay0; # <--- QUAN TRỌNG: Viền nội dung màu Xám
        };
        urgent = {
          border      = mocha.peach;      # Đỏ
          background  = mocha.peach;      # Đỏ (Làm đỏ rực cả thanh tiêu đề nếu có)
          text        = mocha.base;     # Chữ đen (để đọc được trên nền đỏ)
          indicator   = mocha.peach;
          childBorder = mocha.peach;      # <--- Viền nội dung màu Đỏ
        };

      };

      gaps = {
        inner = 7;
      };

      bars = [];





  };
}; 


  imports = [
    ./swaync/default.nix
    ./swaylock/default.nix
    ./swayosd/default.nix
    ./swaynag/default.nix
  ];

}
