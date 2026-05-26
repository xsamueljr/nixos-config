{ pkgs, pkgs-v3, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  boot.kernelPackages = pkgs-v3.linuxPackages_latest;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse3
      icu
      nss
      openssl
      curl
      expat
      fontconfig
      freetype
      harfbuzz
      libpng

      xorg.libX11
      xorg.libXcursor
      xorg.libXdamage
      xorg.libXext
      xorg.libXfixes
      xorg.libXi
      xorg.libXrender
      xorg.libXtst
      xorg.libICE
      xorg.libSM
      libGL
      libpulseaudio

      vulkan-loader

      keyutils
      libgcc.lib
    ];
  };
}
