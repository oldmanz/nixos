{
  description = "Nixos config flake";
     
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs:
  {
    nixosConfigurations = nixpkgs.lib.genAttrs ["PZ"] (hostName: nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          { networking.hostName = hostName; }
          { networking.hostId = "72439742";}
          inputs.disko.nixosModules.default
          (import ./hosts/${hostName}/disko.nix { device = "/dev/nvme0n1"; })
          inputs.home-manager.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          ./hosts/${hostName}/configuration.nix
          ./modules
        ];
      });
    };
  }
