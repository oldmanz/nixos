{ pkgs, lib, config, ... }: {

    options = {
    z.hardwareGraphics.enable = 
      lib.mkEnableOption "enables hardwareGraphics";
  };

  config = lib.mkIf config.z.hardwareGraphics.enable {
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
  };

}