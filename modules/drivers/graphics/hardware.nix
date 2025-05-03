{ pkgs, lib, config, ... }: {

    options = {
    z.drivers.graphics.hardware.enable = 
      lib.mkEnableOption "enables hardwareGraphics";
  };

  config = lib.mkIf config.z.drivers.graphics.hardware.enable {
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
  };

}