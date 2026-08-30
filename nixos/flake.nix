{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations.arixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
	      home-manager.nixosModules.home-manager
	      {
          home-manager.extraSpecialArgs = { inherit nixpkgs-unstable; };
          home-manager.users.arialdo = import ./home.nix;
        }
      ];
    };
  };
}
