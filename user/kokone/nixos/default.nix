{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
    ../../../modules/neovim/nixos
  ];

  home.stateVersion = "22.11";

  home.username = "kokone";
  home.homeDirectory = "/home/kokone";

  home.packages = with pkgs; [
    citrix_workspace
    krita
    bitwig-studio
    wofi
  ];

  programs.git.userName = "kokone";
  programs.git.userEmail = "kokone@kupo.pw";
  programs.git.delta.enable = true;

  programs.zsh = {
    shellAliases = {
        update-home = "home-manager switch --flake '/home/kokone/nix#kokone@cafe-alpha'";
        update-system = "sudo nixos-rebuild switch --flake '/home/kokone/nix#cafe-alpha' --override-input nixpkgs github:nixos/nixpkgs/gnome";
    };
  };

  programs.wezterm = {
    enable = true;
  };
}
