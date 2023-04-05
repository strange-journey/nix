{ config, pkgs, lib, ... }: rec {
  imports = [ 
    ./common.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.build-users-group = "nixbld";

  environment.systemPackages = with pkgs; [
    ripgrep
  ];

  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
