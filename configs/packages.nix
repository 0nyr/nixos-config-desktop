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