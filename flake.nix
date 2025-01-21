# flake.nix for /etc/nixos/
{
  description = "Custom 0nyr's NixOS configuration";

  inputs = {
    # Official NixOS package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Minecraft grub2 theme
    minegrub-theme.url = "github:0nyr/minegrub-theme"; # my fork with some fixes
  };

  outputs = {nixpkgs, ...} @ inputs: 
  let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    # replace whatever comes after nixosConfigurations with your hostname.
    # My laptop configuration
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./configuration.nix
        inputs.minegrub-theme.nixosModules.default
      ];
    };

    # development shell
    devShells.${system}.default = pkgs.mkShell {
      TEST_ENV_VAR = "Hello, world!";
    };
  };
}
