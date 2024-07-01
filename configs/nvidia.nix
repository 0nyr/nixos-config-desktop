{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    # Video card specific - stable supports "newer" cards, production for 535 drivers
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}