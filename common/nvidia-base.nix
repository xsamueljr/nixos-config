{
  ...
}:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false; # driver propietario
    nvidiaSettings = true;
  };
}
