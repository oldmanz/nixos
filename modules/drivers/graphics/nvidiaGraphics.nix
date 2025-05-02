  { pkgs, lib, config, ... }: {

  options = {
    z.nvidiaGraphics.enable = 
      lib.mkEnableOption "enables nvidiaGraphics";
  };

  config = lib.mkIf config.z.nvidiaGraphics.enable {
    hardwareGraphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
    };

  };

}