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
  
  # Docker
  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  users.users.samuel.extraGroups = [
    "kvm"
    "adbusers"
    "docker"
  ];
}