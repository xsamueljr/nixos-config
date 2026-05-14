{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    jdk21
    android-studio
    
    unstable.uv
    unstable.zed-editor
    unstable.vscode
    unstable.nixd
    unstable.go
  ];

  # Android
  nixpkgs.config.android_sdk.accept_license = true;

  programs.adb.enable = true;
  users.users.samuel.extraGroups = [
    "kvm"
    "adbusers"
  ];

  virtualisation.docker.enable = true;
}