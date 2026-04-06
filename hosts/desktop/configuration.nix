{
  pkgs,
  ...
}:

{
  imports = [
    ../../common
    ../../common/nvidia-base.nix
  ];

  networking.hostName = "nixos-desktop";

  environment.systemPackages = with pkgs; [
    gamemode
  ];
}
