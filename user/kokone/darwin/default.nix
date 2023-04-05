{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
  ];

  home.stateVersion = "22.11";

  home.username = "kokone";
  home.homeDirectory = "/Users/kokone";

  programs.zsh = {
    enable = true;
    shellAliases = {
        ll = "ls -l";
        update-home = "home-manager switch --flake '/Users/kokone/nix#kokone@mogbook'";
        update-system = "darwin-rebuild switch --flake '/Users/kokone/nix#mogbook'";
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
}
