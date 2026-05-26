{ pkgs, pkgs-v3, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages =
    (with pkgs; [
      pkgs-v3.wget
      pkgs-v3.curl
      pkgs-v3.aria2
      pkgs-v3.bat
      pkgs-v3.tree
      pkgs-v3.git
      pkgs-v3.micro
      pkgs-v3.openssh

      vlc
      obs-studio
      vscode
      gnome-tweaks
      obsidian
      brave
      vesktop
      telegram-desktop

      jdk21
      jetbrains.idea-oss
      docker-compose

      pkgs-v3.fastfetch
      btop

      nh
      nix-output-monitor
      nvd
    ])
    ++ (with unstable; [
      zed-editor
      nil
      nixd
      bun
      go
      opencode
    ]);
}
