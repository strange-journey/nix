{ config, lib, pkgs, modulesPath, ... }: {
  imports = [ 
    ../../nixos.nix
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  networking.hostName = "musashino";
  time.timeZone = "America/Los_Angeles";

  # boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "rtsx_pci_sdmmc" ];
  # boot.initrd.kernelModules = [ "dm-snapshot" ];
  # boot.kernelModules = [ "kvm-intel" ];
  # boot.extraModulePackages = [ ];

  # boot.initrd.luks.devices.luksroot = {
  #     device = "/dev/disk/by-uuid/9ea35dd8-16cf-4161-a726-2882260efc9b";
  # };

  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/8931c378-4b8f-4432-98f7-4d7fed3465f2";
  #     fsType = "btrfs";
  #     options = [ "subvol=@" ];
  #   };

  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/BEB8-50CA";
  #     fsType = "vfat";
  #   };

  # swapDevices =
  #   [ { device = "/dev/disk/by-uuid/cb59f7ef-4cce-4c09-89b2-eacbd659e092"; }
  #   ];
}
