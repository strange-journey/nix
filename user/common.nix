{ config, pkgs, lib, ... }: rec {
  home.stateVersion = "22.11";

  programs.home-manager.enable = true;
}
