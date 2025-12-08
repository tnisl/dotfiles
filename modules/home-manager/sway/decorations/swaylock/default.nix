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

      # base
      inside-color = "${mocha.base}88"; 
      ring-color   = "${mocha.blue}";   
      
      # typing
      key-hl-color = "${mocha.green}";
      bs-hl-color = "${mocha.red}";
      
      # verifying
      ring-ver-color   = "${mocha.yellow}"; 
      inside-ver-color = "${mocha.base}";  
      text-ver-color   = "${mocha.text}";  
      
      # wrong
      ring-wrong-color   = "${mocha.red}";
      inside-wrong-color = "${mocha.base}";
      text-wrong-color   = "${mocha.red}"; 
      
      inside-clear-color = "${mocha.base}";
      ring-clear-color   = "${mocha.overlay0}"; 
      text-clear-color   = "${mocha.overlay0}";

      font-size = 24;
      text-color = "${mocha.text}";
      
      indicator-idle-visible = false;





    };


  };





}
