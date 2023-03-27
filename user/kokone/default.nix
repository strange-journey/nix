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
