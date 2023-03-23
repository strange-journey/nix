{
  description = "cafe alpha nix flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };
  outputs = { self, nixpkgs, home-manager, nixos-hardware }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [];
    };
  in {
    nixosConfigurations = {
      cafe-alpha = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ 
          ./system/hosts/cafe-alpha 
          ./user/kokone/system
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-yoga
        ];
      };
    };
    homeConfigurations = {
      kokone = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/kokone ];
      };
    };
  };
}
