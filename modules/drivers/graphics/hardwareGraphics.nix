{ pkgs, lib, config, ... }: {

    options = {
    hardwareGraphics.enable = 
      lib.mkEnableOption "enables hardwareGraphics";
  };

  config = lib.mkIf config.hardwareGraphics.enable {
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
  };

}