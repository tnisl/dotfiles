{pkgs, ...}:

{

  programs.foot = {
  enable = true;
  
  server.enable = true;
  
  settings = {
    main = {
      font = "CaskaydiaCove Nerd Font:size=11";
      
        # pad = "20x20";
      
      # Khi resize cửa sổ, không hiện cái khung bao quanh
      resize-by-cells = "no";
    };

    # Cấu hình chuột
    mouse = {
      hide-when-typing = "yes";
    };

    colors = {
      alpha = "0.9";
      
      # --- Theme Catppuccin Mocha ---
      foreground = "cdd6f4"; # Text
      background = "1e1e2e"; # Base
      
      regular0 = "45475a";   # Surface 1
      regular1 = "f38ba8";   # Red
      regular2 = "a6e3a1";   # Green
      regular3 = "f9e2af";   # Yellow
      regular4 = "89b4fa";   # Blue
      regular5 = "f5c2e7";   # Pink
      regular6 = "94e2d5";   # Teal
      regular7 = "bac2de";   # Subtext 1
      
      bright0  = "585b70";   # Surface 2
      bright1  = "f38ba8";   # Red
      bright2  = "a6e3a1";   # Green
      bright3  = "f9e2af";   # Yellow
      bright4  = "89b4fa";   # Blue
      bright5  = "f5c2e7";   # Pink
      bright6  = "94e2d5";   # Teal
      bright7  = "a6adc8";   # Subtext 0
    };
  };




};

}
