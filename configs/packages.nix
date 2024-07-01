{ config, pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    gedit
    git
    direnv
    neofetch
    lshw # for hardware information.
    htop
    tree
    openssl
    usbutils
    appimage-run
    gparted
    python3 # for scripting (add no packages here, use dev shell instead)
    sshpass
    wireguard-tools # VPN
    openvpn # VPN
    openconnect # VPN
    killall # for killing processes
    #megasync # MEGA cloud sync WARN: wait for freeimage dependency.
    networkmanagerapplet # for network applet on bar
    pavucontrol # for advanced sound control

    # Hyprland or Sway (Wayland) packages
    mesa-demos # for testing nvidia offloading. $ glxgears -info
    wofi # Application launcher
    waybar # Status bar
    pamixer # for waybar audio
    rofi-wayland # Alternate application launcher for Wayland
    xdg-desktop-portal-hyprland # XDG portals implementation for Hyprland
    xdg-desktop-portal-gtk # GTK portals for file dialogs, screenshots, etc.
    wl-clipboard # Clipboard utilities for Wayland
    swaylock # Screen locker for Wayland
    swayidle # Idle management daemon for Wayland
    swaynotificationcenter # Notification center for Sway, compatible with other Wayland compositors
    mako # notification system developed by swaywm maintainer
    swww # Wayland wallpapers
    pipewire # Audio and video routing and processing
    wireplumber # Session and policy manager for Pipewire
    qt5.qtwayland # QT5 support for Wayland
    qt6.qtwayland # QT6 support for WaylandPersonne à contacter au sujets des formations de l'[[école doctorale SPIN]]on bar
    brightnessctl # for screen brightness
    kitty # terminal
    blueberry # bluetooth manager
    stacer # system monitor
    zoom-us # video conference
    ventoy-full # makebootable usb
    nwg-look # for theming GTK apps
    qt5ct # for theming QT5 apps
    libsForQt5.qtstyleplugin-kvantum # for theming QT apps
    flameshot # screenshot
    grim # screenshot functionality
    slurp # screenshot functionality

    # Gnome apps
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-tweaks
    gnome.evince # pdf reader
    gnome.gnome-calculator
    gnome.eog # image viewer
    gnome.gnome-calendar
  ];
}