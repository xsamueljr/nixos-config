{ ... }:

{
  imports = [
    ./nix.nix
    ./dev.nix
    ./gaming.nix
    ./user.nix
    ./locale.nix

    ./audio.nix
    ./desktop.nix
    ./flatpak.nix
    ./hardware.nix
    ./network.nix
    ./packages.nix
    ./printing.nix
    ./spicetify.nix
  ];
}