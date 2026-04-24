{ ... }:
{
  home.username = "samuel";
  home.homeDirectory = "/home/samuel";
  home.stateVersion = "25.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-config";
      zed = "zeditor";
    };
    initExtra = ''
      function mkcd() {
        mkdir -p $1 && cd $1
      }
    '';
  };

  programs.git = {
    enable = true;

    settings = {
      user.name = "xsamueljr";
      user.email = "git@xsamueljr.anonaddy.me";
      init.defaultBranch = "main";
    };
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrains Mono";
      background-opacity = 0.8;
    };
  };

  programs.home-manager.enable = true;
}
