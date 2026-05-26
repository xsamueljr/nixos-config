{ inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.samuel = {
    isNormalUser = true;
    description = "samuel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    users.samuel = import ../home.nix;
  };
}
