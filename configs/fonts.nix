{ config, pkgs, lib, ...}:

{
  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      # Names of fonts to use:
      # -Tinos: Tinos
      # -FiraCode: Fira Code
      # -JetBrainsMono: 'JetBrainsMono Nerd Font'
      "FiraCode" "JetBrainsMono" "Tinos"
    ]; })
  ];
}