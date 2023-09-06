{ config, pkgs, lib, ... }: rec {
  programs.neovim.enable = false;

  # home.file."${config.xdg.configHome}/nvim" = {
  #   source = ./config;
  #   recursive = true;
  # };
}
