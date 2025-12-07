{pkgs, ...}:
let
  mocha = import ../theme.nix;
in
{

  programs.swaylock = {
    enable = true;

    package = pkgs.swaylock-effects;

    settings = {
      # take screenshots and apply
      screenshots = true;


      # blur effect
      effect-blur = "7x5";




      # Indicator (the circle)

      clock = false;
      indicator = true;
      

      # color scheme

      # 1. Màu nền vòng tròn (Khi chưa gõ gì)
      inside-color = "${mocha.base}88"; # Thêm 88 ở cuối để trong suốt (Alpha)
      ring-color   = "${mocha.blue}";   # Viền ngoài cùng
      
      # 2. Màu khi gõ phím (Typing)
      key-hl-color = "${mocha.green}";  # Phím vừa gõ sẽ nháy màu Tím
      bs-hl-color = "${mocha.red}";
      
      # 3. Màu khi đang kiểm tra pass (Verifying)
      ring-ver-color   = "${mocha.yellow}"; # Viền chuyển Tím
      inside-ver-color = "${mocha.base}";  # Bên trong
      text-ver-color   = "${mocha.text}";  # Chữ "Verifying" màu trắng
      
      # 4. Màu khi sai pass (Wrong)
      ring-wrong-color   = "${mocha.red}"; # Viền đỏ
      inside-wrong-color = "${mocha.base}";
      text-wrong-color   = "${mocha.red}"; # Chữ "Wrong" màu đỏ
      
      # 5. Màu khi xóa ký tự (Backspace)
      inside-clear-color = "${mocha.base}";
      ring-clear-color   = "${mocha.overlay0}"; # Viền xám
      text-clear-color   = "${mocha.overlay0}";

      # --- CẤU HÌNH CHỮ (TEXT) ---
      #font = "JetBrainsMono Nerd Font"; # Dùng font hệ thống của bạn
      font-size = 24;
      text-color = "${mocha.text}";
      
      # Ẩn dòng chữ "Type password..." đi cho gọn (chỉ hiện vòng tròn thôi)
      indicator-idle-visible = false;





    };


  };





}
