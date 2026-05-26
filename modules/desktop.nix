{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
