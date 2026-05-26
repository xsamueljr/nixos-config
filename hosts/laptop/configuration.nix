{ ... }:

{
  imports = [
    ../../modules/nvidia-base.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-laptop";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # cositas pa que furule la red
  # 1. firmware propietario
  hardware.enableRedistributableFirmware = true;

  # 2. ahorro de energía que le chincha a la tarjeta + algo de un github
  boot.kernelParams = [
    "pcie_aspm=off"
    "mt7921_common.disable_clc=1"
  ];

  # 3. evita que el driver se duerma
  boot.extraModprobeConfig = ''
    options mt7921e amsdu_disable=1
  '';

  # 4. algo más de wifi potencia
  networking.networkmanager.wifi.powersave = false;
  networking.networkmanager.settings.wifi.backend = "iwd";
  networking.wireless.iwd.enable = true;

  hardware.nvidia = {
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
