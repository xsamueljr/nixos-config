{ config, pkgs, ... }:
{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config";
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user.name = "xsamueljr";
      user.email = "git@xsamueljr.anonaddy.me";
      init.defaultBranch = "main";
    };
  };

  programs.home-manager.enable = true;
}
