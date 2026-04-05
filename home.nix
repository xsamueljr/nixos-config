{ config, pkgs, ... }:
{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";
  home.stateVersion = "25.11";

  home.backupFileExtension = "hm-backup";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "i use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
  };

  programs.git = {
    enable = true;
    userName = "samuel";
    userEmail = "git@xsamueljr.anonaddy.me";
  };

  programs.home-manager.enable = true;
}
