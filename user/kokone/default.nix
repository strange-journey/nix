{ config, pkgs, citrixPkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
    ../../modules/neovim
  ];

  home.username = "kokone";
  home.homeDirectory = "/home/kokone";

  home.packages = with pkgs; [
    citrix_workspace
    krita
    bitwig-studio
    wofi
  ];

  programs.git.enable = true;
  programs.git.userName = "kokone";
  programs.git.userEmail = "kokone@kupo.pw";
  programs.git.extraConfig = {
    init = {
      defaultBranch = "main";
    };
  };
  programs.git.delta.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
        ll = "ls -l";
        update-home = "home-manager switch --flake '/home/kokone/nix#kokone'";
        update-system = "sudo nixos-rebuild switch --flake '/home/kokone/nix#' --override-input nixpkgs github:nixos/nixpkgs/gnome";
    };
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    autocd = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[x](bold red)";
        vimcmd_symbol = "[<](bold green)";
      };
    };
  };

  programs.wezterm = {
    enable = true;
  };
}
