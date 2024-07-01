{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.onyr = {
    isNormalUser = true;
    description = "onyr";
    home = "/home/onyr";
    extraGroups = [ "networkmanager" "wheel" "docker" "video" "render" ];
    packages = with pkgs; [
      # applications
      firefox
      brave
      vscode.fhs
      eclipses.eclipse-java
      thunderbird
      zotero
      discord
      libreoffice
      obsidian
      pdfannots2json # command line utility for Obsidian (Zotero Integration plugin)
      krita
      inkscape
    ];
  };
}