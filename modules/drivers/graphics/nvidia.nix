  { pkgs, lib, config, ... }: {

  options = {
    z.drivers.graphics.nvidia.enable = 
      lib.mkEnableOption "enables nvidiaGraphics";
  };

  config = lib.mkIf config.z.drivers.graphics.nvidia.enable {
    z.drivers.graphics.hardware.enable = true;
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