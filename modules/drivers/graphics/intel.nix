{ pkgs, lib, config, ... }: {

  options = {
    z.drivers.graphics.intel.enable = 
      lib.mkEnableOption "enables intelGraphics";
  };

  config = lib.mkIf config.z.drivers.graphics.intel.enable {
    z.drivers.graphics.hardware.enable = true;
  };

}