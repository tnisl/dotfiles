{ pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    
    # 1. Tên gói trong Nixpkgs
    # Thay 'pkgs.catppuccin-cursors...' bằng cái này:
    package = pkgs.bibata-cursors;
    
    # 2. Tên giao diện (Theme Name)
    # BẮT BUỘC phải viết đúng y hệt dòng dưới đây.
    # Mặc định nó là màu tối (đen viền trắng) giống macOS.
    name = "Bibata-Mordern-Ice"; 
    
    # Kích thước (24 là chuẩn, muốn to như Mac thì để 32)
    size = 24; 
  };
  
  # ...
}
