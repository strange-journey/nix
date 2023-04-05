{ config, pkgs, lib, ... }: rec {
  programs.neovim.enable = true;
  programs.neovim.plugins = [
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
  ];

  home.file."${config.xdg.configHome}/nvim" = {
    source = ./config;
    recursive = true;
  };
}
