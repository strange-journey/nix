{ config, pkgs, lib, ... }: rec {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.max-jobs = "auto";

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = with pkgs; [ zsh ];
}
