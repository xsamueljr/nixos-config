{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Paquetes del canal estable (25.11)
    git
    vscode
    jdk21
    
    # Paquetes del canal unstable gracias al overlay
    unstable.uv
    unstable.zed-editor
    unstable.nixd
    unstable.go
  ];

  # Configuración específica de dev que antes estaba en common/android-dev.nix
  programs.adb.enable = true;

  virtualisation.docker.enable = true;
}