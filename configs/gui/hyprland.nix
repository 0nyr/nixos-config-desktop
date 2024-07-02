{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    dunst # Notification daemon
    hyprshot # Screenshot utility

    # Gnome apps
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-tweaks
    gnome.evince # pdf reader
    gnome.gnome-calculator
    gnome.eog # image viewer
    gnome.gnome-calendar
  ];

  programs.hyprland.enable = true;
  
  # Optional, hint electron apps to use wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      # https://wiki.hyprland.org/Useful-Utilities/xdg-desktop-portal-hyprland/
      #xdg-desktop-portal-wlr
      #xdg-desktop-portal-gtk # already present due to Gnome being installed.
      xdg-desktop-portal-hyprland
    ];
  };

  # secret management: https://www.reddit.com/r/NixOS/comments/1auje1p/hyprland_and_secrets_management/
  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;
  security = {
    polkit.enable = true;
    # pam.services.ags = {};
    # security.pam.services.<yourDisplayManager>.enableGnomeKeyring = true;
    pam.services.sddm.enableGnomeKeyring = true;
  };
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}