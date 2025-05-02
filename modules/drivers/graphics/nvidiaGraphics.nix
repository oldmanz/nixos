  { pkgs, lib, config, ... }: {

  options = {
    nvidiaGraphics.enable = 
      lib.mkEnableOption "enables nvidiaGraphics";
  };

  config = lib.mkIf config.nvidiaGraphics.enable {
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