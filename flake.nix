{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-v3 = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          localSystem = {
            gcc.arch = "x86-64-v3";
            gcc.tune = "x86-64-v3";
          };
        };
      };
    in
    {
      nixosConfigurations = {
        nixos-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            pkgs-v3 = pkgs-v3;
          };
          modules = [
            ./hosts/laptop/configuration.nix
            ./common/home.nix
          ];
        };

        nixos-desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            pkgs-v3 = pkgs-v3;
          };
          modules = [
            ./hosts/desktop/configuration.nix
            ./common/home.nix
          ];
        };
      };
    };
}
