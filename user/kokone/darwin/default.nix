{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
  ];

  home.stateVersion = "22.11";

  home.username = "kokone";
  home.homeDirectory = "/Users/kokone";

  home.packages = with pkgs; [
    portmidi
    lz4
  ];

  programs.zsh = {
    shellAliases = {
        update-home = "home-manager switch --flake '/Users/kokone/nix#kokone@mogbook'";
        update-system = "darwin-rebuild switch --flake '/Users/kokone/nix#mogbook'";
    };
  };
}
