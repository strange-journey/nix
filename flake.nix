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
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
  };
  outputs = { self, nixpkgs, darwin, home-manager, nixos-hardware, hyprland, nix-doom-emacs }:
  let
    linuxPkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [];
    };
    darwinPkgs = import nixpkgs {
      system = "aarch64-darwin";
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
      musashino = nixpkgs.lib.nixosSystem {
        pkgs = linuxPkgs;
        system = "x86_64-linux";
        modules = [
          ./system/hosts/musashino
          ./user/kokone/nixos/system
        ];
      };
    };
    darwinConfigurations = {
      mogbook = darwin.lib.darwinSystem {
        pkgs = darwinPkgs;
        system = "aarch64-darwin";
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
      "kokone@mogbook" = home-manager.lib.homeManagerConfiguration {
        pkgs = darwinPkgs;
        modules = [
          ./user/kokone/darwin
	  nix-doom-emacs.hmModule
        ];
      };
    };
  };
}
