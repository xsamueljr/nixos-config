{ pkgs, ... }:

{
  nixpkgs.config.android_sdk.accept_license = true;

  users.users.samuel.extraGroups = [
    "kvm"
    "abdusers"
  ];

  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
  ];
}
