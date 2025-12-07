{lib, ...}:
{
  imports = [
    ./bluetooth.nix
    ./nvidia.nix
  ];
  # extra config

  hardware = {
    graphics.enable = true;

  };


}
