# flake.nix for /etc/nixos/
{
  description = "Custom 0nyr's NixOS configuration";

  inputs = {
    # Official NixOS package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Minecraft grub2 theme
    minegrub-theme.url = "github:0nyr/minegrub-theme"; # my fork with some fixes

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {nixpkgs, ...} @ inputs: 
  let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # Machine-based system configurations
    nixosConfigurations = {
      "Aezyr-Workstation" = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs.inputs = inputs;
        modules = [ ./hosts/aezyr/configuration.nix ];
      };
    };

    # development shell
    devShells.${system}.default = pkgs.mkShell {
      TEST_ENV_VAR = "Hello, world!";
    };
  };
}
