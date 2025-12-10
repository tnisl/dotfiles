{ pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    
    package = pkgs.bibata-cursors;
    
    name = "Bibata-Mordern-Ice"; 
    
    size = 24; 
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-blue-standard";
    
    package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ]; 
        size = "standard";
        variant = "mocha";    
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "gtk2";
  };

  home.packages = with pkgs; [
    kdePackages.qt6gtk2      # Plugin để Qt6 dùng được style 'gtk2'
    libsForQt5.qtstyleplugins # Plugin tương tự cho Qt5
  ];
  
}
