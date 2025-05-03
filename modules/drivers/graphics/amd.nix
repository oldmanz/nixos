{ pkgs, lib, config, ... }: {

  options = {
    z.drivers.graphics.amd.enable = 
      lib.mkEnableOption "enables amdGraphics";
  };

  config = lib.mkIf config.z.drivers.graphics.amd.enable {
    z.drivers.graphics.hardware.enable= true;
  };

}