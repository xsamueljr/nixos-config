{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../common/nvidia-base.nix
  ];

  networking.hostName = "nixos-desktop";
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    gamemode
  ];

  services.displayManager.autoLogin = {
    enable = true;
    user = "samuel";
  };
}
