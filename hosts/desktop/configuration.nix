{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia-base.nix
  ];

  networking.hostName = "nixos-desktop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
