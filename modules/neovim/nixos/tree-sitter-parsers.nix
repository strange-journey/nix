{ config, pkgs, lib, ... }:
let 
  grammars = pkgs.tree-sitter.builtGrammars; 
in {
  home.file = with lib; mapAttrs' (k: v: nameValuePair "${config.xdg.configHome}/nvim/parser/${replaceStrings ["-"] ["_"] (removePrefix "tree-sitter-" k)}.so" { source = "${v}/parser"; }) grammars;
}
