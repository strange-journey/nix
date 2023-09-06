{ config, pkgs, lib, ... }: rec {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29.override {
      withNativeCompilation = true;
      withTreeSitter = true;
    };
    # doomPrivateDir = ./doom.d;
  };
}
