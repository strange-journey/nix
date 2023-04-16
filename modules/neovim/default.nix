{ config, pkgs, lib, ... }: rec {
  programs.neovim.enable = true;

  # home.file."${config.xdg.configHome}/nvim" = {
  #   source = ./config;
  #   recursive = true;
  # };
}
