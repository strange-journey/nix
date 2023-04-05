{ config, pkgs, lib, ... }: {
  imports = [ 
    ./tree-sitter-parsers.nix
  ];
}
