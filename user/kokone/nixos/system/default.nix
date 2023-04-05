{ config, pkgs, lib, ... }: rec {
  users.users.kokone = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
}
