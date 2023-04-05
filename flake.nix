{
  description = "my cool nix flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    hyprland.url = "github:hyprwm/hyprland";
  };
  outputs = { self, nixpkgs, darwin, home-manager, nixos-hardware, hyprland }:
  let
    linuxPkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [];
    };
  in {
    nixosConfigurations = {
      cafe-alpha = nixpkgs.lib.nixosSystem {
        pkgs = linuxPkgs;
        system = "x86_64-linux";
        modules = [ 
          ./system/hosts/cafe-alpha 
          ./user/kokone/nixos/system
          hyprland.nixosModules.default
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-yoga
        ];
      };
    };
    darwinConfigurations = {
      mogbook = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./system/hosts/mogbook
        ];
      };
    };
    homeConfigurations = {
      "kokone@cafe-alpha" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        modules = [ 
          ./user/kokone/nixos
        ];
      };
    };
  };
}
