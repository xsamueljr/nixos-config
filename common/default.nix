# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  inputs,
  ...
}:
let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  # Use latest kernel compiled with CPU optimizations.
  hardware.cpu.intel.updateMicrocode = true;

  nixpkgs.config.packageOverrides = pkgs: {
    linux_optimizado = pkgs.linuxPackages_latest.extend (
      self: super: {
        kernel = super.kernel.override {
          argsOverride = {
            stdenv = pkgs.withCFlags [ "-march=native" "-O3" "-pipe" "-Wno-error" ] pkgs.stdenv;
          };
        };
      }
    );
  };

  boot.kernelPackages = pkgs.linux_optimizado;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # fuente chuli
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.samuel = {
    isNormalUser = true;
    description = "samuel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages =
    (with pkgs; [
      # CLI utils / apps
      wget
      curl
      aria2
      bat
      tree
      git
      micro
      openssh

      # Desktop apps
      vlc
      obs-studio
      vscode
      gnome-tweaks
      obsidian
      brave
      vesktop
      telegram-desktop

      # Development
      jdk21
      jetbrains.idea-oss
      docker-compose

      # to flex
      fastfetch
      btop

      # Nix-specific utilities
      nh
      nix-output-monitor
      nvd
    ])
    ++ (with unstable; [
      zed-editor
      nil # nix language server
      nixd # another one lol
      bun
      go
      opencode
    ]);
  services.flatpak.enable = true;

  # nix-ld with common libraries so a lot of binaries work
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Librerías base que casi todo el mundo necesita
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

      # Si vas a ejecutar apps gráficas o juegos, añade estas:
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

      # LSPs de Zed
      keyutils
      libgcc.lib
    ];
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
    theme = spicePkgs.themes.starryNight;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
