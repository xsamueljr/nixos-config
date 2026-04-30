{ pkgs, ... }:

{
  nixpkgs.config.android_sdk.accept_license = true;

  programs.adb.enable = true;
  users.users.samuel.extraGroups = [
    "kvm"
    "abdusers"
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    androidenv.androidPkgs.androidsdk
    android-studio-full
  ];
}
