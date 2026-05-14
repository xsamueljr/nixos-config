{ pkgs, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    gamemode
    steam-run
    lutris
    heroic

    unstable.protonplus
  ];
}