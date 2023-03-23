{ config, pkgs, lib, ... }: rec {
  imports = [ ../common.nix ];

  home.username = "kokone";
  home.homeDirectory = "/home/kokone";

  home.packages = [
    pkgs.neovim
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
}
