{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ../common.nix
    ../../modules/neovim
  ];

  # TODO: anything that's cross-compatible with nix-darwin 
  # rn i have no idea what is, so everything is in nixos module
}
